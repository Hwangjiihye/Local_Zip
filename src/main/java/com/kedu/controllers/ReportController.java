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
		
		// 관리자 신고 불가 로직 // 신고 당하는 사람이 관리자인지, 일반 사용자인지 체크
		int role = mdao.getRole(dto.getTarget_id());
		
		if(role == 0) {
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