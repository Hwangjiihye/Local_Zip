package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.MeetingDAO;
import com.kedu.dto.MeetingDTO;

@Controller
@RequestMapping("/meeting")
public class MeetingController {
	
	@Autowired
	public MeetingDAO dao;
	
	@RequestMapping("/test") // meeting jsp로 이동
	public String test() {
		return "meeting/meeting";
	}
	
	@RequestMapping("/meetingDetail") // meeting 디테일 jsp로 이동
	public String meetingCreateForm() {
		return "meeting/meetingDetail";
	}
	
	// 모임 생성 폼 작성
	@RequestMapping("meetCreate")
	public String meetCreateFrom() {
		return "meeting/meetCreate";
	}
	
	// 모임 신청 폼
	@RequestMapping("meetCreate")
	public String meetCreateFrom(MeetingDTO dto, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		
		dto.setMem_id(loginId);
		
		dao.insert(dto);
		
		return "meeting/meetCreate";
	}
}
