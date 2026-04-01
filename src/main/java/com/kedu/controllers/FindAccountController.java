package com.kedu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/find")
public class FindAccountController {
	
	@RequestMapping("/toFindId")
	public String toFindId(){
		return "members/findId";
	}
}
