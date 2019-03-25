package com.team.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WaterSourcesController {

	@RequestMapping("watersourc")
	public String watersource() {
		return "watersource";
	}
	
}
