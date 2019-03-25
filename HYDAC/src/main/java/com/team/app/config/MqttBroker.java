package com.team.app.config;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.transaction.Transactional;

import org.apache.commons.codec.binary.Base64;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.constant.AppConstants;
import com.team.app.dao.DeviceInfoDao;
import com.team.app.dao.DownlinkQueueDao;
import com.team.app.dao.FrameDao;
import com.team.app.dao.HydacDao;
import com.team.app.dao.LoraConsoildatedPktDao;
import com.team.app.domain.DownlinkQueue;
import com.team.app.domain.LoraFrame;
import com.team.app.domain.TblConsumptionsConfig;
import com.team.app.domain.TblDeviceDetail;
import com.team.app.domain.TblHydacInfo;
import com.team.app.domain.TblLoraConsoildatedPkt;
import com.team.app.logger.AtLogger;
import com.team.app.service.ConsumerInstrumentService;
import com.team.app.service.DownlinkService;
import com.team.app.utils.DateUtil;

@Service
public class MqttBroker implements MqttCallback, MqttIntrf {

	private static final AtLogger logger = AtLogger.getLogger(MqttBroker.class);

	@Autowired
	private HydacDao hydacDao;

	MqttClient client;

	MqttMessage message;

	public void doDemo() {

		try {
			logger.debug("/INside MQTT Broker");
			MqttConnectOptions connOpts = new MqttConnectOptions();
			connOpts.setUserName("loragw");
			connOpts.setPassword("loragw".toCharArray());
			// connOpts.setUserName("elmejjbe");
			// connOpts.setPassword("JXcqOgrUhLfy".toCharArray());
			connOpts.setCleanSession(true);
			client = new MqttClient("tcp://139.59.14.31:1883", MqttClient.generateClientId());
			// client=new MqttClient("tcp://m13.cloudmqtt.com:17303","ABCDEF");
			client.connect(connOpts);
			client.setCallback(this);
			client.subscribe("Unizen");
			MqttMessage message = new MqttMessage();
			message.setPayload("sending.......".getBytes());
			client.publish("Unizen", message);
			System.out.println("Message printing here " + message);
			// System.exit(0);
		} catch (MqttException e) {
			e.printStackTrace();
		}

	}

	public void doDemo(String appId, String devId) {
		try {
			logger.debug("/ INside MQTT Broker" + devId);
			MqttConnectOptions connOpts = new MqttConnectOptions();
			connOpts.setUserName("loragw");
			connOpts.setPassword("loragw".toCharArray());
			connOpts.setCleanSession(true);
			client = new MqttClient("tcp://139.59.14.31:1883", MqttClient.generateClientId());

			client.connect(connOpts);
			client.setCallback(this);
			client.subscribe("application/" + appId + "/node/" + devId + "/rx");
			MqttMessage message = new MqttMessage();
			message.setPayload("sending.......".getBytes());
			client.publish("application/" + appId + "/node/" + devId + "/tx", message);
			System.out.println("Message printing here " + message);
			// System.exit(0);
		} catch (MqttException e) {
			e.printStackTrace();
		}
	}

	
	@Transactional
	public void messageArrived(String topic, MqttMessage message) throws Exception {
		logger.debug("Inside messageArrived");
		try {
			if (!message.toString().isEmpty()) {
				logger.debug("Resultant message " + message.toString());
				byte[] decoded = message.toString().getBytes();
				logger.debug("Bytes[] length " + decoded.length);
				if (decoded != null && decoded.length > 0) {

					TblHydacInfo h = null;
					int i = 0;
					int n = 0;
					String date = "";
					String time = "";
					String ISO4 = "";
					String ISO6 = "";
					String ISO14 = "";
					String NAS2_5 = "";
					String NAS25 = "";
					String NAS5_15 = "";
					String NAS15_25 = "";
					String MAX = "";
					String Drive = "";
					String Temp = "";
					String Sat = "";
					h = new TblHydacInfo();
					for (Byte b : decoded) {
						if (n > 0) {
							h = new TblHydacInfo();
							n = 0;
							date = "";
							time = "";
							ISO4 = "";
							ISO6 = "";
							ISO14 = "";
							NAS2_5 = "";
							NAS25 = "";
							NAS5_15 = "";
							NAS15_25 = "";
							MAX = "";
							Drive = "";
							Temp = "";
							Sat = "";
						}

						if (i == 0) {
							String decodeBinary =String.format("%c", b);
	     		 			 logger.debug("decodeBinary i=0 :",decodeBinary);
							date = String.valueOf(decodeBinary);
							logger.debug("i==0 " + date);
							i++;
						} else if (i == 1) {
							String decodeBinary =String.format("%c", b);
	     		 			 logger.debug("decodeBinary i=1 :",decodeBinary);
							date = date + String.valueOf(decodeBinary) + "-";
							logger.debug("i==1 " + date);
							i++;
						} else if (i == 2) {
							String decodeBinary =String.format("%c", b);
	     		 			date = date + String.valueOf(decodeBinary);
							logger.debug("i==2 " + date);
							i++;
						} else if (i == 3) {
							String decodeBinary =String.format("%c", b);
	     		 			date = date + String.valueOf(decodeBinary) + "-";
							logger.debug("i==3 " + date);
							i++;
						} else if (i == 4) {
							String decodeBinary =String.format("%c", b);
							date = date + "20" + String.valueOf(decodeBinary);
							logger.debug("i==4 " + date);
							i++;
						} else if (i == 5) {
							String decodeBinary =String.format("%c", b);
							date = date + String.valueOf(decodeBinary);
							logger.debug(" Date end On i==5 " + date);
							i++;
						} else if (i == 6) {
							String decodeBinary =String.format("%c", b);
							time = String.valueOf(decodeBinary);
							logger.debug("i==6 " + time);
							i++;
						} else if (i == 7) {
							String decodeBinary =String.format("%c", b);
							time = time + String.valueOf(decodeBinary) + ":";
							logger.debug("i==7 " + time);
							i++;
						} else if (i == 8) {
							String decodeBinary =String.format("%c", b);
							time = time + String.valueOf(decodeBinary);
							logger.debug("i==8 " + time);
							i++;
						} else if (i == 9) {
							String decodeBinary =String.format("%c", b);
							time = time + String.valueOf(decodeBinary) + ":";
							logger.debug("i==9 " + time);
							i++;
						} else if (i == 10) {
							String decodeBinary =String.format("%c", b);
							time = time + String.valueOf(decodeBinary);
							logger.debug("i==10 " + time);
							i++;
						} else if (i == 11) {
							String decodeBinary =String.format("%c", b);
							time = time + String.valueOf(decodeBinary);
							logger.debug("Time end on i==11 " + time);
							i++;
						} else if (i == 12 || i == 13 || i == 14 || i == 15) {
							String decodeBinary =String.format("%c", b);
							ISO4 = ISO4 + String.valueOf(decodeBinary);
							logger.debug("i>11 && i<16 " + ISO4);
							i++;
						} else if (i == 16 || i == 17 || i == 18 || i == 19) {
							String decodeBinary =String.format("%c", b);
							ISO6 = ISO6 + String.valueOf(decodeBinary);
							logger.debug("i>15 && i<20" + ISO6);
							i++;
						} else if (i == 20 || i == 21 || i == 22 || i == 23) {
							String decodeBinary =String.format("%c", b);
							ISO14 = ISO14 + String.valueOf(decodeBinary);
							logger.debug("i>19 && i<24 " + ISO14);
							i++;
						} else if (i == 24 || i == 25 || i == 26 || i == 27) {
							String decodeBinary =String.format("%c", b);
							NAS2_5 = NAS2_5 + String.valueOf(decodeBinary);
							logger.debug("i>23 && i<28 " + NAS2_5);
							i++;
						} else if (i == 28 || i == 29 || i == 30 || i == 31) {
							String decodeBinary =String.format("%c", b);
							NAS25 = NAS25 + String.valueOf(decodeBinary);
							logger.debug("i>27 && i<32 " + NAS25);
							i++;
						} else if (i == 32 || i == 33 || i == 34 || i == 35) {
							String decodeBinary =String.format("%c", b);
							NAS5_15 = NAS5_15 + String.valueOf(decodeBinary);
							logger.debug("i>31 && i<36 " + NAS5_15);
							i++;
						} else if (i == 36 || i == 37 || i == 38 || i == 39) {
							String decodeBinary =String.format("%c", b);
							NAS15_25 = NAS15_25 + String.valueOf(decodeBinary);
							logger.debug("i>35 && i<40 " + NAS15_25);
							i++;
						} else if (i == 40 || i == 41 || i == 42 || i == 43) {
							String decodeBinary =String.format("%c", b);
							MAX = MAX + String.valueOf(decodeBinary);
							logger.debug("i>39 && i<44 " + MAX);
							i++;
						} else if (i == 44 || i == 45 || i == 46 || i == 47) {
							String decodeBinary =String.format("%c", b);
							Drive = Drive + String.valueOf(decodeBinary);
							logger.debug("i>43 && i<48 " + Drive);
							i++;
						} else if (i == 48 || i == 49 || i == 50 || i == 51) {
							String decodeBinary =String.format("%c", b);
							Temp = Temp + String.valueOf(decodeBinary);
							logger.debug("i>47 && i<52 " + Temp);
							i++;
						} else if (i == 52 || i == 53 || i == 54 || i == 55) {
							String decodeBinary =String.format("%c", b);
							Sat = Sat + String.valueOf(decodeBinary);
							logger.debug("i>51 && i<56 " + Sat);
							h.setCSName("CS1320");
							h.setSerialNumber("045D2");
							h.setVersion("V02.41");
							h.setDate(date.trim());
							h.setTime(time.trim());
							h.setIso4(Float.valueOf(ISO4.trim()));
							h.setIso6(Float.valueOf(ISO6.trim()));
							h.setIso14(Float.valueOf(ISO14.trim()));
							h.setNas2_5(Float.valueOf(NAS2_5.trim()));
							h.setNas25(Float.valueOf(NAS25.trim()));
							h.setNas515(Float.valueOf(NAS5_15.trim()));
							h.setNas1525(Float.valueOf(NAS15_25.trim()));
							h.setMax(Float.valueOf(MAX.trim()));
							h.setDrive(Float.valueOf(Drive.trim()));
							h.setSat(Float.valueOf(Sat.trim()));
							h.setCreatedDt(DateUtil.getCurrentDateTimeIST());
							h.setUpdatedDt(DateUtil.getCurrentDateTimeIST());

							TblHydacInfo hydacInfo = hydacDao.save(h);
							if (hydacInfo != null) {
								n++;
							}

							break;

						}

					} // loop closed here

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deliveryComplete(IMqttDeliveryToken token) {
	}

	public void connectionLost(Throwable cause) {
	}

}
