package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.UserQaDAO;
import com.kedu.dto.QaDTO;

@Controller
@RequestMapping("/qa")
public class UserQaController {
	
	@Autowired
	UserQaDAO uDAO;

	@RequestMapping("/toQa")
	public String toQa() {
		return "/qa/qa";
	}
	
	@RequestMapping("/toWrite")
	public String toWrite() {
		return "/qa/qaWrite";
	}
	
	@PostMapping("/insert")
	public String insert(@RequestParam("post_title")String title,@RequestParam("post_category")int category
						,@RequestParam("post_contents")String contents,HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		uDAO.insert(new QaDTO(0,id,title,contents,category,"",0,"","",""));
		return "redirect:/qa/toQa";
	}
}
