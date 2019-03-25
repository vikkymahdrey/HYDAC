package com.team.app.service;

import java.util.Date;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.Bills;
import com.team.app.domain.BillsChild;
import com.team.app.domain.WaterSources;

public interface BillingService {

	public JSONObject saveBillingConstrains(JSONObject billingConstr);
	
	public JSONObject generateBill(Date fromDate,Date toDate,String userid) ;
	
	public float addBillToDb(Date constraintDate,WaterSources ws,int consumption,Date from,Date to,String deviceId,Bills bills);
	
	public List<Bills> getillsForUser(String userid);
	
	public List<BillsChild> getBillsChilds(int billid);
	
	public void UpdateWaterSources(String watersource, int id);
	
	public WaterSources getwsnameByWSname(String watersource);
	
}
