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
public class HomeController {

	@Autowired
	private Gson gson;

	@Autowired
	private BoardDAO dao;

	@Autowired
	private ReplyDAO ReplyDao;

	@Autowired
	private VisitLogDAO vdao;

	// 전체 리스트 출력 내용 반영
	@RequestMapping("/")
	public String home(String sort, Model model, ReplyDTO rdto) throws Exception{

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

		System.out.println("post에 등록된 게시글 수 :" + list.size());

		//--------------------------------------------------------------
		// 좋아요와 댓글 수 출력 -> post_seq : 게시글에 달린 등록된 수를 기준으로 조회.

		//for문으로 list의 담긴 post_seq값을 뽑아서 각 게시글의 댓글 수를 세팅.
		for (BoardDTO post : list) {

			// *(댓글)
			// post_seq를 기준으로 replyDAO에서 count한 댓글 수
			int commentCount = ReplyDao.commentCount(post.getPost_seq());
			// replyDAO에서 뽑아온 Count한 댓글 수를 / BoardDAO > post_hit(=> 댓글 수 저장용 컬럼)에 update 반영
			dao.setCommentCount(commentCount , post.getPost_seq());

			// *(좋아요)
			// post_seq를 기준으로 post_likeDAO에서 count된 개수를 세야할거 같음.

			//	    	System.out.println("해당 게시글에 좋아요 수 :" + like.size());
			System.out.println("해당 게시글에 댓글 수 :" + commentCount);

		}
		//--------------------------------------------------------------

		model.addAttribute("list", list);
		model.addAttribute("sort",sort);

		return "home";
	}

	// ajax용 댓글 수 count
	@ResponseBody // ★중요: JSP 페이지가 아니라 "데이터(숫자)"만 보낸다는 뜻
	@RequestMapping("/board/getCommentCount")
	public int getCommentCount(int post_seq) throws Exception {
		// DB에서 이 게시글의 진짜 댓글 개수를 가져오기
		int count = ReplyDao.commentCount(post_seq);

		// 혹시 모르니 DB의 post_hit 컬럼도 최신화해줍니다. (선택사항)
		dao.setCommentCount(count, post_seq);

		return count; // count된 숫자만, 댓글 수 전달
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



}
