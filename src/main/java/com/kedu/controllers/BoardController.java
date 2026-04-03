package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String concern(String sort, Model model) throws Exception {
		
		if(sort == null){
			sort = "latest";
		}
	    List<BoardDTO> list;
	    
	    // 출력을 어떤 종류를 기준으로 할 지 검사
	    if ("like".equals(sort)) {
	        list = dao.list_concern_like();
	    } else {
	        list = dao.list_concern_latest();
	    }

	    model.addAttribute("list", list);
	    model.addAttribute("sort",sort);

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
		System.out.println(mem_dong);
		dao.insert(dto, mem_id, mem_nickname, mem_dong);
		
		return "redirect:/";
	}
	
	
	//생활정보 jsp에 생활정보 카테고리 list만 출력
	@RequestMapping("/list_lifeInfo")
	public String list_lifeInfo(Model model) throws Exception{
		
		List<BoardDTO> list = dao.list_lifeInfo();
		
		model.addAttribute("lifeInfo", list);
		
		return "board/life-info";
	}
	
	// 게시물 상세보기
	@RequestMapping("/postDetail")
	public String postDetail() {
		return "board/postDetail";
	}
}
