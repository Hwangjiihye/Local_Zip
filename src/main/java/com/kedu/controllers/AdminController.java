package com.kedu.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.AdminQaDAO;
import com.kedu.dao.BoardDAO;
import com.kedu.dao.VisitLogDAO;
import com.kedu.dto.QaDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminQaDAO dao;
	
	@Autowired
	private VisitLogDAO vdao;
	
	@Autowired
	private BoardDAO bdao;
	
	@RequestMapping("/adminPage")
	public String test(HttpSession session, Model model) {
		int qaCount = dao.qaCount();
		int memberCount = dao.activityMemberCount();
		
		session.setAttribute("qaCount", qaCount);
		session.setAttribute("memberCount", memberCount);
		model.addAttribute("todayVisitCount", vdao.getTodayVisitCount()); // 일별방문자수
		model.addAttribute("dailyCount", vdao.getDailyVisitCount()); // 기존회원,신규회원 방문수
		model.addAttribute("genderCount", vdao.getGenderCount()); // 성별 도넛차트 통계
		model.addAttribute("ageCount", vdao.getAgeCount()); // 연령대별 도넛차트 통계
		model.addAttribute("categoryCount", bdao.getCategoryCount());
		
		return "admin/admin";
	}
	
	@RequestMapping("/adminQA")
	public String adminQA(Model model, HttpSession session) {
		
		List<QaDTO> list = dao.selectById();
		model.addAttribute("list", list);
		
		int qaCount = dao.qaCount();
		int qaDoneCount = dao.qaDoneCount();
		int qaAllCount = dao.qaAllCount();

		session.setAttribute("qaCount", qaCount);
		session.setAttribute("qaDoneCount", qaDoneCount);
		session.setAttribute("qaAllCount", qaAllCount);
		return "admin/adminQ&A";
	}

	@ResponseBody
	@RequestMapping("/qaList")
	public Map<String, Object> qaList(String status, int cpage){
		
		Map<String, Object> resp = new HashMap<>();
		
		List<QaDTO> list;
		Map<String, Object> pageNavi;
		
		
		if("all".equals(status)) {
			list = dao.selectAllByPage(cpage);
			pageNavi = dao.getPageNaviAll(cpage);
		}else {
			int qaStatus = Integer.parseInt(status);
			list = dao.selectByStatusByPage(qaStatus, cpage);
			pageNavi = dao.getPageNaviByStatus(qaStatus, cpage);
		}
		resp.put("list", list);
		resp.put("pageNavi", pageNavi);

		return resp;
	}
	
	@RequestMapping("/answer")
	public String answer(QaDTO dto, int qa_seq, HttpSession session) {
		
		String adminId = (String) session.getAttribute("loginId");
	    dto.setMem_admin_id(adminId);
	    dao.updateReply(dto, qa_seq);
	    
		return "redirect:/admin/adminQA";
	}
	
	@ResponseBody
	@RequestMapping("/answerReset")
	public String answerReset(int qa_seq) {
		
		dao.answerResetBySeq(qa_seq);
		
		return "redirect:/admin/adminQ&A";
	}
	
	@ResponseBody
	@RequestMapping("/answerUpdate")
	public String answerUpdate(int qa_seq) {
		
		dao.answerUpdateBySeq(qa_seq);
		
		return "redirect:/admin/adminQ&A?seq=" + qa_seq;
	}
	
}
