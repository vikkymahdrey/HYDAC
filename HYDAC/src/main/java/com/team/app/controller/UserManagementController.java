package com.team.app.controller;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team.app.dao.RoleDao;
import com.team.app.dao.UserDeviceMappingDao;
import com.team.app.dao.UserInfoDao;
import com.team.app.domain.TblHydacInfo;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.logger.AtLogger;
import com.team.app.service.UserLoginService;
import com.team.app.utils.DateUtil;
import com.team.app.utils.UploadExcel;

import ch.qos.logback.classic.Logger;
@Controller
public class UserManagementController {
	private static final AtLogger logger = AtLogger.getLogger(UserManagementController.class);
	@Autowired
	UserInfoDao usrdao;
	
	@Autowired
	UserDeviceMappingDao udmdao;
	
	@Autowired
	RoleDao rdao;
	@Autowired
	UploadExcel excelupload;
	
	@Autowired
	private UserLoginService userLoginService;
	
	@RequestMapping(value= {"/usermgmts"}, method=RequestMethod.GET)
	public String userManagementHandler(HttpServletRequest request, HttpServletResponse response)
	{	
		
			return "UserManagement_2";
	}
	
	@RequestMapping(value= {"/hydac"}, method=RequestMethod.GET)
	public String hydacHandler(HttpServletRequest request, HttpServletResponse response ,Map<String,Object> map) throws Exception
	{	
		List<TblHydacInfo> info=userLoginService.getHydacInfos();
		map.put("hydacList", info);
			return "hydac";
	}
	
	
    @RequestMapping(value= {"/adduserbyadmin"}, method=RequestMethod.POST)
	public @ResponseBody String adduserbyadmin(HttpServletRequest request,@RequestParam("username") String username,@RequestParam("email")String email,
			@RequestParam("appId")String appId,@RequestParam("phone")String phone,@RequestParam("flat")String flat,@RequestParam("userid")String userid)
	{	
    	String returnValue= "";
try {
    	logger.debug("username"+username);
    	logger.debug("emailid"+email);
    /*	
			
		
		TblUserInfo auseremail=userLoginService.getUserByEmailId(email);
		TblUserInfo ausername=userLoginService.getUserByUsername(username);*/
    	
    	
    	
    	TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
		String adminuserid = user.getId();
		UserDeviceMapping udm = null;
		if(userid != null) {
		udm=	udmdao.getUDMbyuserId(adminuserid);
		}
		
		TblUserInfo saveuser = new TblUserInfo();
		
		TblUserInfo aname=userLoginService.getUserByUsername(username);
		TblUserInfo aemail=userLoginService.getUserByEmailId(email);
		//logger.debug("admin name "+aname);
		
    	if((Integer.parseInt(userid) == 0)){
    		
    		if(aname!=null) {
    			returnValue = "nameexsisting";
    		}else if(aemail!=null) {
    			returnValue = "emailexsisting";
    		}
    		
    		else {
    		
    		saveuser.setAppId(Integer.parseInt(appId));
        	saveuser.setEmailId(email);
        	saveuser.setUname(username);
        	saveuser.setRoleBean(rdao.getRoleByRoleId("5"));
          saveuser.setOrgId(Integer.parseInt(udm.getOrgId())); 
          saveuser.setContactnumber(phone);
          saveuser.setFlat(flat);
          saveuser.setCreateddt(new Date());
          saveuser.setUpdateddt(new Date());
         // saveuser.setPwdChangeDt(new Date());
          saveuser.setPassword(username+flat);
          saveuser.setStatus("Y");
        	
          usrdao.save(saveuser);
        		returnValue = "s";
    		}

    	}else {
    		
    	TblUserInfo sauser = usrdao.getUserById(userid);
    		
    	if(sauser!=null) {
    		
    		if((aname != null) && (!aname.getId().equals(userid))) {
				returnValue ="nameexsisting";
			}else 
			if ((aemail != null) && (!aemail.getId().equals(userid))) {
				returnValue = "emailexsisting";
			} else
    		 {
		
    			sauser.setAppId(Integer.parseInt(appId));
    			sauser.setEmailId(email);
    			sauser.setUname(username);
    			sauser.setOrgId(Integer.parseInt(udm.getOrgId())); 
    			sauser.setContactnumber(phone);
    			sauser.setFlat(flat);
         usrdao.save(sauser);
         returnValue = "s";
       }
    	}
    	}	
    }//try
    	catch(Exception e) {
    		return returnValue ="f";
    	}
 
		return returnValue;
	}

    
    @PostMapping("/userUploadRaw")

	public @ResponseBody String userDeviceExcel(@RequestParam("uploadExcel") MultipartFile file,HttpServletRequest request) {

    	TblUserInfo user=(TblUserInfo) request.getSession().getAttribute("user");
    	//String userid=(String) request.getSession().getAttribute("userId");
		String userid = user.getId();
		//String uname= user.getUname();
    	/*
    	TblUserInfo user = null;
		try {
			user = userLoginService.getUserByUId(userid);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
    	
		UserDeviceMapping udm = null;
		if(userid != null) {
		udm=	udmdao.getUDMbyuserId(userid);
		}
		
    	
		JSONObject duplicates = new JSONObject();

		List<TblUserInfo> usrList = excelupload.parseExcel(file);

		if (usrList.size() == 0) {

			duplicates.put(" Response ", " Unknown format ! please upload valid format by downloading the template provided in the page");

			return duplicates.toString();
		}

		int rowCursor = 0;
		
		for (TblUserInfo usr : usrList) {
			

			try {

				rowCursor++;
				
				if (usr.getUname()==null 
						|| !usr.getUname().matches("^[A-Za-z0-9_]{4,32}$")) {

					// user name is empty
					
					duplicates.put("row " + rowCursor,
							"Row not inserted due to empty user name !! or doesnot contains any valid name");
					
					continue;
				}/*else if ((usr.getUname()!=null) || (!user.getUname().equals(usr.getUname()))) {

					// Email id is empty

					duplicates.put("row " + rowCursor,
							"Username already exists");
					continue;
				}*/else if (usr.getEmailId()==null
						|| !usr.getEmailId().matches("^((([a-z]|\\d|[!#\\$%&\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+(\\.([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+)*)|((\\x22)((((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(([\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x7f]|\\x21|[\\x23-\\x5b]|[\\x5d-\\x7e]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(\\\\([\\x01-\\x09\\x0b\\x0c\\x0d-\\x7f]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF]))))*(((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(\\x22)))@((([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])))\\.)+(([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])))$")) {

					// Email id is empty

					duplicates.put("row " + rowCursor,
							"Row not inserted due to empty email id !! or doesnot contains any valid email id");
					continue;
				}else if (usr.getContactnumber()==null
						|| !usr.getContactnumber().matches("^[0][1-9]\\d{9}$|^[1-9]\\d{9}$")) {

					// phone is empty

					duplicates.put("row " + rowCursor,
							"Row not inserted due to empty phone !! or doesnot contains any valid contact number");
					continue;
				}else if (usr.getFlat()==null) {

					// flat is empty

					duplicates.put("row " + rowCursor,
							"Row not inserted due to empty flat name !! or doesnot contains any valid flat name");
					continue;
				}
				
				
				

				
				if (usr != null) {
					
					usr.setOrgId(Integer.parseInt(udm.getOrgId()));
					usrdao.save(usr);
				}

				
				
			} catch (Throwable e) {

				//e.printStackTrace();

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
    
}
