package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.service.SafetyFacilityService;

@Controller
@RequestMapping("/map")
public class SafetyFacilityController {
	
	@Autowired
	private SafetyFacilityService service;
	
	@RequestMapping("/test")
	public String test() {
		return "map/map";
	}
	
	@RequestMapping("/saveToiletData")
	public String saveToiletData() {
		int result = service.saveToiletData();
		System.out.println(result + "개 저장 완료");
		
		return "map/map";
	}
}
