package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.FeedBackDAO;
import com.kedu.dto.FeedBackDTO;

@Controller
@RequestMapping("/feedback")
public class FeedBackController {
	
	@Autowired
	public FeedBackDAO dao;
	
	@RequestMapping("/feedbackHome")
	public String feedbackHome() {
	    return "feedback/feedbackHome";
	}
	
	@RequestMapping("/feedbackInsert")
	public String feedbackWrite(FeedBackDTO dto, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		
		dto.setMem_id(loginId);
		
		dao.insert(dto);
		
	    return "feedback/feedbackWrite";
	}

}
