package com.kedu.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dto.SafetyFacilityDTO;
import com.kedu.service.SafetyFacilityService;

@Controller
@RequestMapping("/map")
public class SafetyFacilityController {
	
	@Autowired
	private SafetyFacilityService service;
	
	@RequestMapping("/test") // 지도 jsp로 이동
	public String test() throws Exception{
		return "map/map";
	}
	
	@ResponseBody
	@RequestMapping("/getFacilities") // 지도 출력
	public List<SafetyFacilityDTO> getFacilities(){
		return service.getAllFacilities();
	}
	
	@RequestMapping("/saveToiletData") // 공중화장실 DB 저장
	public String saveToiletData() throws Exception{
		int result = service.saveToiletData();
		
		return "map/map";
	}
	
	@RequestMapping("/savePoliceData") // 치안 DB 저장
	public String savePoliceData() throws Exception{
		int result = service.savePoliceData();
		
		return "map/map";
	}
	
	@RequestMapping("/updatePoliceLatLng") // 치안 경도/위도 DB 업데이트
	public String updatePoliceLatLng() throws Exception{
	    int result = service.updatePoliceLatLng();
	    return "map/map";
	}
	
	@RequestMapping("/saveShelterData") // 대피소 DB 저장
	public String saveShelterData() throws Exception{
		int result = service.saveShelterData();
		
		return "map/map";
	}
	@ExceptionHandler(Exception.class)
	   public String exceptionHandler(Exception e) {
	      e.printStackTrace();
	      return "error";
	   }
}