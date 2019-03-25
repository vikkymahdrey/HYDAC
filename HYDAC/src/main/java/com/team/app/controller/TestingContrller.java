package com.team.app.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;

@Controller
public class TestingContrller {

	
	public static void main(String[] args) {
		 String sDate1="31/12/1998 00:00:00";  
		    Date date1 = null;
			try {
				date1 = new SimpleDateFormat("MM/dd/yyyy").parse(sDate1);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		    System.out.println(sDate1+"\t"+date1);  
	}
	
	
	
	
}