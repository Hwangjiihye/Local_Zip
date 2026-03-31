package com.kedu.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String test() {
		return "map/map";
	}
	
	@ResponseBody
	@RequestMapping("/getAllFacility") // 지도 출력
	public List<SafetyFacilityDTO> getAllFacility(){
		return service.getAllFacility();
	}
	
	@RequestMapping("/saveToiletData") // 공중화장실 DB 저장
	public String saveToiletData() {
		int result = service.saveToiletData();
		System.out.println("Toilet " + result + "개 저장 완료");
		
		return "map/map";
	}
	
	@RequestMapping("/savePoliceData") // 치안 DB 저장
	public String savePoliceData() {
		int result = service.savePoliceData();
//		System.out.println("Poilce " + result + "개 저장 완료");
		
		return "map/map";
	}
	
	@RequestMapping("/updatePoliceLatLng") // 치안 경도/위도 DB 업데이트
	public String updatePoliceLatLng() {
	    int result = service.updatePoliceLatLng();
//	    System.out.println("치안시설 좌표 " + result + "개 업데이트 완료");
	    return "map/map";
	}
	
	@RequestMapping("/saveShelterData") // 대피소 DB 저장
	public String saveShelterData() {
		int result = service.saveShelterData();
//		System.out.println("Shelter " + result + "개 저장 완료");
		
		return "map/map";
	}
}
