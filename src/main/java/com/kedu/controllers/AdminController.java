package com.kedu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/adminPage")
	public String test() {
		return "admin/admin";
	}
	
	@RequestMapping("/adminQA")
	public String adminQA() {
		return "admin/adminQ&A";
	}
}
