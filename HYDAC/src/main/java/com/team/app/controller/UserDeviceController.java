package com.team.app.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team.app.dao.ConsumptionsLtrDao;
import com.team.app.dao.UserDeviceMappingDao;
import com.team.app.dao.UserInfoDao;
import com.team.app.dao.WaterSourceDao;
import com.team.app.domain.TblConsumptionsConfig;
import com.team.app.domain.TblSyncingChecker;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.domain.WaterSources;
import com.team.app.logger.AtLogger;
import com.team.app.service.LoraSyncingService;
import com.team.app.service.OrganisationService;
import com.team.app.utils.UploadExcel;

@Controller
public class UserDeviceController {

	private static final AtLogger logger = AtLogger.getLogger(UserInfoController.class);

	@Autowired
	private OrganisationService organisationService;

	@Autowired
	private UploadExcel excelupload;

	@Autowired
	UserDeviceMappingDao udmdao;

	@Autowired
	private UserInfoDao userInfoDao;

	@Autowired
	private UserDeviceMappingDao userDevicedao;

	@Autowired
	private WaterSourceDao wsdao;
	
	@Autowired
	private ConsumptionsLtrDao consumltrdao;
	
	
	@Autowired
	private LoraSyncingService loraSyncingService;
	
	@GetMapping("/userdevicewatersource")
	public String userdevicewatersource() {
		
		return "userdevicewatersource";
	}
	
	
	
	
	@GetMapping("saveudm")
	@ResponseBody
	public String saveudm(@RequestParam("devid")String devid
			,@RequestParam("devname")String devname
			,@RequestParam("wsid")String wsid
			,@RequestParam("userid")String userid
			,@RequestParam("appid")String appid
			,@RequestParam("orgid")String orgid
			,@RequestParam("rownum")String rownum
			,@RequestParam("ppltr")String ppltr
			) {
		
		Date updatedate = new Date();
		
		UserDeviceMapping udm = userDevicedao.getDeviceByEUI(devid);
		
		if(udm != null) {
			
			udm.setAppId(appid);
			udm.setOrgId(orgid);
			udm.setDevEUI(devid);
			udm.setDevNode(devname);
			udm.setUpdateddt(updatedate);
			//udm.setPulseperltr(ppltr);
		
			if(Integer.parseInt(userid) !=0) {
				
				TblUserInfo user =	userInfoDao.getUserById(userid);
				
				if(user != null) {
					udm.setTblUserInfo(user);
				}
				
				else {
					
					udm.setTblUserInfo(null);

					
				}
				
				
			}else {
				
				
				udm.setTblUserInfo(null);
			}
			
		
		
		if(Integer.parseInt(wsid) !=0) {
			
			WaterSources ws = wsdao.getwaterSourceForId(Integer.parseInt(wsid));
			
			if(ws != null)
			
			udm.setWaterSourceId(ws);
	
			
		}else {
			
			
			udm.setWaterSourceId(null);
				
		}
		userDevicedao.save(udm);
		}else {
			
			
			UserDeviceMapping userdm = new UserDeviceMapping();
			userdm.setAppId(appid);
			userdm.setOrgId(orgid);
			userdm.setDevEUI(devid);
			userdm.setDevNode(devname);
			userdm.setStatus("A");
			userdm.setCreateddt(updatedate);
			userdm.setUpdateddt(updatedate);
			//userdm.setPulseperltr(ppltr);
			if(Integer.parseInt(userid) !=0) {	
		TblUserInfo user =	userInfoDao.getUserById(userid);
			
		if(user != null) {
			userdm.setTblUserInfo(user);
		}
		}
			else {
				
				userdm.setTblUserInfo(null);
				
			}
			
		if(Integer.parseInt(wsid) !=0) {
			
			WaterSources ws = wsdao.getwaterSourceForId(Integer.parseInt(wsid));
			
			if(ws != null)
			
				userdm.setWaterSourceId(ws);
	
			
		}else {
			
			userdm.setWaterSourceId(null);
				
			
		}
		
		
		userDevicedao.save(userdm);
		
			
		}
		
		
		
		
	/*	TblPulseperLitre pl =   ppldao.getdevidByDevId(devid);
		
			if(pl!=null) {
				ppldao.setUpdateppltr(ppltr, devid);
			}else  {
				
				TblPulseperLitre pulsePerltr =  new TblPulseperLitre();

				pulsePerltr.setDevid(devid);
				pulsePerltr.setPulsePerLtr(ppltr);
				ppldao.save(pulsePerltr);
			}
			*/
		
		
		
		TblConsumptionsConfig conltr = consumltrdao.getdevidByDevId(devid);
		
		if(conltr!=null) {
			consumltrdao.setUpdateppltr(ppltr, devid);
		}else {
			
			TblConsumptionsConfig tblconsumconfig = new TblConsumptionsConfig();
			
			tblconsumconfig.setDevEUI(devid);
			tblconsumconfig.setConsumptionLtr(ppltr);
			tblconsumconfig.setCreatedAt(updatedate);
			tblconsumconfig.setUpdatedAt(updatedate);
			consumltrdao.save(tblconsumconfig);
			
		}
		
		
		
		
		return "success="+updatedate+"-rownum="+rownum+"&ppltr="+ppltr;
	}
	
	
	@GetMapping("/getDevicesForApp")
	@ResponseBody
	public String getudmmapings(@RequestParam("appId") String appId,HttpServletRequest request)  {
		JSONArray returnarray = new JSONArray();
		
		TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
		String userid = user.getId();
		UserDeviceMapping seudmse = null;
		if(userid != null) {
			seudmse=	userDevicedao.getUDMbyuserId(userid);
		}
		
		
		List<UserDeviceMapping> mapped = userDevicedao.getUserDeviceByOrgIdandApp(seudmse.getOrgId(), appId);
		JSONArray alldevices=null;
		try {
			alldevices = organisationService.getDivsForAppId(appId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<String> mappedDevices = new ArrayList<String>();
		List<String> watersources = new ArrayList<String>();
		List<String> userids  = new ArrayList<String>();
		List<String> userflats  = new ArrayList<String>();
		List<String> usernames  = new ArrayList<String>();
		List<String> lastupdatedlist  = new ArrayList<String>();
		List<String> pulseperltr  =new ArrayList<String>();
		
		
		for (int i = 0; i < mapped.size(); i++) {
			UserDeviceMapping udm = mapped.get(i);
			mappedDevices.add(udm.getDevEUI());
			lastupdatedlist.add(""+udm.getUpdateddt());
			if(udm.getWaterSourceId() != null) {
				
				watersources.add(""+udm.getWaterSourceId().getId());
			}
			else {
				watersources.add("");
				
			}
			
		if(udm.getTblUserInfo() != null) {
			//sys
			userids.add(""+udm.getTblUserInfo().getId());
			userflats.add(""+udm.getTblUserInfo().getFlat()+" -- "+udm.getTblUserInfo().getUname());
			usernames.add(""+udm.getTblUserInfo().getUname());
			
		}else {
			
			userids.add("");
			userflats.add("");
			usernames.add("");
		}
		
		
		}
		
		
		
		for(int i = 0; i < alldevices.size();i++) {
			
			JSONObject eachrow = new JSONObject();
			String devid = (String)((org.json.simple.JSONObject)alldevices.get(i)).get("devEUI");
			String devname = (String)((org.json.simple.JSONObject)alldevices.get(i)).get("name");
			eachrow.put("devid",devid );
			eachrow.put("deviceName",devname );
			
			try {
				
				TblConsumptionsConfig consum =  consumltrdao.getConsumptionsConfigByDevId(devid);
			
		//	logger.debug("ppl",ppl);
			if(consum!=null)
			
			eachrow.put("pulseperltr",consum.getConsumptionLtr());
			
			else
				
				eachrow.put("pulseperltr", "");
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		
			
			if(mappedDevices.contains(devid)) {
				
				
				eachrow.put("watersource", watersources.get(mappedDevices.indexOf(devid)));
				eachrow.put("userid", userids.get(mappedDevices.indexOf(devid)));
				eachrow.put("flat", userflats.get(mappedDevices.indexOf(devid)));
				eachrow.put("updated", lastupdatedlist.get(mappedDevices.indexOf(devid)));
				
			
			}else {
				eachrow.put("watersource","");
				eachrow.put("userid","");
				eachrow.put("flat","");
				eachrow.put("updated","");

				
			}
			
			
			returnarray.add(eachrow);
			 
			
			
		}
		
			
		
		return returnarray.toJSONString();

	}
	
	@GetMapping("/getudms")
	@ResponseBody
	public List<UserDeviceMapping> getudms(@RequestParam("appId") String appId,@RequestParam("orgId") String orgId) throws Exception {
		
		return userDevicedao.getUserDeviceByOrgIdandApp(orgId, appId);

	}
	
	
	
	
	@GetMapping("/getuserUploadTemplate")
	@ResponseBody
	public HttpEntity<byte[]> getuserTEmplate(@RequestParam("appId") String appId, @RequestParam("appName") String appName)
			throws Exception {
	
	return	excelupload.excelDownloadTemplateForUserUpload(appId, appName);
	
	}
	@GetMapping("/getUploadTemplate")
	@ResponseBody
	public HttpEntity<byte[]> getTEmplate(@RequestParam("appId") String app, @RequestParam("orgId") String org)
			throws Exception {

		String[] appIdName = app.trim().split(":");
		String appId = appIdName[0];
		String appName = appIdName[1];

		String[] orgIdName = org.trim().split(":");
		String orgId = orgIdName[0];
		String orgName = orgIdName[1];

		logger.debug("Application Id as ", appId);
		String returnVal = "";
		try {
			// returnVal =
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = organisationService.getDivsForAppId(appId);

		return excelupload.excelDownloadTemplateForUserDeviceUpload(appId, appName, orgId, orgName, array,
				userDevicedao.getUserDeviceByOrgIdandApp(orgId, appId));

	}

	@PostMapping("/userUpload")

	public @ResponseBody String userDeviceExcel(@RequestParam("uploadExcel") MultipartFile file) {

		JSONObject duplicates = new JSONObject();

		List<UserDeviceMapping> udmList = excelupload.excelUpload(file);

		if (udmList.size() == 0) {

			duplicates.put(" Response ", " Unknown format ! please upload valid format by downloading the template provided in the page");

			return duplicates.toString();
		}

		int rowCursor = 0;

		for (UserDeviceMapping udm : udmList) {
			try {

				rowCursor++;

				if (userDevicedao.getDeviceByEUI(udm.getDevEUI()) != null) {

					// this means this device is already mapped

					duplicates.put("row " + rowCursor,
							" Device id is already mapped to the user !! if changes are mandatory please make changes in the applications editing page !");

					continue;
				}

				if (udm.getTblUserInfo().getUname().length() < 1
						|| !udm.getTblUserInfo().getUname().matches(".*[a-zA-Z]+.*")) {

					// user name is empty

					duplicates.put("row " + rowCursor,
							"Row not inserted due to empty user name !! or doesnot contains any valid name");

					continue;
				}

				TblUserInfo user = userInfoDao.getUserByUsername(udm.getTblUserInfo().getUname());

				if (user != null) {

					if (!user.getEmailId().equals(udm.getTblUserInfo().getEmailId())) {

						duplicates.put("row " + rowCursor,
								"Row not inserted due to the user name already exists !! if you are trying to add device to the existing user please verify the email id given in the excel is mathing the existing user email !   ");

					} else {

						// it means admin/appUSER is trying to add new device to

						udm.setTblUserInfo(user);

					}
				} else {

					// it means user does not exists in the database

					userInfoDao.save(udm.getTblUserInfo());

				}

				// udm variable below has proper user in the database
				udm.setStatus("A");
				userDevicedao.save(udm);
				duplicates.put("row " + rowCursor, "inserted or updated successfully  ");

			} catch (Throwable e) {

				e.printStackTrace();

				if (e instanceof JpaSystemException) {

					duplicates.put("row " + rowCursor,
							"User name for this row is already in use !! please choose different user .. !!");
				} else {

					duplicates.put("row " + rowCursor,
							"This row did not get inserted due to some technical issues !! please enter manually .");

				}
			}
		}
		return duplicates.toString();
	}
	
	
	
	
	
	@GetMapping("getDevbyUser")
	@ResponseBody
	public String getDevEUIbyUser(HttpServletRequest request, @RequestParam("userid") String userid) {
		
		//TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
	//	String userid = user.getId();
		logger.debug("userId"+userid);
		
		JSONArray devnames= new JSONArray();
		JSONObject devn = new JSONObject();
		
		//try {
			List<UserDeviceMapping> devnode = udmdao.getdevbyuserId(userid);
		//	logger.debug("devnode contains"+devnode);
			
	   logger.debug(devnode.size());
	//	for(int i=0;i < devnode.size(); i++ ){
	   for(UserDeviceMapping udmname: devnode ) {

		
		
		devn.put("devNode", udmname.getDevNode());		
		devn.put("deveui",udmname.getDevEUI());	
	
		
		devnames.add(devn);
		}
		logger.debug("EACHROW"+devnames);
		
		/*}catch(Exception e) {
			e.printStackTrace();
		}*/
		return  devnames.toJSONString();
	}
	
	
	@GetMapping("/getDevForApp")
	@ResponseBody
	public String getudmMapings(@RequestParam("appId") String appId,HttpServletRequest request)  {
		
		logger.debug("Inside getDevForApp.....");
		logger.debug("appid",appId);
		JSONArray returnarray = new JSONArray();
		
		TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
		String userid = user.getId();
		UserDeviceMapping seudmse = null;
		if(userid != null) {
			seudmse=	userDevicedao.getUDMbyuserId(userid);
		}
		
		
		List<UserDeviceMapping> mapped = userDevicedao.getUserDeviceByOrgIdandApp(seudmse.getOrgId(), appId);
		JSONArray alldevices=null;
		try {
			alldevices = organisationService.getDivsForAppId(appId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<String> mappedDevices = new ArrayList<String>();
		List<String> watersources = new ArrayList<String>();
		List<String> userids  = new ArrayList<String>();
		List<String> userflats  = new ArrayList<String>();
		List<String> usernames  = new ArrayList<String>();
		List<String> lastupdatedlist  = new ArrayList<String>();
		List<String> syncstatus  = new ArrayList<String>();
		
		for (int i = 0; i < mapped.size(); i++) {
			UserDeviceMapping udm = mapped.get(i);
			mappedDevices.add(udm.getDevEUI());
			lastupdatedlist.add(""+udm.getUpdateddt());
			if(udm.getWaterSourceId() != null) {
				
				watersources.add(""+udm.getWaterSourceId().getId());
			}
			else {
				watersources.add("");
				
			}
			
		if(udm.getTblUserInfo() != null) {
			//sys
			userids.add(""+udm.getTblUserInfo().getId());
			userflats.add(""+udm.getTblUserInfo().getFlat()+" -- "+udm.getTblUserInfo().getUname());
			usernames.add(""+udm.getTblUserInfo().getUname());
			
		}else {
			
			userids.add("");
			userflats.add("");
			usernames.add("");
		}
		
		
		}
		
		
		
		for(int i = 0; i < alldevices.size();i++) {
			
			JSONObject eachrow = new JSONObject();
			String devid = (String)((org.json.simple.JSONObject)alldevices.get(i)).get("devEUI");
			String devname = (String)((org.json.simple.JSONObject)alldevices.get(i)).get("name");
			eachrow.put("devid",devid );
			eachrow.put("deviceName",devname );
			logger.debug("devid",devid);
			
			try {
				TblSyncingChecker syncChecker=loraSyncingService.getLoraSyncingInfo(appId.trim(),devid.trim());
				
				logger.debug("appid and devid in synchecker",syncChecker);
				
				/*if(devid.equals(syncChecker.getDevEUI())) {
					logger.debug("present",devid);
				}*/
				if(syncChecker!=null) {
					//="No need to sync it again! Already synced";
					eachrow.put("syncstatus","already synced");
					eachrow.put("updated", syncChecker.getUpdatedDt());
				}else {
					eachrow.put("syncstatus","sync it");
					eachrow.put("updated", "");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			if(mappedDevices.contains(devid)) {
				
				
				eachrow.put("watersource", watersources.get(mappedDevices.indexOf(devid)));
				eachrow.put("userid", userids.get(mappedDevices.indexOf(devid)));
				eachrow.put("flat", userflats.get(mappedDevices.indexOf(devid)));
			//	eachrow.put("updated", lastupdatedlist.get(mappedDevices.indexOf(devid)));
				
			}else {
				eachrow.put("watersource","");
				eachrow.put("userid","");
				eachrow.put("flat","");
			//	eachrow.put("updated","");

				
			}
			
			
			returnarray.add(eachrow);
			 
			
			
		}
		
		
		
		return returnarray.toJSONString();

	}
	
	
}
