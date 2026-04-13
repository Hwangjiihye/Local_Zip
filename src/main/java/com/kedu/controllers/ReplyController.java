package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.ReplyDAO;
import com.kedu.dao.ReportDAO;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyDAO dao;
	
	@Autowired
	private ReportDAO rdao;
	
	// 댓글 입력
	@ResponseBody
	@RequestMapping("/insertReply")
	public String insert(HttpSession session,String reply_contents,int post_seq) {
		String mem_nickname = (String)session.getAttribute("nickname");
		String mem_id = (String)session.getAttribute("loginId");
		
		dao.insertReply(post_seq,mem_id, mem_nickname,reply_contents);
		return "success";
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("/deleteReply")
	public String deleteReply(int reply_seq) {
		
		// 신고 이력 있는 댓글 삭제 막기 로직
		int count = rdao.reportDeleteBlock(reply_seq);
		
		if(count > 0) {
			return "fail";
		}
		
		dao.deleteReply(reply_seq);
		return "success";
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping("/updateReply")
	public String updateReply(int reply_seq, String reply_contents) {
		
		// 신고된 댓글 수정 불가 로직
		int count = rdao.reportUpdateBlock(reply_seq);
		if(count > 0) {
			return "fail";
		}
		
		dao.updateReply(reply_seq, reply_contents);
		return "success";
	}
}
