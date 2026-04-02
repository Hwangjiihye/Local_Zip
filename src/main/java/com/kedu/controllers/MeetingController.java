package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.MeetingDAO;
import com.kedu.dto.MeetingDTO;

@Controller
@RequestMapping("/meeting")
public class MeetingController {
	
	@Autowired
	public MeetingDAO dao;
	
	// 모임 신청 폼 출력
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
			
		List<MeetingDTO> list = dao.selectAll();
			
		model.addAttribute("list", list);
			
		return "meeting/meeting";
	}
	
	@RequestMapping("/meetingDetail") // meeting 디테일 jsp로 이동
	public String meetingCreateForm() {
		return "meeting/meetingDetail";
	}
	
	// 모임 생성 폼 작성
	@RequestMapping("/meetCreate")
	public String meetCreateFrom() {
		return "meeting/meetCreate";
	}
	
	// 모임 신청 폼 db에 넣기
	@RequestMapping("/meetGenerate")
	public String meetCreateFrom(MeetingDTO dto, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		
		dto.setMem_id(loginId);
		
		dao.insert(dto);
		
		return "redirect:/meeting/list";
	}
}
