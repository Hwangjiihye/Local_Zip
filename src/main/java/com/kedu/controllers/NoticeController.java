package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.NoticeDAO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDAO ndao;
	
	@RequestMapping("/toNotice")
	public String toNotice() {
		return "/notice/notice";
	}
	
	@RequestMapping("/toNoticeDetail")
	public String toNoticeDetail() {
		return "/notice/noticeDetail";
	}
}
