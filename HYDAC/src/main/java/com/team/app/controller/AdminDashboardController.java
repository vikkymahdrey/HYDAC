package com.team.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class AdminDashboardController {
	
	@RequestMapping(value= {"/admindashboard2"}, method=RequestMethod.GET)
	public String admindashboardHandler(HttpServletRequest request, HttpServletResponse response)
	{	
		
			return "AdminDashBoard_2";
	}
    

}
