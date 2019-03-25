package com.team.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team.app.config.MqttIntrf;
import com.team.app.constant.AppConstants;
import com.team.app.constant.PasswordGenerator;
import com.team.app.dao.BillsDao;
import com.team.app.domain.Bills;
import com.team.app.domain.TblDeviceFeedback;
import com.team.app.domain.TblDeviceFeedbackType;
import com.team.app.domain.TblHydacInfo;
import com.team.app.domain.TblPaymentInfo;
import com.team.app.domain.TblPushNotifications;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.dto.UserLoginDTO;
import com.team.app.exception.AtAppException;
import com.team.app.logger.AtLogger;
import com.team.app.service.BillingService;
import com.team.app.service.ConsumerInstrumentService;
import com.team.app.service.DeviceInfo;
import com.team.app.service.PaymentBillService;
import com.team.app.service.UnizenCommonService;
import com.team.app.service.UserLoginService;
import com.team.app.utils.DateUtil;
import com.team.app.utils.JWTKeyGenerator;
import com.team.app.utils.JsonUtil;
import com.team.app.utils.OtherFunctions;
import com.team.mighty.notification.SendMail;
import com.team.mighty.notification.SendMailFactory;

/**
 * 
 * @author Vikky
 *
 */

@RestController
@RequestMapping(AppConstants.CONSUMER_API)
public class ConsumerInstrumentController {

	@Autowired
	private ConsumerInstrumentService consumerInstrumentServiceImpl;

	@Autowired
	private UserLoginService userLoginService;

	@Autowired
	private UnizenCommonService unizenCommonServiceImpl;

	@Autowired
	private PaymentBillService paymentBillService;

	@Autowired
	private DeviceInfo deviceInfo;

	@Autowired
	private BillingService billingservice;

	@Autowired
	private BillsDao billdao;
	
	@Autowired
	private MqttIntrf mqttIntrf;

	@PostMapping(value = "getbillsforAndroid", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Bills> getbillsForAndroid(@RequestBody String received) {
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return null;
		}
		return billingservice.getillsForUser(obj.get("userid").toString());
	}

	private static final AtLogger logger = AtLogger.getLogger(ConsumerInstrumentController.class);

	static {

		javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(new javax.net.ssl.HostnameVerifier() {

			public boolean verify(String hostname, javax.net.ssl.SSLSession sslSession) {
				if (hostname.equals(AppConstants.noportdomain)) {
					return true;
				}
				return false;
			}
		});
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> userLoginFromApp(@RequestBody String received, HttpServletRequest request) {
		logger.info(" /POST /login API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /login", HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("username")) != null && String.valueOf(obj.get("password")) != null
					&& String.valueOf(obj.get("usertype")) != null) {

				UserLoginDTO userInfo = userLoginService.userLogin(obj.get("username").toString(),
						obj.get("password").toString(), obj.get("usertype").toString());

				HttpHeaders httpHeaders = null;

				try {
					httpHeaders = new HttpHeaders();
					httpHeaders.add(AppConstants.HTTP_HEADER_TOKEN_NAME, userInfo.getApiToken());
					httpHeaders.add(AppConstants.HTTP_HEADER_BASE_TOKEN_NAME, userInfo.getBaseToken());

					/* Epoch format for Access,Base Token Expiration Date */
					httpHeaders.add("BaseTokenExpiration",
							String.valueOf(new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
									.parse(userInfo.getBaseTokenExpDate().toString()).getTime()));

					httpHeaders.add("AccessTokenExpiration",
							String.valueOf(new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
									.parse(userInfo.getAccessTokenExpDate().toString()).getTime()));
				} catch (Exception e) {
					logger.error(e);
				}
				String response = JsonUtil.objToJson(userInfo);
				responseEntity = new ResponseEntity<String>(response, httpHeaders, HttpStatus.OK);
			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /login", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@RequestMapping(value = "/frameLogs", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> frameLogsHandler(@RequestBody String received) {
		logger.info(" /POST /login API ", received);
		ResponseEntity<String> responseEntity = null;
		/*
		 * JSONObject obj=null; try{ obj=new JSONObject(); obj=(JSONObject)new
		 * JSONParser().parse(received); }catch(Exception e){ return new
		 * ResponseEntity<String>("Exception in /login", HttpStatus.EXPECTATION_FAILED);
		 * }
		 */
		responseEntity = new ResponseEntity<String>(received, HttpStatus.OK);

		return responseEntity;
	}

	/* Refreshing unizen access token from base token */
	@RequestMapping(value = "/getRefreshToken", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getRefreshTokenHandler(
			@RequestHeader(value = AppConstants.HTTP_HEADER_BASE_TOKEN_NAME) String refreshToken,
			HttpServletRequest request) {
		logger.info("/POST /getRefreshToken API ", refreshToken);
		ResponseEntity<String> responseEntity = null;

		try {

			// Validate BASE-MIGHTY-TOKEN Value
			JWTKeyGenerator.validateXToken(refreshToken);

			// Validate Expriy Date
			unizenCommonServiceImpl.validateXToken(AppConstants.KEY_UNIZEN_MOBILE, refreshToken);
			UserLoginDTO userLoginDTO = null;
			userLoginDTO = unizenCommonServiceImpl.getRefreshTokenOnBaseToken();
			String response = JsonUtil.objToJson(userLoginDTO);

			HttpHeaders httpHeaders = null;
			httpHeaders = new HttpHeaders();
			httpHeaders.add(AppConstants.HTTP_HEADER_TOKEN_NAME, userLoginDTO.getApiToken());
			httpHeaders.add(AppConstants.HTTP_HEADER_BASE_TOKEN_NAME, userLoginDTO.getBaseToken());

			try {
				httpHeaders.add("BaseTokenExpiration", String.valueOf(new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
						.parse(userLoginDTO.getBaseTokenExpDate().toString()).getTime()));

				httpHeaders.add("AccessTokenExpiration",
						String.valueOf(new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
								.parse(userLoginDTO.getAccessTokenExpDate().toString()).getTime()));
			} catch (Exception e) {
				logger.error(e);
			}

			responseEntity = new ResponseEntity<String>(response, httpHeaders, HttpStatus.OK);

		} catch (AtAppException e) {
			logger.error("/Exception in /getRefreshToken ", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@RequestMapping(value = "/setPassword", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> setPasswordHandler(@RequestBody String received, HttpServletRequest request) {
		logger.info(" /POST /setPassword API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /setPassword", HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("curPwd")) != null && String.valueOf(obj.get("newPwd")) != null
					&& String.valueOf(obj.get("usertype")) != null && String.valueOf(obj.get("username")) != null) {

				UserLoginDTO userInfo = userLoginService.setPassword(obj.get("username").toString().trim(),
						obj.get("curPwd").toString().trim(), obj.get("newPwd").toString().trim(),
						obj.get("usertype").toString().trim());

				HttpHeaders httpHeaders = null;

				try {
					httpHeaders = new HttpHeaders();
					httpHeaders.add(AppConstants.HTTP_HEADER_TOKEN_NAME, userInfo.getApiToken());
					httpHeaders.add(AppConstants.HTTP_HEADER_BASE_TOKEN_NAME, userInfo.getBaseToken());

					/* Epoch format for Access,Base Token Expiration Date */
					httpHeaders.add("BaseTokenExpiration",
							String.valueOf(new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
									.parse(userInfo.getBaseTokenExpDate().toString()).getTime()));

					httpHeaders.add("AccessTokenExpiration",
							String.valueOf(new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
									.parse(userInfo.getAccessTokenExpDate().toString()).getTime()));
				} catch (Exception e) {
					logger.error(e);
				}
				String response = JsonUtil.objToJson(userInfo);
				responseEntity = new ResponseEntity<String>(response, httpHeaders, HttpStatus.OK);
			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /setPassword", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/hydacInfo", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> hydacInfoHandler(@RequestBody String received,
			HttpServletRequest request) {
		logger.info(" /POST /hydacInfo API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;

		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /hydacInfo", HttpStatus.LOCKED);
		}
		try {
			if (String.valueOf(obj.get("CSName")) != null && String.valueOf(obj.get("SerialNumber")) != null &&
					String.valueOf(obj.get("Date")) != null &&
					String.valueOf(obj.get("Time")) != null &&
					String.valueOf(obj.get("Version")) != null &&
					String.valueOf(obj.get("ISO4")) != null &&
					String.valueOf(obj.get("ISO6")) != null &&
					String.valueOf(obj.get("ISO14")) != null &&
					String.valueOf(obj.get("NAS25")) != null &&
					String.valueOf(obj.get("NAS2_5")) != null &&
					String.valueOf(obj.get("NAS5_15")) != null &&
					String.valueOf(obj.get("NAS15_25")) != null &&
					String.valueOf(obj.get("MAX")) != null &&
					String.valueOf(obj.get("Drive")) != null &&
					String.valueOf(obj.get("Temp")) != null &&
					String.valueOf(obj.get("Sat")) != null ) {
				
				TblHydacInfo hydac=	null;		
					hydac=new TblHydacInfo();
					hydac.setCSName(String.valueOf(obj.get("CSName")));
					hydac.setSerialNumber(String.valueOf(obj.get("SerialNumber")));
					hydac.setDate(String.valueOf(obj.get("Date")));
					hydac.setTime(String.valueOf(obj.get("Time")));
					hydac.setVersion(String.valueOf(obj.get("Version")));
					hydac.setIso4(Float.valueOf(String.valueOf(obj.get("ISO4"))));
					hydac.setIso6(Float.valueOf(String.valueOf(obj.get("ISO6"))));
					hydac.setIso14(Float.valueOf(String.valueOf(obj.get("ISO14"))));
					hydac.setNas25(Float.valueOf(String.valueOf(obj.get("NAS25"))));
					hydac.setNas2_5(Float.valueOf(String.valueOf(obj.get("NAS2_5"))));					
					hydac.setNas515(Float.valueOf(String.valueOf(obj.get("NAS5_15"))));
					hydac.setNas1525(Float.valueOf(String.valueOf(obj.get("NAS15_25"))));
					hydac.setMax(Float.valueOf(String.valueOf(obj.get("MAX"))));
					hydac.setDrive(Float.valueOf(String.valueOf(obj.get("Drive"))));
					hydac.setTemp(Float.valueOf(String.valueOf(obj.get("Temp"))));
					hydac.setSat(Float.valueOf(String.valueOf(obj.get("Sat"))));
					hydac.setCreatedDt(DateUtil.getCurrentDateTimeIST());
					hydac.setUpdatedDt(DateUtil.getCurrentDateTimeIST());
					
					TblHydacInfo hydacInfo=consumerInstrumentServiceImpl.save(hydac);
					if(hydacInfo!=null) {
						responseEntity = new ResponseEntity<String>(HttpStatus.OK);
					}else {
						responseEntity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
					}
					

				
					

			}else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.METHOD_NOT_ALLOWED);
			}

		} catch (Exception e) {
			logger.error("Exception in /hydacInfo", e);
			responseEntity = new ResponseEntity<String>(HttpStatus.EXPECTATION_FAILED);
		}
		return responseEntity;
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getHydacInfo", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getHydacInfoHandler(HttpServletRequest request) {
		logger.info(" /POST /getHydacInfo API ");
		ResponseEntity<String> responseEntity = null;
	
		try {
							
					List<TblHydacInfo> hydacInfoList=consumerInstrumentServiceImpl.getHydacInfo();
					JSONArray jsonArr = null;
						jsonArr = new JSONArray();
					JSONObject res = null;
						res = new JSONObject();
					if(hydacInfoList!=null && !hydacInfoList.isEmpty()) {
						for(TblHydacInfo h : hydacInfoList) {
							JSONArray jArr = null;
								jArr = new JSONArray();
							JSONObject j=null;
								j=new JSONObject();
						}
						/*jsonArr.addAll(hydacInfoList);
						res.put("resultant", jsonArr);
						String response = JsonUtil.objToJson(res);
						responseEntity = new ResponseEntity<String>(response,HttpStatus.OK);*/
					}else {
						res.put("resultant", jsonArr);
						String response = JsonUtil.objToJson(res);
						responseEntity = new ResponseEntity<String>(response,HttpStatus.LOCKED);
					}				

		} catch (Exception e) {
			logger.error("Exception in /getHydacInfo", e);
			responseEntity = new ResponseEntity<String>(HttpStatus.EXPECTATION_FAILED);
		}
		return responseEntity;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getDevices", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getDevicesHandler(@RequestBody String received,
			@RequestHeader(value = AppConstants.HTTP_HEADER_TOKEN_NAME) String xToken, HttpServletRequest request) {
		logger.info(" /POST /getDevices API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;

		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /getDevices", HttpStatus.EXPECTATION_FAILED);
		}
		try {
			// Validate X-ACCESS-TOKEN Value
			// JWTKeyGenerator.validateXToken(xToken);

			// Validate Expriy Date
			// unizenCommonServiceImpl.validateXToken(AppConstants.KEY_UNIZEN_MOBILE,
			// xToken);

			if (String.valueOf(obj.get("userId")) != null) {
				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());

				if (userInfo != null) {

					List<UserDeviceMapping> udmList = userInfo.getUserDeviceMappings();
					if (udmList != null && !udmList.isEmpty()) {
						JSONArray jsonArr = null;
						jsonArr = new JSONArray();
						JSONObject res = null;
						res = new JSONObject();

						JSONObject json = null;
						for (UserDeviceMapping udm : udmList) {
							json = new JSONObject();
							json.put("devEUI", udm.getDevEUI());
							json.put("devName", udm.getDevNode());
							jsonArr.add(json);
						}

						res.put("devices", jsonArr);
						String response = JsonUtil.objToJson(res);
						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);
					} else {
						responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);
					}

				} else {
					responseEntity = new ResponseEntity<String>(HttpStatus.METHOD_NOT_ALLOWED);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /getDevices", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getDeviceFeedbackType", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getDeviceFeedbackTypeHandler(
			@RequestHeader(value = AppConstants.HTTP_HEADER_TOKEN_NAME) String xToken, HttpServletRequest request) {
		logger.info(" /POST /getDeviceFeedbackType API ");
		ResponseEntity<String> responseEntity = null;

		try {
			// Validate X-ACCESS-TOKEN Value
			// JWTKeyGenerator.validateXToken(xToken);

			// Validate Expriy Date
			// unizenCommonServiceImpl.validateXToken(AppConstants.KEY_UNIZEN_MOBILE,
			// xToken);

			List<TblDeviceFeedbackType> types = deviceInfo.getDeviceFeedbackType();
			if (types != null && !types.isEmpty()) {
				JSONArray jsonArr = null;
				jsonArr = new JSONArray();
				JSONObject res = null;
				res = new JSONObject();

				JSONObject json = null;
				for (TblDeviceFeedbackType f : types) {
					json = new JSONObject();
					json.put("id", f.getId());
					json.put("type", f.getType());
					jsonArr.add(json);
				}

				res.put("resultant", jsonArr);
				String response = JsonUtil.objToJson(res);
				responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);
			} else {
				responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /getDeviceFeedbackType", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getWaterConsumptions", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getWaterConsumptionsHandler(@RequestBody String received,
			HttpServletRequest request) {
		logger.info(" /POST /getWaterConsumptions API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /getWaterConsumptions", HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("userId")) != null && String.valueOf(obj.get("startDate")) != null
					&& String.valueOf(obj.get("endDate")) != null && String.valueOf(obj.get("interval")) != null) {
				// int n=0;
				long startDt = 0;
				long endDt = 0;
				try {
					// n=Integer.parseInt(String.valueOf(obj.get("interval")));
					startDt = Long.parseLong(String.valueOf(obj.get("startDate")));
					endDt = Long.parseLong(String.valueOf(obj.get("endDate")));
				} catch (Exception e) {
					;
				}

				logger.debug("Print startDt ", startDt);
				logger.debug("Print endDt ", endDt);

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
				if (userInfo != null) {
					List<UserDeviceMapping> udmList = userInfo.getUserDeviceMappings();
					if (udmList != null && !udmList.isEmpty()) {
						JSONArray jsonArr = null;
						jsonArr = new JSONArray();
						JSONObject res = null;
						res = new JSONObject();

						String devEUI = "";
						String appId = "";
						String temp = "";

						for (UserDeviceMapping udm : udmList) {
							if (temp.equals("")) {
								logger.debug("IF Condition");
								devEUI = devEUI + udm.getDevEUI();
								appId = appId + udm.getAppId();
								temp = ",";
							} else {

								devEUI = devEUI + temp + udm.getDevEUI();
								if (!udm.getAppId().equals(appId.trim())) {
									appId = appId + temp + udm.getAppId();
								}
							}

						}
						Date sDt = DateUtil.convertLongToDateNoZone(startDt + 19800000, "yyyy-MM-dd");
						Date eDt = DateUtil.convertLongToDateNoZone(endDt + 19800000, "yyyy-MM-dd");
						logger.debug("Date sDt", DateUtil.changeDateFromatIST(sDt));
						logger.debug("Date eDt", eDt);

						Object[] ob = consumerInstrumentServiceImpl.getLoraFrameByDevEUIandAppIdandDates(sDt, eDt,
								appId.trim(), devEUI.trim(), String.valueOf(obj.get("interval")));
						// Object[]
						// ob=consumerInstrumentServiceImpl.getLoraFrameByUserIdAndDates(sDt,eDt,userInfo.getId(),String.valueOf(obj.get("interval")));
						logger.debug("Resultant", String.valueOf(ob[0]));

						if (String.valueOf(ob[0]) != null && !String.valueOf(ob[0]).isEmpty()) {
							String[] result = String.valueOf(ob[0]).split(",");
							logger.debug("result length", result.length);
							for (int i = 0; i < result.length; i++) {
								String[] jsonVal = result[i].split(":");
								JSONObject json = null;
								json = new JSONObject();
								json.put("date", jsonVal[0]);
								json.put("units", jsonVal[1]);
								jsonArr.add(json);
							}
						}

						res.put("result", jsonArr);
						String response = JsonUtil.objToJson(res);
						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);

					} else {
						responseEntity = new ResponseEntity<String>("User not associated with device",
								HttpStatus.NOT_FOUND);
					}
				} else {
					responseEntity = new ResponseEntity<String>("userId not exist", HttpStatus.METHOD_NOT_ALLOWED);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /getWaterConsumptions", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/fcm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> fcmHandler(@RequestBody String received, HttpServletRequest request) throws Exception {
		logger.info(" /POST /fcm API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /fcm", HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("userId")) != null && String.valueOf(obj.get("appId")) != null
					&& String.valueOf(obj.get("tokenId")) != null) {

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
				if (userInfo != null) {

					TblPushNotifications p = userLoginService.getNotificationInfoByUserId(String.valueOf(obj.get("userId")));
					if (p != null) {
						p.setAppId(String.valueOf(obj.get("appId")));
						p.setTokenId(String.valueOf(obj.get("tokenId")));
						p.setUpdatedDt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
						userLoginService.persistPushNotification(p);
						responseEntity = new ResponseEntity<String>(HttpStatus.OK);

					} else {
						TblPushNotifications ps=null;
							ps=new TblPushNotifications();
						ps.setUserId(String.valueOf(obj.get("userId")));
						ps.setAppId(String.valueOf(obj.get("appId")));
						ps.setTokenId(String.valueOf(obj.get("tokenId")));
						ps.setCreatedDt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
						ps.setUpdatedDt(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
						userLoginService.persistPushNotification(ps);
						responseEntity = new ResponseEntity<String>(HttpStatus.OK);
					}
				} else {
					responseEntity = new ResponseEntity<String>("userId not exist", HttpStatus.METHOD_NOT_ALLOWED);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /fcm", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}
	
	@RequestMapping(value = "/init", method = {RequestMethod.GET,RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> test1MqttHandler() {
		logger.info("Inside /test");
		ResponseEntity<String> responseEntity = null;		
		try{							
			mqttIntrf.doDemo();
			responseEntity = new ResponseEntity<String>("Connected", HttpStatus.OK);
		 }catch(Exception me){
			 logger.error("Error in /mqtt testing",me);
			 me.printStackTrace();
	     }
		return responseEntity;
		
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getTotalMontlyIntervalWaterConsumptions", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getTotalMontlyIntervalWaterConsumptions(@RequestBody String received,
			HttpServletRequest request) {
		logger.info(" /POST /getTotalMontlyIntervalWaterConsumptions API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /getTotalMontlyIntervalWaterConsumptions",
					HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("userId")) != null && String.valueOf(obj.get("startDate")) != null
					&& String.valueOf(obj.get("endDate")) != null && String.valueOf(obj.get("interval")) != null) {
				// int n=0;
				long startDt = 0;
				long endDt = 0;
				try {
					// n=Integer.parseInt(String.valueOf(obj.get("interval")));
					startDt = Long.parseLong(String.valueOf(obj.get("startDate")));
					endDt = Long.parseLong(String.valueOf(obj.get("endDate")));
				} catch (Exception e) {
					;
				}

				logger.debug("Print startDt ", startDt);
				logger.debug("Print endDt ", endDt);

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
				if (userInfo != null) {
					List<UserDeviceMapping> udmList = userInfo.getUserDeviceMappings();
					if (udmList != null && !udmList.isEmpty()) {
						JSONArray jsonArr = null;
						jsonArr = new JSONArray();
						JSONObject res = null;
						res = new JSONObject();

						for (UserDeviceMapping udm : udmList) {
							Date sDt = DateUtil.convertLongToDateNoZone(startDt, "yyyy-MM-dd");
							Date eDt = DateUtil.convertLongToDateNoZone(endDt, "yyyy-MM-dd");
							logger.debug("Date sDt", sDt);
							logger.debug("Date eDt", eDt);

							Object[] ob = consumerInstrumentServiceImpl.getTotalMontlyIntervalWaterConsumptions(sDt,
									eDt, udm.getAppId(), udm.getDevEUI(), String.valueOf(obj.get("interval")));
							// Object[]
							// ob=consumerInstrumentServiceImpl.getLoraFrameByUserIdAndDates(sDt,eDt,userInfo.getId(),String.valueOf(obj.get("interval")));
							logger.debug("Resultant", String.valueOf(ob[0]));

							JSONArray jArr = null;
							jArr = new JSONArray();

							if (String.valueOf(ob[0]) != null && !String.valueOf(ob[0]).isEmpty()) {
								String[] result = String.valueOf(ob[0]).split(",");
								logger.debug("result length", result.length);
								for (int i = 0; i < result.length; i++) {
									String[] jsonVal = result[i].split(":");
									JSONObject js = null;
									js = new JSONObject();
									js.put("date", jsonVal[0]);
									js.put("units", jsonVal[1]);
									jArr.add(js);
								}
							}

							JSONObject json = null;
							json = new JSONObject();
							json.put("devNode", udm.getDevNode());
							json.put("devEUI", udm.getDevEUI());
							json.put("monthlyConsumptions", jArr);
							jsonArr.add(json);

						}

						res.put("resultant", jsonArr);
						String response = JsonUtil.objToJson(res);
						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);

					} else {
						responseEntity = new ResponseEntity<String>("User not associated with device",
								HttpStatus.NOT_ACCEPTABLE);
					}
				} else {
					responseEntity = new ResponseEntity<String>("userId not exist", HttpStatus.METHOD_NOT_ALLOWED);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			logger.error("Exception in /getTotalMontlyIntervalWaterConsumptions", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getTotalWeeklyIntervalWaterConsumptions", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getTotalWeeklyIntervalWaterConsumptions(@RequestBody String received,
			HttpServletRequest request) {
		logger.info(" /POST /getTotalWeeklyIntervalWaterConsumptions API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /getTotalWeeklyIntervalWaterConsumptions",
					HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("userId")) != null && String.valueOf(obj.get("startDate")) != null
					&& String.valueOf(obj.get("endDate")) != null && String.valueOf(obj.get("interval")) != null) {
				// int n=0;
				long startDt = 0;
				long endDt = 0;
				try {
					startDt = Long.parseLong(String.valueOf(obj.get("startDate")));
					endDt = Long.parseLong(String.valueOf(obj.get("endDate")));

				} catch (Exception e) {
					;
				}

				logger.debug("Print startDt ", startDt);

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
				if (userInfo != null) {
					List<UserDeviceMapping> udmList = userInfo.getUserDeviceMappings();
					if (udmList != null && !udmList.isEmpty()) {
						JSONArray jsonArr = null;
						jsonArr = new JSONArray();
						JSONObject res = null;
						res = new JSONObject();

						for (UserDeviceMapping udm : udmList) {
							Date sDt = DateUtil.convertLongToDateNoZone(startDt, "yyyy-MM-dd");
							Date eDt = DateUtil.convertLongToDateNoZone(endDt, "yyyy-MM-dd");
							logger.debug("Date sDt", sDt);

							Object[] ob = consumerInstrumentServiceImpl.getTotalWeeklyIntervalWaterConsumptions(sDt,
									eDt, udm.getAppId(), udm.getDevEUI(), String.valueOf(obj.get("interval")));
							logger.debug("Resultant", String.valueOf(ob[0]));

							JSONArray jArr = null;
							jArr = new JSONArray();

							if (String.valueOf(ob[0]) != null && !String.valueOf(ob[0]).isEmpty()) {
								String[] result = String.valueOf(ob[0]).split(",");
								logger.debug("result length", result.length);
								for (int i = 0; i < result.length; i++) {
									String[] jsonVal = result[i].split(":");
									JSONObject js = null;
									js = new JSONObject();
									js.put("date", jsonVal[0]);
									js.put("units", jsonVal[1]);
									jArr.add(js);
								}
							}

							JSONObject json = null;
							json = new JSONObject();
							json.put("devNode", udm.getDevNode());
							json.put("devEUI", udm.getDevEUI());
							json.put("weeklyConsumptions", jArr);
							jsonArr.add(json);

						}

						res.put("resultant", jsonArr);
						String response = JsonUtil.objToJson(res);
						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);

					} else {
						responseEntity = new ResponseEntity<String>("User not associated with device",
								HttpStatus.NOT_ACCEPTABLE);
					}
				} else {
					responseEntity = new ResponseEntity<String>("userId not exist", HttpStatus.METHOD_NOT_ALLOWED);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			logger.error("Exception in /getTotalWeeklyIntervalWaterConsumptions", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getTotalMonthWaterConsumptions", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getMonthlyWaterConsumptions(@RequestBody String received,
			HttpServletRequest request) {
		logger.info(" /POST /getTotalMonthWaterConsumptions API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /getTotalMonthWaterConsumptions",
					HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("userId")) != null && String.valueOf(obj.get("startDate")) != null
					&& String.valueOf(obj.get("endDate")) != null) {

				long startDt = 0;
				long endDt = 0;
				try {

					startDt = Long.parseLong(String.valueOf(obj.get("startDate")));
					endDt = Long.parseLong(String.valueOf(obj.get("endDate")));
				} catch (Exception e) {
					;
				}

				logger.debug("Print startDt ", startDt);
				logger.debug("Print endDt ", endDt);

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
				if (userInfo != null) {
					List<UserDeviceMapping> udmList = userInfo.getUserDeviceMappings();
					if (udmList != null && !udmList.isEmpty()) {
						JSONArray jsonArr = null;
						jsonArr = new JSONArray();
						JSONObject res = null;
						res = new JSONObject();

						for (UserDeviceMapping udm : udmList) {

							Date sDt = DateUtil.convertLongToDateNoZone(startDt, "yyyy-MM-dd HH:mm:ss");
							Date eDt = DateUtil.convertLongToDateNoZone(endDt, "yyyy-MM-dd HH:mm:ss");
							logger.debug("Actual sDt", sDt);
							logger.debug("Actual eDt", eDt);

							Long l = consumerInstrumentServiceImpl.getFrameByDevEUIandAppIdandDates(sDt, eDt,
									udm.getAppId(), udm.getDevEUI());
							JSONObject json = null;
							json = new JSONObject();
							json.put("devNode", udm.getDevNode());
							json.put("devEUI", udm.getDevEUI());
							if (l != null) {
								json.put("totalConsumptions", l);
							} else {
								json.put("totalConsumptions", 0);
							}

							jsonArr.add(json);

						}
						res.put("resultant", jsonArr);
						String response = JsonUtil.objToJson(res);
						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);

					} else {
						responseEntity = new ResponseEntity<String>("User not associated with device",
								HttpStatus.NOT_ACCEPTABLE);
					}
				} else {
					responseEntity = new ResponseEntity<String>("userId not exist", HttpStatus.METHOD_NOT_ALLOWED);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			logger.error("Exception in /getTotalMonthWaterConsumptions", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getTotalWaterConsumptions", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getTotalWaterConsumptionsHandler(@RequestBody String received,
			HttpServletRequest request) {
		logger.info(" /POST /getTotalWaterConsumptions API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /getTotalWaterConsumptions", HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("userId")) != null) {

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
				if (userInfo != null) {
					List<UserDeviceMapping> udmList = userInfo.getUserDeviceMappings();
					if (udmList != null && !udmList.isEmpty()) {

						JSONArray jsonArr = null;
						jsonArr = new JSONArray();
						JSONObject result = null;
						result = new JSONObject();

						for (UserDeviceMapping udm : udmList) {
							Long l = consumerInstrumentServiceImpl.getWaterConsumptionsUnitForEndUser(udm.getAppId(),
									udm.getDevEUI());
							JSONObject res = null;
							res = new JSONObject();
							res.put("devNode", udm.getDevNode());
							res.put("devEUI", udm.getDevEUI());
							if (l != null) {
								res.put("totalConsumptions", l);
							} else {
								res.put("totalConsumptions", 0);
							}
							jsonArr.add(res);
						}

						result.put("resultant", jsonArr);
						String response = JsonUtil.objToJson(result);
						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);

					} else {
						responseEntity = new ResponseEntity<String>("User not associated with device",
								HttpStatus.NOT_ACCEPTABLE);
					}
				} else {
					responseEntity = new ResponseEntity<String>("userId not exist", HttpStatus.METHOD_NOT_ALLOWED);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			logger.error("Exception in /getTotalWaterConsumptions", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getCurrTotalWaterConsumptions", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getCurrWaterConsumptionsHandler(@RequestBody String received,
			HttpServletRequest request) {
		logger.info(" /POST /getCurrTotalWaterConsumptions API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /getCurrTotalWaterConsumptions",
					HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("userId")) != null) {

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
				if (userInfo != null) {
					List<UserDeviceMapping> udmList = userInfo.getUserDeviceMappings();
					if (udmList != null && !udmList.isEmpty()) {

						SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
						Date currDate = DATE_FORMAT.parse(DATE_FORMAT.format(new Date()));

						JSONArray jsonArr = null;
						jsonArr = new JSONArray();
						JSONObject result = null;
						result = new JSONObject();

						for (UserDeviceMapping udm : udmList) {
							Long l = consumerInstrumentServiceImpl.getWaterConsumptionsForCurrDate(udm.getAppId(),
									udm.getDevEUI(), currDate);
							JSONObject res = null;
							res = new JSONObject();
							res.put("devNode", udm.getDevNode());
							res.put("devEUI", udm.getDevEUI());
							if (l != null) {
								res.put("totalConsumptions", l);
							} else {
								res.put("totalConsumptions", 0);
							}
							jsonArr.add(res);
						}

						result.put("resultant", jsonArr);
						String response = JsonUtil.objToJson(result);
						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);

					} else {
						responseEntity = new ResponseEntity<String>("User not associated with device",
								HttpStatus.NOT_ACCEPTABLE);
					}
				} else {
					responseEntity = new ResponseEntity<String>("userId not exist", HttpStatus.METHOD_NOT_ALLOWED);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			logger.error("Exception in /getCurrTotalWaterConsumptions", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getGraphUnits", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getGraphUnits(@RequestBody String received, HttpServletRequest request) {
		logger.info(" /POST /getGraphUnits API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /getGraphUnits", HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("userId")) != null && String.valueOf(obj.get("reqDate")) != null) {
				long reqDt = 0;
				try {
					reqDt = Long.parseLong(String.valueOf(obj.get("reqDate")));

				} catch (Exception e) {
					;
				}

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
				if (userInfo != null) {
					List<UserDeviceMapping> udmList = userInfo.getUserDeviceMappings();
					if (udmList != null && !udmList.isEmpty()) {
						JSONArray jsonArr = null;
						jsonArr = new JSONArray();
						JSONObject res = null;
						res = new JSONObject();

						Date rDt = DateUtil.convertLongToDateNoZone(reqDt + 19800000, "yyyy-MM-dd");
						logger.debug("Date rDt", rDt);
						logger.debug("Date rDt", DateUtil.changeDateFromat(rDt));
						logger.debug("Date rDt", DateUtil.changeDateFromatIST(rDt));
						logger.debug("Date rDt", OtherFunctions.sqlFormatToDate(DateUtil.changeDateFromatIST(rDt)));

						for (UserDeviceMapping udm : udmList) {
							Object[] ob = consumerInstrumentServiceImpl.getLoraFrameByDateAndDevEUI(rDt,
									udm.getAppId().trim(), udm.getDevEUI().trim());
							logger.debug("Resultant", String.valueOf(ob[0]));

							if (String.valueOf(ob[0]) != null && !String.valueOf(ob[0]).isEmpty()) {
								String[] result = String.valueOf(ob[0]).split(",");
								logger.debug("result length", result.length);
								JSONArray arr = null;
								arr = new JSONArray();
								JSONObject js = null;
								for (int i = 0; i < result.length; i++) {
									String[] jsonVal = result[i].split("&");
									js = new JSONObject();
									js.put("date", jsonVal[0]);
									js.put("units", jsonVal[1]);
									arr.add(js);
								}
								JSONObject json = null;
								json = new JSONObject();
								json.put("devEUI", udm.getDevEUI());
								json.put("nodeName", udm.getDevNode());
								json.put("devices", arr);
								jsonArr.add(json);
							}
						}

						res.put("result", jsonArr);
						String response = JsonUtil.objToJson(res);
						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);

					} else {
						responseEntity = new ResponseEntity<String>("User not associated with device",
								HttpStatus.NOT_FOUND);
					}
				} else {
					responseEntity = new ResponseEntity<String>("userId not exist", HttpStatus.METHOD_NOT_ALLOWED);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /getGraphUnits", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/paymentInfo", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> paymentInfoHandler(@RequestBody String received, HttpServletRequest request) {
		logger.info(" /POST /paymentInfo API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		JSONArray temp = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);

			temp = (JSONArray) obj.get("paymentConfirmation");

		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /paymentInfo", HttpStatus.EXPECTATION_FAILED);
		}

		for (int mp = 0; mp < temp.size(); mp++) {

			obj = (JSONObject) temp.get(mp);

			try {

				if (String.valueOf(obj.get("userId")) != null) {

					long createdOn = 0;
					try {
						createdOn = Long.parseLong(String.valueOf(obj.get("createdOn")));
					} catch (Exception e) {
						;
					}

					TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
					if (userInfo != null) {

						Date crdtOn = DateUtil.convertLongToDateIST(createdOn, "yyyy-MM-dd HH:mm:ss");
						TblPaymentInfo payment = null;
						payment = new TblPaymentInfo();
						payment.setTxnid(String.valueOf(obj.get("txnid")));
						payment.setAmount(String.valueOf(obj.get("amount")));
						payment.setCardnum(String.valueOf(obj.get("cardnum")));
						payment.setDiscount(String.valueOf(obj.get("discount")));
						payment.setEmailId(String.valueOf(obj.get("emailId")));
						payment.setErrorCode(String.valueOf(obj.get("errorCode")));
						payment.setErrorMessage(String.valueOf(obj.get("errorMessage")));
						payment.setMode(String.valueOf(obj.get("mode")));
						payment.setFirstname(String.valueOf(obj.get("firstname")));
						payment.setNetAmountDebit(String.valueOf(obj.get("netAmountDebit")));
						payment.setPhoneno(String.valueOf(obj.get("phoneno")));
						payment.setProductInfo(String.valueOf(obj.get("productInfo")));
						payment.setStatus(String.valueOf(obj.get("status")));
						payment.setRetryCount(String.valueOf(obj.get("retryCount")));
						// payment.setPayuMoneyId(String.valueOf(obj.get("payuMoneyId")));
						payment.setTblUserInfo(userInfo);
						payment.setNameOnCard(String.valueOf(obj.get("nameOnCard")));
						payment.setPaymentId(String.valueOf(obj.get("paymentId")));
						payment.setCreatedOn(crdtOn);
						payment.setUpdateddt(DateUtil.getCurrentDateTimeIST());

						TblPaymentInfo paymentUpdated = paymentBillService.updatePaymentInfo(payment);

						JSONArray billsarray = (JSONArray) obj.get("paymentDueDetails");

						try {
							for (int eachbill = 0; eachbill < billsarray.size(); eachbill++) {

								JSONObject eachbillrep = (JSONObject) billsarray.get(eachbill);

								Bills bill = billdao.getBillsById(Integer.parseInt("" + eachbillrep.get("bill_id")));
								bill.setPayment_status("payed");
								bill.setBill_payed_time(DateUtil.getCurrentDateTimeIST("yyyy-MM-dd HH:mm:ss"));
								bill.setPaymentsrc("mobilegateway");
								billdao.save(bill);

							}
						} catch (Exception e) {

							e.printStackTrace();
						}

						if (paymentUpdated != null) {
							responseEntity = new ResponseEntity<String>(HttpStatus.OK);
						}

					} else {
						responseEntity = new ResponseEntity<String>("User not found", HttpStatus.NOT_FOUND);
					}

				} else {
					responseEntity = new ResponseEntity<String>("userId not exist", HttpStatus.METHOD_NOT_ALLOWED);
				}

			} catch (Exception e) {
				logger.error("Exception in /paymentInfo", e);
				responseEntity = new ResponseEntity<String>(e.getMessage(), null);
			}

		}

		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/setFeedback", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> setFeedbackHandler(@RequestBody String received,
			@RequestHeader(value = AppConstants.HTTP_HEADER_TOKEN_NAME) String xToken, HttpServletRequest request) {
		logger.info(" /POST /setFeedback API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /setFeedback", HttpStatus.EXPECTATION_FAILED);
		}
		try {
			// Validate X-ACCESS-TOKEN Value
			// JWTKeyGenerator.validateXToken(xToken);

			// Validate Expriy Date
			// unizenCommonServiceImpl.validateXToken(AppConstants.KEY_UNIZEN_MOBILE,
			// xToken);

			if (String.valueOf(obj.get("userId")) != null && String.valueOf(obj.get("type")) != null
					&& String.valueOf(obj.get("textarea")) != null && String.valueOf(obj.get("devEUI")) != null
					&& String.valueOf(obj.get("nodeName")) != null && String.valueOf(obj.get("phoneType")) != null
					&& String.valueOf(obj.get("phoneDeviceVersion")) != null) {

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());

				if (userInfo != null) {
					// String ticketId = new PasswordGenerator().randomString(6);
					TblDeviceFeedback f = null;
					f = new TblDeviceFeedback();
					f.setDevEUI(String.valueOf(obj.get("devEUI")));
					f.setNodeName(String.valueOf(obj.get("nodeName")));
					f.setPhoneType(String.valueOf(obj.get("phoneType")));
					f.setPhoneDeviceVersion(String.valueOf(obj.get("phoneDeviceVersion")));
					f.setTextarea(String.valueOf(obj.get("textarea")));
					f.setType(String.valueOf(obj.get("type")));
					f.setTicketId("SWC" + DateUtil.getCurrentDateTimeIST().getTime());
					f.setTblUserInfo(userInfo);
					f.setStatus(AppConstants.open);
					f.setCreatedAt(DateUtil.getCurrentDateTimeIST());
					f.setUpdatedAt(DateUtil.getCurrentDateTimeIST());

					TblDeviceFeedback feedback = deviceInfo.setDeviceFeedback(f);
					if (feedback != null) {
						responseEntity = new ResponseEntity<String>(HttpStatus.OK);
					} else {
						responseEntity = new ResponseEntity<String>(HttpStatus.METHOD_NOT_ALLOWED);
					}

				} else {
					responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);
				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /setFeedback", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getFeedbackInfo", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getFeedbackHandler(@RequestBody String received,
			@RequestHeader(value = AppConstants.HTTP_HEADER_TOKEN_NAME) String xToken, HttpServletRequest request) {
		logger.info(" /POST /getFeedback API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /setFeedback", HttpStatus.EXPECTATION_FAILED);
		}
		try {
			// Validate X-ACCESS-TOKEN Value
			// JWTKeyGenerator.validateXToken(xToken);

			// Validate Expriy Date
			// unizenCommonServiceImpl.validateXToken(AppConstants.KEY_UNIZEN_MOBILE,
			// xToken);

			if (String.valueOf(obj.get("userId")) != null) {

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());

				if (userInfo != null) {
					List<TblDeviceFeedback> feedbacklist = userInfo.getTblDeviceFeedbacks();

					if (feedbacklist != null && !feedbacklist.isEmpty()) {
						JSONArray arr = null;
						arr = new JSONArray();
						JSONObject js = null;
						js = new JSONObject();
						for (TblDeviceFeedback f : feedbacklist) {
							JSONObject json = null;
							json = new JSONObject();
							json.put("id", f.getId());
							json.put("devEUI", f.getDevEUI());
							json.put("nodeName", f.getNodeName());
							json.put("phoneType", f.getPhoneType());
							json.put("phoneDeviceVersion", f.getPhoneDeviceVersion());
							json.put("textarea", f.getTextarea());
							json.put("type", f.getType());
							json.put("ticketId", f.getTicketId());
							json.put("status", f.getStatus());
							json.put("createdAt", DateUtil.changeDateFromat(f.getCreatedAt()));

							arr.add(json);
						}

						js.put("result", arr);
						String response = JsonUtil.objToJson(js);

						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);

					}
				} else {
					responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);

				}

			} else {
				responseEntity = new ResponseEntity<String>("Empty requested body", HttpStatus.BAD_REQUEST);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /getFeedback", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getPaymentInfo", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getPaymentInfoHandler(@RequestBody String received,
			@RequestHeader(value = AppConstants.HTTP_HEADER_TOKEN_NAME) String xToken, HttpServletRequest request) {
		logger.info(" /POST /getPaymentInfo API ", received);
		ResponseEntity<String> responseEntity = null;
		JSONObject obj = null;
		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			return new ResponseEntity<String>("Exception in /getPaymentInfo", HttpStatus.EXPECTATION_FAILED);
		}
		try {

			if (String.valueOf(obj.get("userId")) != null) {

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")).trim());
				if (userInfo != null) {

					List<TblPaymentInfo> payList = userInfo.getTblPaymentInfos();
					if (payList != null && !payList.isEmpty()) {
						JSONArray arr = null;
						arr = new JSONArray();
						JSONObject js = null;
						js = new JSONObject();
						for (TblPaymentInfo p : payList) {
							JSONObject json = null;
							json = new JSONObject();
							json.put("id", p.getId());
							json.put("txnid", p.getTxnid());
							json.put("payuMoneyId", p.getPayuMoneyId());
							json.put("amount", p.getAmount());
							json.put("cardnum", p.getCardnum());
							json.put("discount", p.getDiscount());
							json.put("emailId", p.getEmailId());
							json.put("errorCode", p.getErrorCode());
							json.put("errorMessage", p.getErrorMessage());
							json.put("firstname", p.getFirstname());
							json.put("netAmountDebit", p.getNetAmountDebit());
							json.put("phoneno", p.getPhoneno());
							json.put("productInfo", p.getProductInfo());
							json.put("status", p.getStatus());
							json.put("retryCount", p.getRetryCount());
							json.put("nameOnCard", p.getNameOnCard());
							json.put("paymentId", p.getPaymentId());
							json.put("createdOn", DateUtil.changeDateFromat(p.getCreatedOn()));
							arr.add(json);

						}
						js.put("result", arr);
						String response = JsonUtil.objToJson(js);
						responseEntity = new ResponseEntity<String>(response, HttpStatus.OK);
					} else {
						responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);
					}

				} else {
					responseEntity = new ResponseEntity<String>(HttpStatus.METHOD_NOT_ALLOWED);
				}
			} else {
				responseEntity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}

		} catch (AtAppException e) {
			logger.error("Exception in /getPaymentInfo", e);
			responseEntity = new ResponseEntity<String>(e.getMessage(), e.getHttpStatus());
		}
		return responseEntity;
	}

	@RequestMapping(value = "/changePwd", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> changePasswordHandler(@RequestBody String received) {
		logger.info(" /POST /changePwd");
		logger.debug("/changePwd Received", received);

		JSONObject obj = null;
		ResponseEntity<String> responseEntity = null;

		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			logger.debug("Exception during parser '/changePwd'");
			return new ResponseEntity<String>("Empty received body '/changePwd' ", HttpStatus.DESTINATION_LOCKED);
		}

		try {
			if (String.valueOf(obj.get("userId")) != null && String.valueOf(obj.get("oldPwd")) != null
					&& String.valueOf(obj.get("newPwd")) != null) {

				TblUserInfo userInfo = userLoginService.getUserByUserId(String.valueOf(obj.get("userId")));
				if (userInfo != null) {
					if (userInfo.getPassword().trim().equals(String.valueOf(obj.get("oldPwd")).trim())) {
						userInfo.setPassword(String.valueOf(obj.get("newPwd")));
						userInfo.setPwdChangeDt(DateUtil.getCurrentDateTimeIST());
						userLoginService.changePwd(userInfo);
						responseEntity = new ResponseEntity<String>(HttpStatus.OK);
					} else {
						responseEntity = new ResponseEntity<String>(HttpStatus.EXPECTATION_FAILED);
					}
				} else {
					responseEntity = new ResponseEntity<String>(HttpStatus.METHOD_NOT_ALLOWED);
				}
			}
		} catch (AtAppException e) {
			logger.error("/Exception in '/changePwd' ", e);
			String errorMessage = e.getMessage();
			responseEntity = new ResponseEntity<String>(errorMessage, e.getHttpStatus());

		}

		return responseEntity;
	}

	@RequestMapping(value = {
			"/resetPassword" }, method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> resetPasswordHandler(@RequestBody String received) throws Exception {
		logger.info(" /POST /resetPassword");
		logger.debug("/changePwd Received", received);

		JSONObject obj = null;
		ResponseEntity<String> responseEntity = null;

		try {
			obj = new JSONObject();
			obj = (JSONObject) new JSONParser().parse(received);
		} catch (Exception e) {
			logger.debug("Exception during parser '/resetPassword'");
			return new ResponseEntity<String>("Empty received body '/resetPassword' ", HttpStatus.DESTINATION_LOCKED);
		}

		try {

			if (String.valueOf(obj.get("emailId")) != null) {
				String password = new PasswordGenerator().randomString(6);
				logger.debug("Password generator " + password);
				logger.debug("emailId : ", String.valueOf(obj.get("emailId")));
				String subject = "Your brand new USWM password";

				TblUserInfo userInfo = userLoginService.getUserByEmailId(String.valueOf(obj.get("emailId")).trim());

				if (userInfo != null) {
					if (userInfo.getPwdChangeDt() != null) {
						userInfo.setPassword(password);
						userInfo.setPwdChangeDt(null);
						TblUserInfo user = null;
						user = userLoginService.setPwd(userInfo);
						if (user != null) {
							logger.debug("/inside send Mail");
							String message = consumerInstrumentServiceImpl.getPasswordResetMessage(user);

							SendMail mail = SendMailFactory.getMailInstance();
							try {
								logger.debug("/inside try/catch send Mail");
								mail.send(user.getEmailId(), subject, message);

							} catch (Exception ex) {
								logger.error("/Mail System Error,", ex);
							}

							responseEntity = new ResponseEntity<String>(HttpStatus.OK);
						} else {
							responseEntity = new ResponseEntity<String>(HttpStatus.METHOD_FAILURE);
						}
					} else {
						responseEntity = new ResponseEntity<String>(HttpStatus.DESTINATION_LOCKED);
					}
				} else {

					responseEntity = new ResponseEntity<String>(HttpStatus.METHOD_NOT_ALLOWED);
				}
			} else {
				responseEntity = new ResponseEntity<String>(HttpStatus.NOT_ACCEPTABLE);
			}

		} catch (AtAppException e) {
			logger.error("/Exception in '/resetPassword' ", e);
			String errorMessage = e.getMessage();
			responseEntity = new ResponseEntity<String>(errorMessage, e.getHttpStatus());

		}

		return responseEntity;

	}

}
