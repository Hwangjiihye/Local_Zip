package com.kedu.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.MeetingDAO;
import com.kedu.dto.MeetingDTO;

@Controller
@RequestMapping("/meeting")
public class MeetingController {
	
	@Autowired
	public MeetingDAO dao;
	
	// 모임 신청 폼 출력
	@RequestMapping("/list")
	public String list(Model model, HttpSession session) throws Exception {
			
		List<MeetingDTO> list = dao.selectAll();
			
		model.addAttribute("list", list);
		
		String loginId = (String)session.getAttribute("loginId"); 
		
		if(loginId == null) { // 로그인을 안한 상태면 로그인 화면으로 보내기
			return "redirect:/members/loginUi";
		}
			
		return "meeting/meeting";
	}
	
	@RequestMapping("/meetingDetail") // meeting 디테일 jsp로 이동
	public String meetingCreateForm(@RequestParam int seq, Model model) throws Exception{
		System.out.println(seq);
		List<MeetingDTO> list = dao.selectBySeq(seq);
		model.addAttribute("list", list);
		return "meeting/meetingDetail";
	}
	
	// 모임 생성 폼 작성
	@RequestMapping("/meetCreate")
	public String meetCreateFrom() {
		return "meeting/meetCreate";
	}
	
	// 모임 신청 폼 db에 넣기
	@RequestMapping("/meetGenerate")
	public String meetCreateFrom(MeetingDTO dto, HttpSession session) throws Exception {
		
		String loginId = (String)session.getAttribute("loginId");
		
		dto.setMem_id(loginId);
		
		dao.insert(dto);
		
		return "redirect:/meeting/list";
	}
	
	// 마이페이지에서 모임을 눌렀을 때
	@RequestMapping("/myMeeting")
	public String myMeeting() throws Exception{
		return "myPage/myMeeting";
	}
	
	public Map<String, Object> getPageNaviAll(int cpage){

	    int recordCountPerPage = 8;
	    int naviCountPerPage = 10;

	    int recordTotalCount = dao.getAllCount();
	    int pageTotalCount = 0;

	    if(recordTotalCount % recordCountPerPage > 0){
	        pageTotalCount = recordTotalCount / recordCountPerPage + 1;
	    }else{
	        pageTotalCount = recordTotalCount / recordCountPerPage;
	    }

	    if(pageTotalCount == 0) {
	        pageTotalCount = 1;
	    }

	    if(cpage < 1) cpage = 1;
	    if(cpage > pageTotalCount) cpage = pageTotalCount;

	    int startNavi = ((cpage - 1) / naviCountPerPage) * naviCountPerPage + 1;
	    int endNavi = startNavi + (naviCountPerPage - 1);

	    if(endNavi > pageTotalCount){
	        endNavi = pageTotalCount;
	    }

	    boolean needPrev = true;
	    boolean needNext = true;

	    if(startNavi == 1){
	        needPrev = false;
	    }
	    if(endNavi == pageTotalCount){
	        needNext = false;
	    }

	    Map<String, Object> map = new HashMap<>();
	    map.put("cpage", cpage);
	    map.put("startNavi", startNavi);
	    map.put("endNavi", endNavi);
	    map.put("needPrev", needPrev);
	    map.put("needNext", needNext);

	    return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/manageMeeting")
	public String manageMeeting() throws Exception{
		return "myPage/manageMeeting";
	}
}
