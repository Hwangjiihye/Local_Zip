package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.MembersDAO;
import com.kedu.dao.ReportDAO;
import com.kedu.dto.ReportDTO;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportDAO dao;
	@Autowired
	private MembersDAO mdao;
	
	@ResponseBody
	@RequestMapping("/insert")
	public String insert(ReportDTO dto, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId == null) {
			return "redirect:/members/loginUi";
		}
		
		// 관리자 신고 불가 로직
		int role = mdao.getRole(loginId);
		
		if(role == 1) {
			return "adminFail";
		}
		
		dto.setMem_id(loginId);
		
		//중복신고 막는 로직
		int count = dao.isReport(loginId, dto.getTarget_seq(), dto.getReports_type());
		
		if(count > 0) {
			return "fail";
		}
		
		dao.reportInsert(dto);
		
		return "success";
	}
}