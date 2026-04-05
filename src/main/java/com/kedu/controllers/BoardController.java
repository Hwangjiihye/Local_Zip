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
import com.kedu.dao.ReplyDAO;
import com.kedu.dao.VisitLogDAO;
import com.kedu.dto.BoardDTO;
import com.kedu.dto.ReplyDTO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private Gson gson;

	@Autowired
	private BoardDAO dao;
	@Autowired
	private ReplyDAO ReplyDao;
	@Autowired
	private VisitLogDAO vdao;
	
	@RequestMapping("/lifeInfo")
	public String lifeInfo() {
		return "board/life-info";
	}
	
	@RequestMapping("/concern")
	public String concern(String sort, Model model) throws Exception {
		
		// 기본 정렬
		if(sort == null) {
			sort = "latest";
		}
	    List<BoardDTO> list;
	    
	    // 출력을 어떤 종류를 기준으로 할 지 검사
	    if ("like".equals(sort)) {
	        list = dao.list_concern_like();
	    }else {
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
		
		String post_category = dto.getPost_category();
		
		if("lifeInfo".equals(post_category)) {
			return "redirect:/board/life-info";
		}else if("talk".equals(post_category)) {
			return "redirect:/board/concern";
		}
		
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
	public String postDetail(Model model, int post_seq, HttpSession session) throws Exception{
		
		BoardDTO dto = dao.selectByPost_seq(post_seq);
		model.addAttribute("dto",dto);
		
		String loginId = (String)session.getAttribute("loginId");
		   
		   if(loginId != null) {
		      String category = dao.getCategoryBySeq(post_seq);
		      vdao.postClickVisit(loginId, category);
		   }
		   
		return "board/postDetail";
	}
	
	// 게시글 삭제
	@ResponseBody
	@RequestMapping("/deletePost")
	public String deletePost(int post_seq) {
		dao.deletePost(post_seq);
		
		return "success";
	}
	
	// 게시글 수정
	@ResponseBody
	@RequestMapping("/updatePost")
	public String updatePost(int post_seq, String post_title, String post_contents) {
		dao.updatePost(post_seq, post_title, post_contents);
		
		return "success";
	}
	
	// 댓글 리스트 출력
	@ResponseBody
	@RequestMapping("/replyList")
	public String replyList(int post_seq) {
		List<ReplyDTO> list = ReplyDao.selectByPostSeq(post_seq);
		return  gson.toJson(list);
	}
	
	
}
