package com.kedu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/apply")
public class MeetingMemberController {
	
	@RequestMapping("/applyForm")
	public String applyform() {
		return "meeting/applyForm";
	}
	

}
