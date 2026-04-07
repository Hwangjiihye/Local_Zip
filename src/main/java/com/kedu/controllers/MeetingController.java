package com.kedu.controllers;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.MeetingDAO;
import com.kedu.dao.MeetingMemberDAO;
import com.kedu.dto.MeetingDTO;

@Controller
@RequestMapping("/meeting")
public class MeetingController {
	
	@Autowired
	public MeetingDAO dao;
	
	@Autowired
	public MeetingMemberDAO mdao;
	
	// 모임 신청 폼 출력
	@RequestMapping("/list")
	public String list(Model model, HttpSession session, String category, Integer cpage) throws Exception {
		String loginId = (String)session.getAttribute("loginId"); 
		
		if(loginId == null) { // 로그인을 안한 상태면 로그인 화면으로 보내기
			return "redirect:/members/loginUi";
		}
		
		if(cpage == null) {
	        cpage = 1;
	    }

	    int start = (cpage - 1) * 8 + 1;
	    int end = cpage * 8;
	    
	    List<MeetingDTO> list;
		if(category.equals("all")) {
			list = dao.selectAllByPage(start, end);
		}else {
			list = dao.selectByPage(category, start, end);
		}
		
		List<Map<String, Object>> vlist = dao.isApplied(loginId);
		Set<Integer> appliedSet = new HashSet<>();

		for(Map<String,Object> m : vlist){
			appliedSet.add(((Number)m.get("meet_seq")).intValue());
		}
		
		List<Map<String, Object>> jlist = dao.joinMeet(loginId);
		Set<Integer> joinedSet = new HashSet<>();

		for(Map<String,Object> m : jlist){
			joinedSet.add(((Number)m.get("meet_seq")).intValue());
		}
		
		List<Map<String, Object>> clist = dao.companionMeet(loginId);
		Set<Integer> companionSet = new HashSet<>();

		for(Map<String,Object> m : clist){
			companionSet.add(((Number)m.get("meet_seq")).intValue());
		}
		
		Map<String, Object> navi = this.getPageNaviAll(category, cpage);
		
		session.setAttribute("admin", mdao.adminCheck(loginId));
		int admin = (Integer)session.getAttribute("admin");
		model.addAttribute("admin", admin);
		
	    model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		session.setAttribute("category", category);
		model.addAttribute("category", category);
		model.addAttribute("appliedSet", appliedSet);
		model.addAttribute("joinedSet", joinedSet);
		model.addAttribute("companionSet", companionSet);
		
		session.setAttribute("cPage", cpage);
		model.addAttribute("cPage", cpage);
		return "meeting/meeting";
	}
	
	@RequestMapping("/meetingDetail") // meeting 디테일 jsp로 이동
	public String meetingCreateForm(@RequestParam int seq, String mem_id, Model model, HttpSession session) throws Exception{
		List<MeetingDTO> list = dao.selectBySeq(seq);
		model.addAttribute("meet_seq", seq);
		
		String loginId = (String)session.getAttribute("loginId");
		model.addAttribute("list", list);
			
		mdao.selectByStatus(seq, loginId);
		session.setAttribute("count", mdao.selectByStatus(seq, loginId));
		session.setAttribute("admin", mdao.adminCheck(loginId));
		session.setAttribute("host", mdao.hostCheck(seq, loginId));
		
		
		List<Map<String, Object>> vlist = dao.isApplied(loginId);
		Set<Integer> appliedSet = new HashSet<>();

		for(Map<String,Object> m : vlist){
			appliedSet.add(((Number)m.get("meet_seq")).intValue());
		}
		
		List<Map<String, Object>> jlist = dao.joinMeet(loginId);
		Set<Integer> joinedSet = new HashSet<>();

		for(Map<String,Object> m : jlist){
			joinedSet.add(((Number)m.get("meet_seq")).intValue());
		}
		
		String category = (String)session.getAttribute("category");
		model.addAttribute("category", category);
		model.addAttribute("appliedSet", appliedSet);
		model.addAttribute("joinedSet", joinedSet);
		
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
		String nickname = (String)session.getAttribute("nickname");
		// 한 id당 모임 3개 이상 생성 금지
		int count = dao.countMeetingByWriter(loginId, dto.getMeet_status());
		
		if(count >= 3) {
			session.setAttribute("msg", "over");
			return "redirect:/meeting/list?category=all";
		}
		dto.setMem_id(loginId);
		dto.setMem_nickname(nickname);
		dao.insert(dto);
		
		return "redirect:/meeting/list?category=all";
	}
	
	// 페이지네비게이터
	public Map<String, Object> getPageNaviAll(String category, int cpage){

		int recordCountPerPage = 8;
	    int naviCountPerPage = 10;

	    int recordTotalCount;
	    
	    if(category == null || category.equals("all")) {
	        recordTotalCount = dao.getAllCount();
	    } else {
	    	recordTotalCount = dao.getCategoryCount(category);
	    }
	    
	    int pageTotalCount =
	        (recordTotalCount + recordCountPerPage - 1) / recordCountPerPage;

	    if(pageTotalCount == 0) pageTotalCount = 1;

	    if(cpage < 1) cpage = 1;
	    if(cpage > pageTotalCount) cpage = pageTotalCount;

	    int startNavi =
	        ((cpage - 1) / naviCountPerPage) * naviCountPerPage + 1;

	    int endNavi = startNavi + naviCountPerPage - 1;

	    if(endNavi > pageTotalCount) endNavi = pageTotalCount;

	    boolean needPrev = startNavi != 1;
	    boolean needNext = endNavi != pageTotalCount;

	    Map<String, Object> map = new HashMap<>();

	    map.put("cpage", cpage);
	    map.put("startNavi", startNavi);
	    map.put("endNavi", endNavi);
	    map.put("needPrev", needPrev);
	    map.put("needNext", needNext);

	    return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 마이페이지 모임 탭 (신청 관리)
	@RequestMapping("/manageMeeting")
	public String manageMeeting() throws Exception{
		return "myPage/manageMeeting";
	}
	
	// 마이페이지 모임 탭 (참여중인 모임)
	@RequestMapping("/myMeeting")
	public String myMeeting() {
	    return "myPage/myMeeting";
	}
	
	// 참여중인 모임 리스트 출력
	@ResponseBody
	@RequestMapping("/myMeetingList")
	public List<MeetingDTO> myMeetingList(HttpSession session, Model model) throws Exception{

	    String loginId = (String)session.getAttribute("loginId");

	    return dao.selectMyAllMeeting(loginId);
	}
	
	// 참여중인 모임 탭 > 자세히 보기 클릭 시
	@RequestMapping("/myMeetingDetail")
	public String myMeetingDetail(int seq, Model model) throws Exception{
		
		List<MeetingDTO> list = dao.selectBySeq(seq);
		
		model.addAttribute("list", list);
		
		return "myPage/myMeetingDetail";
	}
	
	// 참여중인 모임 탭 > 모임 삭제 버튼 클릭 시
	@ResponseBody
	@RequestMapping("/deleteMeeting")
	public int deleteMeeting(int seq, int status) throws Exception{
		
		return dao.deleteMeeting(seq, status);
	}
}
