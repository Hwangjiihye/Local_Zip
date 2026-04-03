package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.MeetingMemberDAO;
import com.kedu.dto.MeetingMemberDTO;

@Controller
@RequestMapping("/apply")
public class MeetingMemberController {
	
	@Autowired
	public MeetingMemberDAO dao;
	
	@RequestMapping("/applyForm")
	public String applyform() {
		return "meeting/applyForm";
	}
	
	// 한 줄 소개 db에 넣기
	@RequestMapping("/insert")
	public String insert(MeetingMemberDTO dto, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		
		dto.setMem_id(loginId);
		
		dao.insert(dto);
		
		return "redirect:/meeting/list";
	}
}
