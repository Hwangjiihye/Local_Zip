package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.AdminQaDAO;
import com.kedu.dao.UserQaDAO;
import com.kedu.dto.QaDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminQaDAO dao;
	
	@Autowired
	private UserQaDAO udao;
	
	@RequestMapping("/adminPage")
	public String test(HttpSession session) {
		int qaCount = dao.qaCount();
		int memberCount = dao.activityMemberCount();
		
		session.setAttribute("qaCount", qaCount);
		session.setAttribute("memberCount", memberCount);
		return "admin/admin";
	}
	
	@RequestMapping("/adminQA")
	public String adminQA(Model model) {
		
		List<QaDTO> list = dao.selectById();
		model.addAttribute("list", list);
		
		return "admin/adminQ&A";
	}
	
	@RequestMapping("/answer")
	public String answer(QaDTO dto, int qa_seq, HttpSession session) {
		
		String adminId = (String) session.getAttribute("loginId");
	    dto.setMem_admin_id(adminId);
	    dao.updateReply(dto, qa_seq);
	    
		return "redirect:/admin/adminQA";
	}
	
}
