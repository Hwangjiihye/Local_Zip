package com.kedu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/feedback")
public class FeedBackController {
	
	@RequestMapping("/Home")
	public String feedbackHome() {
		return "feedback/Home";
	}

}
