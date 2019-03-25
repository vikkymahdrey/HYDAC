package com.team.app.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Arrays;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.team.app.service.PushNotification;


@Service
public class PushNotificationImpl implements PushNotification{

	public void fcm() throws Exception {
		
		
		try {
			 
			  File file = ResourceUtils.getFile("classpath:uz-swc-androidapplication-firebase-adminsdk-dtid9-a16638f470.json");
			  FirebaseOptions options = new FirebaseOptions.Builder().setCredentials(GoogleCredentials.fromStream(new FileInputStream(file))).build();
			  
			//  FirebaseApp app= 	FirebaseApp.initializeApp(options);  
			  
			  if(FirebaseApp.getApps().isEmpty()) { //<--- check with this line
	                FirebaseApp.initializeApp(options);
	            }
			  
			  System.out.println("initialized");  
	 	  		
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
	

}
