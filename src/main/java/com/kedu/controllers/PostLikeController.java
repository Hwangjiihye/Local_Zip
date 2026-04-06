package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kedu.dao.BoardDAO;
import com.kedu.dao.PostLikeDAO;

@Controller
@RequestMapping("/like")
public class PostLikeController {

	@Autowired
	private Gson gson;

	@Autowired
	private BoardDAO dao;

	@Autowired
	private PostLikeDAO LikeDao;

	@ResponseBody // 좋아요 숫자 +-1 반영
	@RequestMapping("/toggle")
	public int likeToggle(int post_seq, HttpSession session) {

		String loginId = (String)session.getAttribute("loginId");
//		if(loginId == null) { // 비로그인시 하트 누르면 에러를 유발하는거라고 하는데 필요 없을 듯.
//			return -1;
//		}
		
		// 이미 좋아요를 눌렀는지 DB에서 확인 (count(*)쿼리)
		int isLike = LikeDao.likeCheck(post_seq, loginId);
		System.out.println(isLike);
		
		return 0;
		
//		if(isLike == 0) {
//			
//			int result = dao.setLike(post_seq, loginId);
//			return 1;
//			
//		}else {
//			int result = dao.deleteLike(post_seq, loginId);
//			
//			return 0;
//		}


		
	};



}
