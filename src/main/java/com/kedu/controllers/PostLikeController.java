package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kedu.dao.PostLikeDAO;
import com.kedu.dao.ReplyDAO;

@Controller
@RequestMapping("/like")
public class PostLikeController {

	@Autowired
	private Gson gson;

	@Autowired
	private ReplyDAO ReplyDao;

	@Autowired
	private PostLikeDAO LikeDao;

	@ResponseBody // 좋아요 숫자 +-1 반영
	@RequestMapping("/toggle")
	public String like(HttpSession session) {

		String mem_id = (String)session.getAttribute("loginId");
		
		int isLike = ReplyDao.likeCheck(0, mem_id);
		
		if(isLike == 0) {
			int result = ReplyDao.insertLike(0, mem_id);
			return "addLike";
		}else {
			int result = ReplyDao.deleteLike(0, mem_id);
			return "likeDelete";
		}


		
	};



}
