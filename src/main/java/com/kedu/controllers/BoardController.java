package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kedu.dao.BoardDAO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private Gson gson;

	@Autowired
	private BoardDAO dao;
	
	
	@RequestMapping("/lifeInfo")
	public String lifeInfo() {
		return "board/life-info";
	}
	
	@RequestMapping("/concern")
	public String concern() {
		return "board/concern";
	}
	
	@RequestMapping("/write")
	public String write_lifeInfo() {
		return "board/write";
	}
	
	
	
	
	
	
	// 게시물 상세보기
	@RequestMapping("/postDetail")
	public String postDetail() {
		return "board/postDetail";
	}
}
