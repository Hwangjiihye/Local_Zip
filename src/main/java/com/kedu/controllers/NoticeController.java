package com.kedu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@RequestMapping("/toNotice")
	public String toNotice() {
		return "/notice/notice";
	}
	
}
