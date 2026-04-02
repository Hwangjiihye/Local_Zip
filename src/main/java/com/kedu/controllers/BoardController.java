package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kedu.dao.BoardDAO;
import com.kedu.dto.BoardDTO;

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
	
	@RequestMapping("/insert")
	public String insert(BoardDTO dto, HttpSession session) throws Exception{
	    
	    String mem_id = (String)session.getAttribute("loginId");
		
		int result = dao.insert(dto, mem_id);
		
		return "redirect:/";
	}
	
	
	//생활정보 jsp에 생활정보 카테고리 list만 출력
	@RequestMapping("/list_lifeInfo")
	public String list_lifeInfo() {
		
		int result = dao.list_lifeInfo();
		
		if(result > 0) {
			System.out.println("생활정보 출력 완료");
		}
		
		return "redirect: /board/lifeInfo";
	}


	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 게시물 상세보기
	@RequestMapping("/postDetail")
	public String postDetail() {
		return "board/postDetail";
	}
}
