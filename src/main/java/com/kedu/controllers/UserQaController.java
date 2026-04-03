package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.UserQaDAO;

@Controller
@RequestMapping("/qa")
public class UserQaController {
	
	@Autowired
	UserQaDAO userQaDAO;

	@RequestMapping("/toWrite")
	public String toWrite() {
		return "/qa/qaWrite";
	}
}
