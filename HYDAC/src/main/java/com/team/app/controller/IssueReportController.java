package com.team.app.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.app.constant.AppConstants;
import com.team.app.dao.DeviceFeedbackDao;
import com.team.app.dao.DeviceFeedbackStatusDao;
import com.team.app.domain.TblDeviceFeedback;
import com.team.app.domain.TblDeviceFeedbackStatus;
import com.team.app.domain.TblDeviceFeedbackType;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.logger.AtLogger;
import com.team.app.service.DeviceInfo;
import com.team.app.service.UserLoginService;
import com.team.app.utils.DateUtil;
import com.team.mighty.notification.SendGmail;

@Controller
public class IssueReportController {

	private static final AtLogger logger = AtLogger.getLogger(InvoiceController.class);

	@Autowired
	private UserLoginService userLoginService;

	@Autowired
	private DeviceInfo deviceInfo;

	@Autowired
	private DeviceFeedbackDao deviceFeedbackDao;
	@Autowired
	private DeviceFeedbackStatusDao deviceFeedbackStatusDao;

	@RequestMapping(value = { "/issue" }, method = { RequestMethod.GET })
	public String IssueReport(Map<String, Object> frms, Map<String, String> fdtype, HttpServletRequest request,
			HttpSession session)

	{

		String userId = (String) session.getAttribute("userId");
//

		logger.debug("UserId as: ", userId);

		try {

			frms = new HashMap<String, Object>();

			fdtype = new HashMap<String, String>();

			TblUserInfo user = userLoginService.getUserByUId(userId);

			String userid = user.getId();

			if (user != null) {
				List<UserDeviceMapping> udmList = user.getUserDeviceMappings();
				List<TblDeviceFeedbackType> fbtype = deviceInfo.getDeviceFeedbackType();

				if (udmList != null && !udmList.isEmpty()) {
					for (UserDeviceMapping udm : udmList) {

						frms.put(udm.getDevEUI(), udm.getDevNode());

					}
				}

				if (fbtype != null && !fbtype.isEmpty()) {
					for (TblDeviceFeedbackType type : fbtype) {

						fdtype.put(type.getId(), type.getType());
					}
				}

				request.setAttribute("userDevice", frms);
				request.setAttribute("deviceFb", fdtype);

			}

		}

		catch (Exception e) {
		}

		return "IssueReport";

	}

	@PostMapping("userComplaint")
	public String userComplaint(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws IOException {
		{

			String userId = (String) session.getAttribute("userId");

			String devicename = request.getParameter("devicename");
			//logger.debug("devicename",devicename);
			String feedbacktype = request.getParameter("feedbacktype");
			String comment = request.getParameter("comment");
			String status = request.getParameter("status");

			System.out.println("" + devicename + feedbacktype + comment);

			String string = devicename;
			String[] parts = string.split("-");
			String devEUI = parts[0];
			String nodeName = parts[1];
			Random random = new Random();
			int value = random.nextInt(10000);
			DateFormat df = new SimpleDateFormat("MMddyyyy");
			Date today = Calendar.getInstance().getTime();
			String reportDate = df.format(today);
			System.out.println("Report Date: " + reportDate + value);
			TblDeviceFeedback d = null;

			TblDeviceFeedbackStatus f = null;

			logger.debug("Tickert id ==== SWM" + reportDate + value);

			try {
				TblUserInfo user = userLoginService.getUserByUId(userId);
				d = new TblDeviceFeedback();

				f = new TblDeviceFeedbackStatus();

				String ticket = "SWM" + reportDate + value;

				d.setNodeName(nodeName);
				d.setDevEUI(devEUI);
				if (status != null && !status.isEmpty()) {
					d.setStatus(AppConstants.reopen);

				} else {

					d.setStatus(AppConstants.open);
				}

				d.setTextarea(comment);
				d.setType(feedbacktype);
				d.setTblUserInfo(user);
				d.setCreatedAt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
				d.setUpdatedAt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
				d.setPhoneType(AppConstants.phonetype);
				d.setTicketId(ticket);

				deviceFeedbackDao.save(d);

				
				
				
				TblDeviceFeedback fDid = deviceInfo.getDeviceFeedbackissueid(ticket);

				f.setComment(comment);
				
				
				

				if (status != null && !status.isEmpty()) {
					f.setStatus(AppConstants.reopen);

				} else {

					f.setStatus(AppConstants.open);
				}

				f.setTblUserInfo(user);
				f.setCreatedAt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
				f.setUpdatedAt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
				f.setTblDeviceFeedback(fDid);

				deviceFeedbackStatusDao.save(f);
				
				SendGmail email = new SendGmail();
				
				email.send("vinay@unizentechnologies.com", "Hai", "hello");

				session.setAttribute("success", AppConstants.complaintsuccess);

			} catch (Exception e) {

				session.setAttribute("fail", AppConstants.complaintfailed);
				response.sendRedirect("/issue");
			}
		      return "redirect:/issue";
			
		}

	}

	@ResponseBody
	@RequestMapping(value = { "/userdivices" }, method = RequestMethod.GET)
	public List<TblDeviceFeedback> f(Map<String, Object> frms, Map<String, String> fdtype, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttributes) throws Exception {

		String userId = (String) session.getAttribute("userId");

		List<TblDeviceFeedback> responselist = new ArrayList<TblDeviceFeedback>();
		TblUserInfo user = userLoginService.getUserByUId(userId);

		List<UserDeviceMapping> udmList = user.getUserDeviceMappings();
		try {

			String OrgusrId = null;
			for (UserDeviceMapping orgId : udmList) {
				System.out.println("Number = " + orgId.getOrgId());

				OrgusrId = orgId.getOrgId();
			}

			//List<UserDeviceMapping> udlist = userLoginService.getUserDeviceByOrgId(OrgusrId);

			//for (UserDeviceMapping urdlist : udlist) {

			//	if (urdlist.getDevEUI() != null) {
				//	System.out.println("device list = " + urdlist.getDevEUI());

					//List<TblDeviceFeedback> fblist = deviceInfo.getDeviceFeedback(urdlist.getDevEUI());
			List<TblDeviceFeedback> fblist = deviceInfo.getDeviceFeedback();
					if (fblist != null && !fblist.isEmpty()) {
						for (TblDeviceFeedback fb : fblist) {
							TblDeviceFeedback usrfb = new TblDeviceFeedback();

							String typeId = fb.getType();

							TblDeviceFeedbackType cmptype = deviceInfo.getDeviceFeedbackCmplType(typeId);
							usrfb.setId(fb.getId());
						    usrfb.setNodeName(fb.getNodeName());
							usrfb.setDevEUI(fb.getDevEUI());
							usrfb.setType(cmptype.getType());
							usrfb.setStatus(fb.getStatus());
							usrfb.setTextarea(fb.getTextarea());
							usrfb.setCreatedAt(fb.getCreatedAt());

							usrfb.setUpdatedAt(fb.getUpdatedAt());
							usrfb.setTicketId(fb.getTicketId());

							responselist.add(usrfb);
							
							

						}
				//	}

				//}

			}
			//System.out.println("list......"+responselist);

		}
		
		catch (Exception e) {
		}
		//System.out.println("responselist size"+responselist.size());
		return responselist;
	}

	@ResponseBody
	@RequestMapping(value = { "/getusrstatus/{id}" }, method = RequestMethod.GET)
	public List<TblDeviceFeedbackStatus> stlist(@PathVariable(value = "id") String id, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttributes) {

		List<TblDeviceFeedbackStatus> stlist = null;

		List<TblDeviceFeedbackStatus> responselist = new ArrayList<TblDeviceFeedbackStatus>();

		try {

			stlist = deviceInfo.getDeviceFeedbackStatus(id);

			if (stlist != null && !stlist.isEmpty()) {
				for (TblDeviceFeedbackStatus fb : stlist) {

					TblDeviceFeedbackStatus usrfb = new TblDeviceFeedbackStatus();

					usrfb.setStatus(fb.getStatus());
					usrfb.setId(fb.getId());
					usrfb.setComment(fb.getComment());
					usrfb.setCreatedAt(fb.getCreatedAt());

					responselist.add(usrfb);

				}
			}

		}

		catch (Exception e) {
		}

		return responselist;
	}

	@RequestMapping(value = { "/resolveReOpen" }, method = RequestMethod.POST)
	public String complaintReOpen(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws IOException {

		String userId = (String) session.getAttribute("userId");
		String status = request.getParameter("status");
		String id = request.getParameter("id");
		String comment = request.getParameter("comment");

		TblDeviceFeedbackStatus d = null;

		logger.debug("userId ==== SWM" + userId);
		try {
			TblUserInfo user = userLoginService.getUserByUId(userId);
			TblDeviceFeedback fDid = deviceInfo.getDeviceFeedbackid(id);

			d = new TblDeviceFeedbackStatus();
			d.setComment(comment);
			d.setStatus(status);
			d.setTblUserInfo(user);
			d.setCreatedAt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
			d.setUpdatedAt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));

			d.setTblDeviceFeedback(fDid);

			deviceFeedbackStatusDao.save(d);

			fDid.setStatus(status);
			deviceFeedbackDao.save(fDid);

		} catch (Exception e) {

		}

		return "redirect:/issue";
	}

	@RequestMapping(value = { "/resolveComplaint" }, method = RequestMethod.POST)
	public String resolveComplaint(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws IOException {
		
		String userId = (String) session.getAttribute("userId");
		String status = request.getParameter("status");
		System.out.println("stsus........."+status);
		String id = request.getParameter("id");
		String comment = request.getParameter("comment");

		TblDeviceFeedbackStatus d = null;

		logger.debug("userId ==== SWM" + userId);
		try {
			TblUserInfo user = userLoginService.getUserByUId(userId);
			TblDeviceFeedback fDid = deviceInfo.getDeviceFeedbackid(id);

			d = new TblDeviceFeedbackStatus();
			d.setComment(comment);
			d.setStatus(status);
			d.setTblUserInfo(user);
			d.setCreatedAt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
			d.setUpdatedAt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));

			d.setTblDeviceFeedback(fDid);

			deviceFeedbackStatusDao.save(d);

			fDid.setStatus(status);
			deviceFeedbackDao.save(fDid);
			
			/*if(status=="Pending") {
			    session.setAttribute("pending", AppConstants.pending);
			    
			    logger.debug("status ==== SWM" + status);
			}
			else {*/
				session.setAttribute("success", AppConstants.complaintsuccess);
				session.setAttribute("status", status);
				
				logger.debug("status ==== SWM" + status);
		//	}

			 
		}catch (Exception e) {
			session.setAttribute("fail", AppConstants.complaintfailed);
			response.sendRedirect("/feedback");
		}

		return "redirect:/feedback";
	}

	@RequestMapping(value = { "/feedback" }, method = { RequestMethod.GET })
	public String AdminFeedback(Map<String, Object> frms, Map<String, String> fdtype, HttpServletRequest request,
			HttpSession session) throws ParseException, IOException

	{
			return "AdminFeedback";

	}
	
	

}