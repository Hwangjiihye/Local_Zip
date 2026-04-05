package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.MeetingMemberDAO;
import com.kedu.dto.ManageMeetingDTO;
import com.kedu.dto.MeetingMemberDTO;

@Controller
@RequestMapping("/apply")
public class MeetingMemberController {
	
	@Autowired
	public MeetingMemberDAO dao;
	
	@RequestMapping("/applyForm")
	public String applyform(int meet_seq, Model model) {
		model.addAttribute("meet_seq", meet_seq);
		return "meeting/applyForm";
	}
	
	// 한 줄 소개 db에 넣기
	@RequestMapping("/insert")
	public String insert(MeetingMemberDTO dto, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		dto.setMem_id(loginId);
		
		dao.insert(dto);
		
		return "meeting/applySuccess";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
