package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.MembersDAO;
import com.kedu.dao.VisitLogDAO;

@Controller
@RequestMapping("/log")
public class VisitLogController {

	@Autowired
	private VisitLogDAO dao;

	@Autowired
	private MembersDAO mdao;
	
	
	@ResponseBody
	@RequestMapping("/todayCount") // 차트js 통계용
	public int todayCount() {
		return dao.getTodayVisitCount();
	}
	

}
