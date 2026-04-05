package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.FeedBackDAO;
import com.kedu.dto.FeedBackDTO;

@Controller
@RequestMapping("/feedback")
public class FeedBackController {
	
	@Autowired
	public FeedBackDAO dao;
	
	// 건의사항 작성글 출력
	@RequestMapping("/feedbackHome")
	public String feedbackHome(Model model) throws Exception {
		
		List<FeedBackDTO> list = dao.list();
		
		model.addAttribute("list", list);
		
	    return "feedback/feedbackHome";
	}
	
	@RequestMapping("/feedbackWrite")
	public String feedbackWrite() {
		return "feedback/feedbackWrite";
	}
	
	// 건의사항 작성 db 입력
	@RequestMapping("/feedbackInsert")
	public String feedbackWrite(FeedBackDTO dto, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		
		dto.setMem_id(loginId);
		
		dao.insert(dto);
		
	    return "redirect:/feedback/feedbackHome";
	}
	
}
