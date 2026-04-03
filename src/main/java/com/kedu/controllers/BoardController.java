package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		String mem_nickname = (String)session.getAttribute("nickname");
		String mem_dong = (String)session.getAttribute("dong");
		
		dao.insert(dto, mem_id, mem_nickname, mem_dong);
		
		return "redirect:/";
	}
	
	
	//생활정보 jsp에 생활정보 카테고리 list만 출력
	@RequestMapping("/list_lifeInfo")
	public String list_lifeInfo(HttpSession session) throws Exception{
		
		List<BoardDTO> list = dao.list_lifeInfo();
		
		session.setAttribute("lifeInfo", list);
		
		return "redirect: /board/lifeInfo";
	}


	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 게시물 상세보기
	@RequestMapping("/postDetail")
	public String postDetail() {
		return "board/postDetail";
	}
}
