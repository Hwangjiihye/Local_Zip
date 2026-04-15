package com.kedu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/find")
public class FindAccountController {
	
	@RequestMapping("/toFindId")
	public String toFindId() throws Exception{
		return "members/findId";
	}
	
	@RequestMapping("/toFindPw")
	public String toFind() throws Exception{
		return "members/findPw";
	}
	
	@ExceptionHandler(Exception.class)
	   public String exceptionHandler(Exception e) {
	      e.printStackTrace();
	      return "error";
	   }
}