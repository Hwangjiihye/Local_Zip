package com.kedu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/feedback")
public class FeedBackController {
	
	@RequestMapping("/feedbackHome")
	public String feedbackHome() {
	    return "feedback/feedbackHome";
	}
	
	@RequestMapping("/feedbackInsert")
	public String feedbackWrite() {
		
		
		
	    return "feedback/feedbackWrite";
	}

}
