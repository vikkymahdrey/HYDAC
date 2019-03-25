package com.team.app.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.app.constant.AppConstants;
import com.team.app.dao.BillsDao;
import com.team.app.dao.UserDeviceMappingDao;
import com.team.app.dao.UserInfoDao;
import com.team.app.dao.WaterSourceDao;
import com.team.app.domain.BillingConstraints;
import com.team.app.domain.BillingSlabs;
import com.team.app.domain.Bills;
import com.team.app.domain.BillsChild;
import com.team.app.domain.TblKeywordType;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.domain.WaterSources;
import com.team.app.logger.AtLogger;
import com.team.app.service.BillingService;
import com.team.app.service.KeywordService;
import com.team.app.service.OrganisationService;
import com.team.app.utils.DateUtil;

@Controller
public class BillingController {
	private final AtLogger logger = AtLogger.getLogger(BillingController.class);

	@Autowired
	private OrganisationService organisationService;
	
	@Autowired
	private KeywordService keywordService;
	
	@Autowired
	private WaterSourceDao waterSourcedao;
	
	@Autowired
	private BillingService billingservice;
	@Autowired
	UserInfoDao userdao;
	
	@Autowired
	UserDeviceMappingDao udmdao;
	
	@Autowired
	BillsDao billsDao;
	
	
	
     @RequestMapping("adminbillpay")
	@ResponseBody
	public String paybillbyadmin(HttpServletRequest request,@RequestParam(required = false, value = "billid")String billid
			,@RequestParam(required = false, value = "rownum")String row
			){
		

	TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
	String userid = user.getId();
		
	  Bills bill =   billsDao.getBillsById(Integer.parseInt(billid));
	    bill.setPayment_status("Paid");
	    Date payedtime = DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss");
	    bill.setBill_payed_time(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
	    bill.setPaymentsrc("admin");
	    bill.setAdminid(userid);
	    billsDao.save(bill);
	       
	
	
	return "success="+row+"$time="+payedtime;
	

}
	
	
	
	
	@RequestMapping("adminbillpage")
	
	public String adminbillpag(){
		
		
	return "adminbillspage";
	}
	
	
	
	@RequestMapping("getbillsfororg")
	@ResponseBody
	public JSONArray getbillsfororg(@RequestParam(required = false, value = "fromDate")String fromDate,
			@RequestParam(required = false, value = "toDate")String toDate,
			HttpServletRequest request){
		
		JSONArray returnarray = new JSONArray();
		
		TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
		String userid = user.getId();
		UserDeviceMapping adimudm = null;
		if(userid != null) {
			adimudm=	udmdao.getUDMbyuserId(userid);
		}
		
		 Date from=null;
		 Date to = null;
		   
				
				 try {
					to=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(toDate);
					 from=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(fromDate);
				} catch (java.text.ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
		
				 List<Bills> returns = billsDao.getBillsForrange(from, to, adimudm.getOrgId());
				 
						 
						for(Bills b:returns) {
							
							JSONObject eachbill = new JSONObject();
							eachbill.put("billid",b.getId() );
							eachbill.put("userid",b.getUser().getId() );
							eachbill.put("flat",b.getUser().getFlat() );
							eachbill.put("username",b.getUser().getUname() );
							eachbill.put("billamount",b.getPayable_amount());
							eachbill.put("status",b.getPayment_status());
							eachbill.put("payedDate",b.getBill_payed_time());
							
							
							returnarray.add(eachbill);
						}
						 
	return	returnarray;
		
		
	}
	
	
	@GetMapping("generatedrange")
	@ResponseBody
	public Map<String,String> generatedrange(HttpServletRequest request) {
	TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
	String userid = user.getId();
	UserDeviceMapping adimudm = null;
	if(userid != null) {
		adimudm=	udmdao.getUDMbyuserId(userid);
	}
	List<Bills> dates = billsDao.getgeneratedbillsDate(adimudm.getOrgId());
Map<String,String> returnmap = new HashMap<String,String>();
	




	for(Bills b:dates) {
		
		returnmap.put(b.getBill_from_time().toString(), b.getBill_to_time().toString());
	}
	

	
	return returnmap;
	
	}
	
	
	@GetMapping("lastbilleddate")
	@ResponseBody
	public String lastbilleddate(HttpServletRequest request) {
		 TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
			String userid = user.getId();
			UserDeviceMapping adimudm = null;
			if(userid != null) {
				adimudm=	udmdao.getUDMbyuserId(userid);
			}
			
	if(billsDao.getmaxBills(adimudm.getOrgId()).size() > 0 ) {
		return ""+billsDao.getmaxBills(adimudm.getOrgId()).get(0).getBill_to_time();
		
		}
	else {
		return "";
			
	}
	
	
}
	
	
	
	

	@GetMapping("regenerate")
	@ResponseBody
	public String regeneratebill(@RequestParam(required = false, value = "fromDate")String fromDate,
			@RequestParam(required = false, value = "toDate")String toDate,
			HttpServletRequest request) {
		logger.debug("fromDate",fromDate);
		logger.debug("toDate",toDate);
         String paymentstatus="Pending";
         
         Date from=null;
		 Date to = null;
		   
				
				 try {
					to=new SimpleDateFormat("yyyy-MM-dd").parse(toDate);
					 from=new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
				} catch (java.text.ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
      
		//delete the rows
  
         billsDao.deleteBillschildPending(from, to, paymentstatus);
         billsDao.deleteBillsPending(from, to, paymentstatus);
         
		test(fromDate,toDate,request);
		
		return "success";
	}
	
	
	@GetMapping("generatebill")
	@ResponseBody
	public String test(@RequestParam(required = false, value = "fromDate")String fromDate,
			@RequestParam(required = false, value = "toDate")String toDate,
			HttpServletRequest request) {
		
		
		 Date from=null;
		 Date to = null;
		   
				
				 try {
					to=new SimpleDateFormat("yyyy-MM-dd").parse(toDate);
					 from=new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
				} catch (java.text.ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				 TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
					String userid = user.getId();
					UserDeviceMapping adimudm = null;
					if(userid != null) {
						adimudm=	udmdao.getUDMbyuserId(userid);
					}
			
			
			
			List<TblUserInfo> usersfororg = userdao.getUserListByorgAndType(Integer.parseInt(adimudm.getOrgId()));
			
			
			
			List<TblUserInfo> paidcustomers = userdao.getUserListByorgAndPaymentStatus(Integer.parseInt(adimudm.getOrgId()));// replace with paid users
			
			usersfororg.removeAll(paidcustomers);
			
			
			for(TblUserInfo u : usersfororg) {
			if(u != null)
				
			 billingservice.generateBill(from,to,u.getId());
			
			
			}
			
		    return "success";
	}
	
	
	
	@GetMapping("invConstrConfig")
	public String getInvoiceConstrains(Map<String,Object> map,HttpServletRequest request){
		
		try{
			Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
			map.put("organisations", orgMapped);
			
			List<TblKeywordType> keyTypes= keywordService.getKeywordTypes(); 
			map.put("keyTypes",keyTypes);	
		  	 
			 return "invoiceConstraints";
		}catch(Exception e){		
			HttpSession s=request.getSession();
		    s.setAttribute("statusLog",AppConstants.statusLog);
			s.setAttribute("url", request.getRequestURL());
			s.setAttribute("exception", e.toString());				
			s.setAttribute("className",Thread.currentThread().getStackTrace()[1].getClassName());
			s.setAttribute("methodName",Thread.currentThread().getStackTrace()[1].getMethodName());
			s.setAttribute("lineNumber",Thread.currentThread().getStackTrace()[1].getLineNumber());		       
		    return "redirect:/";
	    }		
}

	@GetMapping("getConstrForApp")
	@ResponseBody
	public JSONObject getConstrForApp(@RequestParam("orgId") int orgId,@RequestParam("appId") int appId){
		
	 waterSourcedao.getwaterSourceForappAndOrg(orgId);
		
	 return null;
	}
	
	@PostMapping("saveConstr")
	@ResponseBody
	public String saveCons(HttpServletRequest request) throws IOException, ParseException{
		
		
	StringBuilder sb = new StringBuilder();
    BufferedReader reader = request.getReader();
    try {
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line).append('\n');
        }
    } finally {
        reader.close();
    }
    
    JSONParser jsonParser = new JSONParser();
    
    JSONObject invoiceConstr = (JSONObject)jsonParser.parse(sb.toString());
    
    
    TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
	String userid = user.getId();
	UserDeviceMapping udm = null;
	if(userid != null) {
	udm=	udmdao.getUDMbyuserId(userid);
	}
    
    invoiceConstr.put("orgId", Long.parseLong(udm.getOrgId()));
    
   return billingservice.saveBillingConstrains(invoiceConstr).toJSONString();
    
 //   return invoiceConstr.toJSONString();
}
	
	@SuppressWarnings("unchecked")
	@GetMapping("waterSourceForappOrg")
	@ResponseBody
	public JSONArray getWaterSources(HttpServletRequest request){
		
		TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
		String userid = user.getId();
		UserDeviceMapping udm = null;
		if(userid != null) {
		udm=	udmdao.getUDMbyuserId(userid);
		}
		
	List<WaterSources> watersources =	waterSourcedao.getwaterSourceForappAndOrg(Integer.parseInt(udm.getOrgId()));
	//	List<WaterSources> watersources =	waterSourcedao.getwaterSourceForappandOrg(Integer.parseInt(udm.getOrgId()));
	JSONArray returnArray = new JSONArray();
	
	for(WaterSources water : watersources){
		JSONObject wsjson = new JSONObject();
		wsjson.put("wsId", water.getId());
		wsjson.put("wsname",water.getWaterSouce());
		JSONArray bcArray = new JSONArray();
		for(BillingConstraints bc:water.getBillingConstraint()){
		
			JSONObject bcjson = new JSONObject();
			bcjson.put("effectiveDate", bc.getEffectiveDate());
			bcjson.put("bcid",bc.getId());
			JSONArray slabsaray = new JSONArray();
			for(BillingSlabs slab:bc.getBillingSlabs()){
			
				JSONObject slabjson = new JSONObject();
				slabjson.put("Slab_number", slab.getSlabno());
				slabjson.put("units_from", slab.getUnitsFrom());
				slabjson.put("units_to", slab.getUnitsTo());
				slabjson.put("price", slab.getPricePerUnit());
				slabsaray.add(slabjson);
			}
			bcjson.put("slabs", slabsaray);
			bcArray.add(bcjson);
		}
		wsjson.put("billingConstraints", bcArray);
		returnArray.add(wsjson);
	}
	return returnArray;
	}

	@RequestMapping("getbills")
	@ResponseBody
	public List<Bills> getbills(HttpServletRequest request){
		
		TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
		
		return billingservice.getillsForUser(user.getId());
	}
	
	
	
	
	
	@RequestMapping("billDetails")
	@ResponseBody
	public List<BillsChild> detailedBill(@RequestParam("billid") int billId){
		
		
	return billingservice.getBillsChilds(billId);
	}
	

	
	@RequestMapping(value= {"/billgeneration"}, method=RequestMethod.GET)
	public String uploadUserSubscriptionHandler(Map<String,Object> map, HttpServletRequest request){
		//logger.debug("Inside /uploadUserSubscription");
		try{
			Map<String,Object> orgMapped=organisationService.getLoraServerOrganisation();	   
			map.put("organisations", orgMapped);
			
			List<TblKeywordType> keyTypes= keywordService.getKeywordTypes(); 
			map.put("keyTypes",keyTypes);	
		  	 
			 return "billgeneration";
		}catch(Exception e){
			e.printStackTrace();
			HttpSession s=request.getSession();
		    s.setAttribute("statusLog",AppConstants.statusLog);
			s.setAttribute("url", request.getRequestURL());
			s.setAttribute("exception", e.toString());				
			s.setAttribute("className",Thread.currentThread().getStackTrace()[1].getClassName());
			s.setAttribute("methodName",Thread.currentThread().getStackTrace()[1].getMethodName());
			s.setAttribute("lineNumber",Thread.currentThread().getStackTrace()[1].getLineNumber());		       
		    return "redirect:/exception";
	    }		
	}
	

	@GetMapping("watersources")
	public String getWatersource(Map<String, Object> map, HttpServletRequest request) {

		try {
			Map<String, Object> orgMapped = organisationService.getLoraServerOrganisation();
			map.put("organisations", orgMapped);

			List<TblKeywordType> keyTypes = keywordService.getKeywordTypes();
			map.put("keyTypes", keyTypes);

			return "waterSources";
		} catch (Exception e) {
			HttpSession s = request.getSession();
			s.setAttribute("statusLog", AppConstants.statusLog);
			s.setAttribute("url", request.getRequestURL());
			s.setAttribute("exception", e.toString());
			s.setAttribute("className", Thread.currentThread().getStackTrace()[1].getClassName());
			s.setAttribute("methodName", Thread.currentThread().getStackTrace()[1].getMethodName());
			s.setAttribute("lineNumber", Thread.currentThread().getStackTrace()[1].getLineNumber());
			return "redirect:/";
		}
	}

	@GetMapping("addWaterSource")
	@ResponseBody
	public String AddWaterSource(@RequestParam("orgid") int orgid, @RequestParam("appId") int appid,
			@RequestParam("watersource") String watersource, @RequestParam("i_d") int i_d,HttpServletRequest request) {

		logger.debug("Printing orgid /addWaterSource", orgid);
		logger.debug("Printing appid /addWaterSource", appid);
		logger.debug("Printing waterSource /addWaterSource", watersource);
		logger.debug("Printing wsId /addWaterSource", i_d);
		String returnVal="";

		TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
	
		String userid = user.getId();
	
		UserDeviceMapping udm = null;
		if(userid != null) {
		udm= udmdao.getUDMbyuserId(userid);
		}
		
		WaterSources ws = null;
		ws = new WaterSources();
		
		WaterSources wsname = billingservice.getwsnameByWSname(watersource);
		if ((i_d == 0) & (udm != null)){
			
			if(wsname!=null) {
				returnVal = "exists";
			}else {
			ws.setOrgid(Integer.parseInt(udm.getOrgId()));
			ws.setWaterSouce(watersource);
			waterSourcedao.save(ws);
			returnVal = "saved";
			}	
	
		}else {
			
			if((wsname != null) && (wsname.getId()!=i_d))
			{
				returnVal = "exists";
			}else {
			ws.setWaterSouce(watersource);
			billingservice.UpdateWaterSources(watersource, i_d);
			returnVal = "saved";
			}
			
		}
		
		return returnVal;
	//	return "redirect:watersource?orgId=" + orgid + "&appId=" + appid + "&watersource=" + watersource + "&i_d=" + i_d;
	}

	
	@SuppressWarnings("unchecked")
	@GetMapping("watersourceForappOrg")
	@ResponseBody
	public JSONArray getWatersources(HttpServletRequest request){
		
		TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
		String userid = user.getId();
		UserDeviceMapping udm = null;
		if(userid != null) {
		udm=	udmdao.getUDMbyuserId(userid);
		}
		
	//List<WaterSources> watersources =	waterSourcedao.getwaterSourceForappAndOrg(Integer.parseInt(udm.getOrgId()));
		List<WaterSources> watersources =	waterSourcedao.getwaterSourceForappandOrg(Integer.parseInt(udm.getOrgId()));
	JSONArray returnArray = new JSONArray();
	
	for(WaterSources water : watersources){
		JSONObject wsjson = new JSONObject();
		wsjson.put("wsId", water.getId());
		wsjson.put("wsname",water.getWaterSouce());
		JSONArray bcArray = new JSONArray();
		for(BillingConstraints bc:water.getBillingConstraint()){
		
			JSONObject bcjson = new JSONObject();
			bcjson.put("effectiveDate", bc.getEffectiveDate());
			bcjson.put("bcid",bc.getId());
			JSONArray slabsaray = new JSONArray();
			for(BillingSlabs slab:bc.getBillingSlabs()){
			
				JSONObject slabjson = new JSONObject();
				slabjson.put("Slab_number", slab.getSlabno());
				slabjson.put("units_from", slab.getUnitsFrom());
				slabjson.put("units_to", slab.getUnitsTo());
				slabjson.put("price", slab.getPricePerUnit());
				slabsaray.add(slabjson);
			}
			bcjson.put("slabs", slabsaray);
			bcArray.add(bcjson);
		}
		wsjson.put("billingConstraints", bcArray);
		returnArray.add(wsjson);
	}
	return returnArray;
	}

	
}