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
@RequestMapping("/meetingMember")
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
		session.setAttribute("nickName", dto.getMem_nickname());
		String loginId = (String)session.getAttribute("loginId");
		
		
		dto.setMem_id(loginId);
		dao.insert(dto);
		
		return "meeting/applySuccess";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	@ResponseBody
	@RequestMapping("/applyList")
	public List<ManageMeetingDTO> applyList(HttpSession session) {

	    String loginId = (String)session.getAttribute("loginId");

	    return dao.selectApplyList(loginId);
	}
	
	@ResponseBody
	@RequestMapping("/updateStatus")
	public int updateStatus(int seq, int status) {

	    return dao.updateStatus(seq, status);
	}
}
