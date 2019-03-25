package com.team.app.utils;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.JSONArray;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.firebase.FirebaseApp;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.TopicManagementResponse;
import com.google.gson.JsonArray;
import com.itextpdf.text.log.SysoCounter;



public class FCMNotification {
	
	final static private String FCM_URL = "https://fcm.googleapis.com/v1/projects/aquacount-6c055/messages:send";
	//final static private String FCM_URL = "https://fcm.googleapis.com/fcm/send";
	final static private String FCM_NotificationURL = "https://fcm.googleapis.com/fcm/notification";

//final static private String FCM_URL = "https://fcm.googleapis.com//v1/projects/aquacount-6c055/messages:send";

	/**

	* 

	* Method to send push notification to Android FireBased Cloud messaging Server.

	* 

	* @param pn Generated and provided from Android Client Developer

	* @param server_key Key which is Generated in FCM Server 

	* @param message which contains actual information.

	* 

	*/

		public static void send_FCM_Notification(List<String> pn,String msgtitle,String msg){
	
			
			try{
		
 
		/*String registrationToken = "cPmG9qIS33c:APA91bF95OPD5-Ca09KtzfgCQjNC6fxe48Fkal5RelwsHEOWpJFzuKd69NkbaHa5-tQTDtB3nYFXon3qbX0q-yWt4ZDtZsaGRKIh6BrC46hf_7PLwWiP3jZuJjYEZfn7706N4exp_DZh";

		// See documentation on defining a message payload.
		Message message = Message.builder()
		    .putData("title", "fcm test")
		    .putData("message", "hello")
		    .setToken(registrationToken)
		    .build();

		// Send a message to the device corresponding to the provided
		// registration token.
		String response = FirebaseMessaging.getInstance().send(message);
		// Response is a message ID string.
		System.out.println("Successfully sent message: " + response);
		*/
		String topic = "aquacount";
		
		
		/*List<String> registrationTokens = Arrays.asList(
			    "cPmG9qIS33c:APA91bF95OPD5-Ca09KtzfgCQjNC6fxe48Fkal5RelwsHEOWpJFzuKd69NkbaHa5-tQTDtB3nYFXon3qbX0q-yWt4ZDtZsaGRKIh6BrC46hf_7PLwWiP3jZuJjYEZfn7706N4exp_DZh",
			    "fTbfccLHBdg:APA91bF-lDasGWmRX0-y0Y8iJcYFwP0tmXMwTuCuNOARd7vt53KsSL4SxN6rxQY3A0ElEPuq_SV9StS0pmgTQZBZQz1pibACKJewC0W7T0t50TtTxzAxuyRmyEPmNidotXqcpA1koXhI",
			    "ckyzKyP7Rfw:APA91bEvalaK_6suqO_vuULn6nuquAhu5kR98-GmnKLDuipHee9CA-DnDMcKPg19hpjt3oUUUg4pwK7-wxQfPpVwho1gGs4z2ARAPS__6CsMZArSq7pxDXppOTrwTRvUSkmy0cTwOanB"
		);*/
		System.out.println(pn);
		List<String> registrationTokens = pn;
			// Subscribe the devices corresponding to the registration tokens to the
			// topic.
			TopicManagementResponse response = FirebaseMessaging.getInstance().subscribeToTopic(
					registrationTokens, topic);
			// See the TopicManagementResponse reference documentation
			// for the contents of response.
			System.out.println(response.getSuccessCount() + " tokens were subscribed successfully");	
		

		// See documentation on defining a message payload.
		Message message = Message.builder()
		    .putData("title", msgtitle)
		    .putData("message", msg)
		    .setTopic(topic)
		    .build();

		// Send a message to the devices subscribed to the provided topic.
		String respons = FirebaseMessaging.getInstance().send(message);
		// Response is a message ID string.
		System.out.println("Successfully sent message: " + respons);
	}catch(Exception e) {
		System.out.println("unsuccessfull");
	}
}
	
	
    
	
public static void send_FCM_NotificationforUser(List<String> pn,String msgtitle,String msg){
	
			
			try{
		
 
		
		String topic = "aquacount";

		System.out.println(pn);
		List<String> registrationTokens = pn;
			// Subscribe the devices corresponding to the registration tokens to the
			// topic.
			TopicManagementResponse response = FirebaseMessaging.getInstance().subscribeToTopic(
					registrationTokens, topic);
			// See the TopicManagementResponse reference documentation
			// for the contents of response.
			System.out.println(response.getSuccessCount() + " tokens were subscribed successfully");	
		

		// See documentation on defining a message payload.
		Message message = Message.builder()
		    .putData("title", msgtitle)
		    .putData("message", msg)
		    .setTopic(topic)
		    .build();

		// Send a message to the devices subscribed to the provided topic.
		String respons = FirebaseMessaging.getInstance().send(message);
		// Response is a message ID string.
		System.out.println("Successfully sent message: " + respons);
	}catch(Exception e) {
		System.out.println("unsuccessfull");
	}
}
	
	
	
	
	

	public static String get_FCM_Notificationkey(List<String>
			pn, String server_key) {
	String project_id="576126064644";
	int status = 0;
	String res="";
		
	
	
	System.out.println("Tokenids received"+pn);
	try {
	
	// Create URL instance.
		URL url = new URL(FCM_NotificationURL);

		// create connection.
		HttpURLConnection conn;

		conn = (HttpURLConnection) url.openConnection();
		conn.setUseCaches(false);
		conn.setDoInput(true);
		conn.setDoOutput(true);


		//set method as POST or GET
		conn.setRequestMethod("POST");

		//pass FCM server key
		conn.setRequestProperty("Authorization","key="+server_key);

		//Specify Message Format
	    conn.setRequestProperty("Content-Type","application/json");
	    
	    conn.setRequestProperty("project_id",project_id);

		//Create JSON Object & pass value
	    JSONObject infojson = new JSONObject();
	    infojson.put("operation", "create");
	    infojson.put("notification_key_name", "mob_group_msg");
		infojson.put("registration_ids",pn);
     
		System.out.println("json"+infojson.toString());


		OutputStreamWriter wrn = new OutputStreamWriter(conn.getOutputStream());
		wrn.write(infojson.toString());
		wrn.flush();
		

		if( null != conn ){
		status = conn.getResponseCode();
		System.out.println("response"+status);
		}

		if( status != 0){
		if( status == 200 ){

		//SUCCESS message
			
        
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		System.out.println("Android Notification Response : " + reader.readLine());
		return res=reader.readLine();
		}else if(status == 401){

		//client side error
        
		System.out.println("Notification Response : TokenId : " + pn + " Error occurred :Unauthorized");
		return res=status+"Unauthorized";

		}/*else if(status == 400){

			//client side error
              
			System.out.println("Notification Response : TokenId : " + tokenids + " Notification key already exists");

			return res= tokenids;
			}*/else if(status == 501){

		//server side error

		System.out.println("Notification Response : [ errorCode=ServerError ] TokenId : " + pn);
		return res=status+"Server error";

		}else if( status == 503){

		//server side error

		System.out.println("Notification Response : FCM Service is Unavailable  TokenId : " + pn);
        return res=status+"FCM Service is Unavailable";
		}


		
		}

		}catch(MalformedURLException mlfexception){

		// Prototcal Error

		System.out.println("Error occurred while sending push Notification!.." + mlfexception.getMessage());

		}catch(IOException mlfexception){

		//URL problem

		System.out.println("Reading URL, Error occurred while sending push Notification!.." + mlfexception.getMessage());

		}catch(JSONException jsonexception){

		//Message format error

		System.out.println("Message Format, Error occurred while sending push Notification!.." + jsonexception.getMessage());

		}catch (Exception exception) {

		//General Error or exception.

		System.out.println("Error occurred while sending push Notification!.." + exception.getMessage());

		}
	
	
	return res;
	
		
		
	}


	

	
	

}
