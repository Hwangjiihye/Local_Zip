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
import com.kedu.dao.FeedBack_reactionDAO;
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
	public FeedBack_reactionDAO reactiondao;
	
	@Autowired
	public FeedBackDAO feedbackdao;
	
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
		
		List<FeedBackDTO> list = dao.list(loginId);
		
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
	
	
	@ResponseBody
	@RequestMapping("/like") // 좋아요
	public String like(int suggestion_seq, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId == null) {
			return "/members/login";
		}
		
		String reaction = reactiondao.selectReaction(loginId, suggestion_seq);
		
		
		// 처음 누름
		if(reaction == null) {
			reactiondao.insert(loginId, suggestion_seq, "Like");
			feedbackdao.plusLike(suggestion_seq);
			return "liked";
		}
		
		// 좋아요 누름 -> 취소
		else if(reaction.equals("Like")) {
			reactiondao.delete(loginId, suggestion_seq);
			feedbackdao.minusLike(suggestion_seq);
			return "cancle";
		}
		
		// 싫어요 -> 좋아요 변경
		else {
			reactiondao.update(loginId, suggestion_seq, "Like");
			feedbackdao.minusUnlike(suggestion_seq);
			feedbackdao.plusLike(suggestion_seq);
			return "change";
		}
	}
	
	@ResponseBody
	@RequestMapping("/unlike")
	public String unlike(int suggestion_seq, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		
		if(loginId == null) {
			return "/members/login";
		}
		
		String reaction = reactiondao.selectReaction(loginId, suggestion_seq);
		
		// 처음 누름
		if(reaction == null) {
			reactiondao.insert(loginId, suggestion_seq, "UNLIKE");
			feedbackdao.plusUnLike(suggestion_seq);
			return "unliked";
		}
		
		// 싫어요 누름 -> 취소
		else if(reaction.equals("UNLIKE")) {
			reactiondao.delete(loginId, suggestion_seq);
			feedbackdao.minusUnlike(suggestion_seq);
			return "cancle";
		}
		
		// 좋아요 -> 싫어요 변경
		else {
			reactiondao.update(loginId, suggestion_seq, "UNLIKE");
			feedbackdao.minusLike(suggestion_seq);
			feedbackdao.plusUnLike(suggestion_seq);
			return "change";
		}
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
	
	// 게시글 삭제
	@ResponseBody
	@RequestMapping("/delete")
	public String delete(int suggestion_seq, HttpSession session) {
		
		String loginId = (String)session.getAttribute("loginId");
		
		FeedBackDTO dto = dao.selectBySeq(suggestion_seq);
		
		if(dto != null && loginId.equals(dto.getMem_id())) {
			
			dao.delete(suggestion_seq);
			return "successDel";
		}
		else {
			return "fail";
		}
	}
}
