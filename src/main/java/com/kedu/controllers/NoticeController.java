package com.kedu.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.NoticeDAO;
import com.kedu.dto.NoticeDTO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDAO ndao;
	
	@RequestMapping("/toNotice")
	public String toNotice(int cPage,Model model) {
		//list 뽑기
		int start = (cPage-1)*10+1;
		int end = cPage*10;
		List<NoticeDTO> list = ndao.getNoticePost(start,end);
		
		//게시글 갯수 가져오기
		int totalCount = ndao.getTotalNotice();
		
		model.addAttribute("cPage",cPage);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list",list);
		return "/notice/notice";
	}
	
	@RequestMapping("/toNoticeDetail")
	public String toNoticeDetail(@RequestParam("notice_seq") int seq,Model model,int cPage) {
		
		//공지사항 내용 불러오기
		NoticeDTO dto = ndao.getContents(seq);
		model.addAttribute("dto",dto);
		model.addAttribute("cPage",cPage);
		
		return "/notice/noticeDetail";
	}
}
