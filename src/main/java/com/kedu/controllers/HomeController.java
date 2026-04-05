package com.kedu.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.kedu.dao.BoardDAO;
import com.kedu.dto.BoardDTO;

@Controller
public class HomeController {
		
	@Autowired
	private Gson gson;

	@Autowired
	private BoardDAO dao;
	
	// 전체 리스트 출력 내용 반영
	@RequestMapping("/")
	public String home(String sort, Model model) throws Exception{
		
		// 기본 정렬
		if(sort == null) {
			sort = "latest";
		}
	    List<BoardDTO> list;
	    
	    // 출력을 어떤 종류를 기준으로 할 지 검사
	    // dao에 카테고리 별로 최신순, 인기순 정렬하는 다오 생성하면서, dao 이름 반영
	    if ("like".equals(sort)) {
	        list = dao.list_home_like();
	    }else {
	        list = dao.list_home_latest();
	    }

	    model.addAttribute("list", list);
	    model.addAttribute("sort",sort);
		
		return "home";
	}
	
}
