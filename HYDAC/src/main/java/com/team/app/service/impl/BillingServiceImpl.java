package com.team.app.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.dao.BillingConstraintsDao;

import com.team.app.dao.BillingSlabsDao;
import com.team.app.dao.BillsChildDao;
import com.team.app.dao.BillsDao;
import com.team.app.dao.UserInfoDao;
import com.team.app.dao.WaterSourceDao;
import com.team.app.domain.BillingConstraints;
import com.team.app.domain.BillingSlabs;
import com.team.app.domain.Bills;
import com.team.app.domain.BillsChild;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.domain.WaterSources;
import com.team.app.service.BillingService;
import com.team.app.service.ConsumerInstrumentService;


@Service
public class BillingServiceImpl implements BillingService {

	@Autowired
	private BillingConstraintsDao billingConstrdao;

	@Autowired
	private BillingSlabsDao slabsDao;

	@Autowired
	private WaterSourceDao watersourcedao;

	@Autowired
	private UserInfoDao userInfoDao;
	
	
	@Autowired
	private BillsChildDao billsChildDao;
	
	@Autowired
	private BillsDao billsDao;
	
	@Autowired
	private ConsumerInstrumentService consumerService;

	public JSONObject saveBillingConstrains(JSONObject billingConstr) {

		String waterSourceID = (String) billingConstr.get("waterSourceId");

		String effectiveDate = (String) billingConstr.get("effectiveDate");
		int orgId = ((Long) billingConstr.get("orgId")).intValue();

		//int appId = ((Long) billingConstr.get("appId")).intValue();

		WaterSources ws = watersourcedao.getwaterSourceForId(Integer.parseInt(waterSourceID));

		BillingConstraints billingCons = new BillingConstraints();
		billingCons.setWaterSourceId(ws);
		billingCons.setOrgId(orgId);
		//billingCons.setAppId(appId);
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(effectiveDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
/*
		if (billingConstrdao.getBillingConsForDateAndAbove(date,ws.getId()).size() > 0) {

			billingConstrdao.delete(billingConstrdao.getBillingConsForDateAndAbove(date,ws.getId()));

		}*/
		billingCons.setEffectiveDate(date);
		billingConstrdao.save(billingCons);

		JSONObject slabs = (JSONObject) billingConstr.get("slabs");

		int slabNumber = slabs.size();

		for (int i = 1; i <= slabNumber; i++) {

			String fromUnit = (String) ((JSONObject) slabs.get("" + i)).get("fromUnit");
			String toUnit = (String) ((JSONObject) slabs.get("" + i)).get("toUnit");
			String price = (String) ((JSONObject) slabs.get("" + i)).get("pricePerunit");

			BillingSlabs slab = new BillingSlabs();
			slab.setPricePerUnit(Float.parseFloat(price));
			slab.setSlabno(i);
			slab.setUnitsFrom(Integer.parseInt(fromUnit));
			slab.setUnitsTo(Integer.parseInt(toUnit));
			slab.setBillCons(billingCons);
			slabsDao.save(slab);
		}

		JSONObject json = new JSONObject();
		json.put("d", slabNumber);

		return json;
	}

	@Override
	public JSONObject generateBill(Date fromDate,Date toDate,String userid) {

		
Bills bills = new Bills();
bills.setBill_from_time(fromDate);
bills.setBill_to_time(toDate);
bills.setBill_generated_time(new Date());
bills.setBill_generated_source("-----");
bills.setBill_generator_id(1);
bills.setPayment_status("Pending");
TblUserInfo user = userInfoDao.getUserByUserId(userid);
bills.setUser(user);
bills.setOrgid(""+user.getOrgId());
billsDao.save(bills);

float totalpriceforbill = 0;


		List<UserDeviceMapping> allDevices = user.getUserDeviceMappings();

		for (UserDeviceMapping udm : allDevices) {

			
			
			WaterSources ws = udm.getWaterSourceId();

			if(ws == null) {
				
				continue;
			}
			
			List<BillingConstraints> billingConstraints = ws.getBillingConstraint();

               if(billingConstraints == null) {
				
				continue;
			   }
			
			Map<Date, Date> fromTOdate = new LinkedHashMap<Date, Date>();

			List<Date> partitions = new ArrayList<Date>();

			Date lastEffecDate = null;

			boolean atleastEffectiveDate = false;

			if (billingConstraints.size() == 0) {
				
				continue;
			
			} else if (billingConstraints.size() > 0) {

				for (BillingConstraints bc : billingConstraints) {

					Date effectiveDate = bc.getEffectiveDate();

					if (effectiveDate.compareTo(fromDate) > 0 & effectiveDate.compareTo(toDate) < 0) {

						partitions.add(effectiveDate);

					} else if (effectiveDate.compareTo(fromDate) <= 0) {

						if (lastEffecDate == null) {
							lastEffecDate = effectiveDate;

						} else {

							if (lastEffecDate.compareTo(effectiveDate) <= 0) {

								lastEffecDate = effectiveDate;
							}
						}

						atleastEffectiveDate = true;

					} else {

						
					}

				}

				if (partitions.size() == 0 & atleastEffectiveDate) {
					fromTOdate.put(fromDate, toDate);

				} else if (partitions.size() == 1 & atleastEffectiveDate) {

					fromTOdate.put(fromDate, partitions.get(0));
					fromTOdate.put(partitions.get(0), toDate);

				} else if (partitions.size() > 1 & atleastEffectiveDate) {

					Collections.sort(partitions);
					Date startDate = fromDate;
					for (Date d : partitions) {
						fromTOdate.put(startDate, d);
						startDate = d;
					}
					fromTOdate.put(startDate, toDate);
				} else {

					// no valid from date please make sure you have effective date before from date
				}
			} else {

				// no constraints so there is nothing to calculate // no constraints defined for
				// the device
			}

			if (!atleastEffectiveDate) {

				// there is no effective date starting before from date in the configuration i.e
				// in the database;

				continue;
			}

			Object[] frames;

			int lastEffectivedateToken = 0;

			for (Map.Entry<Date, Date> entry : fromTOdate.entrySet()) {

				try {

					frames = consumerService.getUserDashboardGraphOnSubmit(udm.getDevEUI(), entry.getKey(),
							entry.getValue(), "days");

					if (String.valueOf(frames[0]) != null && !String.valueOf(frames[0]).isEmpty()) {
						String[] result = String.valueOf(frames[0]).split(",");

						int consumtioninInterval = 0;

						for (int i = 0; i < result.length; i++) {
							String[] jsonVal = result[i].split("&");
							JSONObject js = null;

							consumtioninInterval += Integer.parseInt(jsonVal[1]);

						}
						if (lastEffectivedateToken == 0) {

							float returntotalprice = addBillToDb(lastEffecDate, udm.getWaterSourceId(), consumtioninInterval,entry.getKey(),entry.getValue(),udm.getDevNode(),bills);

							totalpriceforbill = totalpriceforbill + returntotalprice;
							
						} else {
							float returntotalprice =	addBillToDb(entry.getKey(), udm.getWaterSourceId(), consumtioninInterval,entry.getKey(),entry.getValue(),udm.getDevNode(),bills);

							totalpriceforbill = totalpriceforbill + returntotalprice;
						}

					} else {

					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				lastEffectivedateToken++;
			}

		}

		
		bills.setPayable_amount(totalpriceforbill);
		
		billsDao.save(bills);
		
		return null;
	}

	@Override
	public float addBillToDb(Date constraintDate, WaterSources ws, int consumption,Date from,Date to,String deviceId,Bills bills) {

		List<BillingConstraints> bcs = billingConstrdao.getBillingIdForWaterSourceAndEffective(constraintDate,ws.getId());
		
		
		
		List<BillingSlabs> slablist = bcs.get(0).getBillingSlabs();
		
		System.err.println(slablist.size());
		int consumptionToBill = consumption;
		float defaultprice = 0;
        float totalpricetoreturn=0;
        
		for (BillingSlabs slab : slablist) {
			float price;
			BillsChild bilchi = new BillsChild();
			
			if (consumption >= slab.getUnitsTo()) {
				consumptionToBill = consumption - slab.getUnitsTo();
				price = (slab.getUnitsTo() - slab.getUnitsFrom()) * slab.getPricePerUnit();
				defaultprice = slab.getPricePerUnit();
			
			   // bilchi.setBillingSlab(slab);
                bilchi.setDeviceId(deviceId);				
			bilchi.setPayable_per_consumption_per_slab_per_device(price);
			bilchi.setWaterConsumtionFrom(from);
			bilchi.setWaterConsumtionTo(to);
			bilchi.setConsumptionperslab(slab.getUnitsTo() - slab.getUnitsFrom());
			bilchi.setBills(bills);
			
			bilchi.setPriceappliedperltr(slab.getPricePerUnit());
			bilchi.setWsName(ws.getWaterSouce());
		
			billsChildDao.save(bilchi);
			totalpricetoreturn = totalpricetoreturn +price;
			}
			else if(consumption <= slab.getUnitsTo() ) {
				price = consumptionToBill * slab.getPricePerUnit();
				
				//bilchi.setBillingSlab(slab);
	            bilchi.setDeviceId(deviceId);				
				bilchi.setPayable_per_consumption_per_slab_per_device(price);
				bilchi.setWaterConsumtionFrom(from);
				bilchi.setWaterConsumtionTo(to);
				bilchi.setBills(bills);
				bilchi.setConsumptionperslab(consumptionToBill);
				bilchi.setPriceappliedperltr(slab.getPricePerUnit());
				bilchi.setWsName(ws.getWaterSouce());
			   
				billsChildDao.save(bilchi);
				totalpricetoreturn = totalpricetoreturn +price;
				consumptionToBill = 0;
				defaultprice = 0;
			}
			
			
}
		BillsChild bilchi = new BillsChild();
		float remaingconsumptionPrice = defaultprice * consumptionToBill;
	
        bilchi.setDeviceId(deviceId);		
		bilchi.setWaterConsumtionFrom(from);
		bilchi.setWaterConsumtionTo(to);
	bilchi.setPayable_per_consumption_per_slab_per_device(remaingconsumptionPrice);
	bilchi.setWaterConsumtionFrom(from);
	bilchi.setWaterConsumtionTo(to);
	bilchi.setBills(bills);
	bilchi.setConsumptionperslab(consumptionToBill);
	bilchi.setPriceappliedperltr(defaultprice);
	bilchi.setWsName(ws.getWaterSouce());
	billsChildDao.save(bilchi);
	totalpricetoreturn = totalpricetoreturn +remaingconsumptionPrice;
		return totalpricetoreturn;
	}

	
	
	@Override
	public List<Bills> getillsForUser(String userid) {
	System.err.println(userid);	
		
	List<Bills> billsForuser = billsDao.getBillsForUser(userid);
	for(Bills b:billsForuser) {
		b.setBillsChild(null);
		b.setUser(null);
	}
	return billsForuser;
	}

	@Override
	public List<BillsChild> getBillsChilds(int billid) {
		List<BillsChild> b =  billsChildDao.getBillsById(billid);
		
		for(BillsChild bc:b) {
			
			bc.setBills(null);
		}
		
		return b;
	}


	public void UpdateWaterSources(String watersource, int id) {
		watersourcedao.UpdateWaterSources(watersource, id);
	}

	
	public WaterSources getwsnameByWSname(String watersource) {
		
		return watersourcedao.getwsnameByWSname(watersource);
	}

	
	

}
