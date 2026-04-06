package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kedu.dao.FeedBackDAO;
import com.kedu.dao.ReportDAO;
import com.kedu.dto.FeedBackDTO;
import com.kedu.dto.ReportDTO;

@Controller
@RequestMapping("/feedback")
public class FeedBackController {
	
	@Autowired
	public FeedBackDAO dao;
	
	@Autowired
	public ReportDAO reportdao;
	
	@Autowired
	public Gson gson;
	
	// 건의사항 작성글 출력
	@RequestMapping("/feedbackHome")
	public String feedbackHome(Model model, HttpSession session) throws Exception {
		
		// 홈에서 비회원일 경우, 로그인 페이지로 보냄
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId == null) {
			return "redirect:/members/login";
		}
		
		List<FeedBackDTO> list = dao.list();
		
		model.addAttribute("list", list);
		
	    return "feedback/feedbackHome";
	}
	
	@RequestMapping("/feedbackWrite")
	public String feedbackWrite() {
		return "feedback/feedbackWrite";
	}
	
	// 건의사항 작성 db 입력
	@RequestMapping("/feedbackInsert")
	public String feedbackWrite(FeedBackDTO dto, HttpSession session) throws Exception {
		
		if(dto.getSuggestion_title().trim().equals("")) return "redirect:/feedback/feedbackWrite";
		
		String nickname = (String)session.getAttribute("nickname");
		String dong = (String)session.getAttribute("dong");
		String loginId = (String)session.getAttribute("loginId");
		
		dto.setMem_nickname(nickname);
		dto.setMem_dong(dong);
		dto.setMem_id(loginId);
		
		dao.insert(dto);
		
	    return "redirect:/feedback/feedbackHome";
	}
	
	// 좋아요 버튼
	@ResponseBody
	@RequestMapping("/like")
	public String like(int suggestion_seq) {
		System.out.println("컨트롤러 들어옴");
	    System.out.println("받은 글번호: " + suggestion_seq);

	    int result = dao.plusLike(suggestion_seq);
	    System.out.println("update 결과: " + result);
	    return "ok";
	}
	
	// 싫어요 버튼
	@ResponseBody
	@RequestMapping("/unlike")
	public String unlike(int suggestion_seq) {
		System.out.println("컨트롤러 들어옴");
		System.out.println("받은 글번호:" + suggestion_seq);
		
		int result = dao.plusUnLike(suggestion_seq);
		System.out.println("update 결과 : " + result);
		return "ok";
	}
	
	// 신고
	@ResponseBody
	@RequestMapping("/report/insert")
	public String report(ReportDTO dto, HttpSession session) {
		
		String loginId = (String)session.getAttribute("loginId");
		
		dto.setMem_id(loginId);
		reportdao.reportInsert(dto);
		
		return "success";
	}
}
