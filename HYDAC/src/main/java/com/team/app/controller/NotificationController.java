package com.team.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.app.dao.PushNotificationsDao;
import com.team.app.dao.UserInfoDao;
import com.team.app.domain.TblPushNotifications;
import com.team.app.domain.TblUserInfo;
import com.team.app.logger.AtLogger;
import com.team.app.service.PushNotification;
import com.team.app.utils.FCMNotification;

@Controller
public class NotificationController {

	@Autowired
	private PushNotificationsDao pndao;

	@Autowired
	private PushNotification pnImpl;
	
	@Autowired
	private UserInfoDao udao;

	private static final AtLogger logger = AtLogger.getLogger(NotificationController.class);

	@RequestMapping(value = { "/notification" }, method = RequestMethod.GET)
	public String NotificationHandler(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("In notification handle");
		return "NotificationsManagement";
	}


	@PostMapping("/getUserdata")
	@ResponseBody
	public String getUserdata(@RequestParam("user") String user) {
	
			logger.debug("user"+user);
			
			TblUserInfo u = udao.getUserByUsername(user);
		
			JSONObject jsonu = new JSONObject();
		
		jsonu.put("uid", u.getId());
		jsonu.put("uname", u.getUname());
		jsonu.put("uflat", u.getFlat());
		jsonu.put("uemail", u.getEmailId());
		jsonu.put("ucontact", u.getContactnumber());
		logger.debug("userdata",jsonu);
		
     return jsonu.toString();
	
	}

	@PostMapping("/getpushnotificationkey")
	@ResponseBody
	public String getpushnotificationkey(@RequestParam("orgId") String orgId,@RequestParam("uid") String uid, @RequestParam("appId") String[] appId,
			@RequestParam("title") String title, @RequestParam("msg") String msg) {

		
		try {
			pnImpl.fcm();
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.debug("appid", appId);
		logger.debug("orgid", orgId);
		logger.debug("title", title);
		logger.debug("msg", msg);
		logger.debug("uid", uid);

		String msgtitle = title;
		String message = msg;
		String userid = uid;

		String[] appid = appId;
		

		try {
			
			if(userid=="") {

			int apid = appid.length;

			List<String> pn = new ArrayList<String>();
			for (int i = 0; i < apid; i++) {

				List<TblPushNotifications> userId = pndao.getUseridsByAppId(appid[i]);

				for (TblPushNotifications tokenId : userId) {
					pn.add(tokenId.getTokenId());

				}

			}

			logger.debug("pn", pn);

			FCMNotification.send_FCM_Notification(pn, msgtitle, message);
		
		
		}
		else {
			
			TblPushNotifications usertokid = pndao.getTokenByUserId(userid);
			
			logger.debug("tokenid for user",usertokid.getTokenId());
			
			
			List<String> pnU = new ArrayList<String>();
			pnU.add(usertokid.getTokenId());
			FCMNotification.send_FCM_NotificationforUser(pnU, msgtitle, msgtitle);
			
		}
		
		} catch (Exception e) {
			return "failure";
		}

		return "success";

	}

}
