package com.kedu.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.AdminQaDAO;
import com.kedu.dao.BoardDAO;
import com.kedu.dao.NoticeDAO;
import com.kedu.dao.VisitLogDAO;
import com.kedu.dto.BlackListDTO;
import com.kedu.dto.NoticeDTO;
import com.kedu.dto.QaDTO;
import com.kedu.dto.ReportDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminQaDAO dao;
	
	@Autowired
	private VisitLogDAO vdao;
	
	@Autowired
	private BoardDAO bdao;
	
	@Autowired
	private NoticeDAO nDao;
	
	
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
		
		model.addAttribute("menu", "dashboard");
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
		
		model.addAttribute("menu", "qa");
		
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
	public String answerUpdate(String admin_answer, int qa_seq) {
		
		dao.answerUpdateBySeq(admin_answer, qa_seq);
		
		return "redirect:/admin/adminQ&A?seq=" + qa_seq;
	}
	
	
	
	//공지사항 글쓰기로 가기
	
	@RequestMapping("/toNoticeWrite")
	public String toWrite() {
		return "/notice/noticeWrite";
	}
	
	//공지사항(관리자 버전)으로 가기
	@RequestMapping("/toAdminNotice")
	public String toAdminNotice(Model model,int cPage) {
		
		//list 가져오기
		int start = (cPage-1)*10+1;
		int end = cPage*10;
		List<NoticeDTO> list = nDao.getNoticePost(start, end);
		
		//총 게시글 갯수 가져오기
		
		int totalCount = nDao.getTotalNotice();
		
		
		model.addAttribute("list",list);
		model.addAttribute("menu", "notice");
		model.addAttribute("cPage",cPage);
		model.addAttribute("totalCount",totalCount);
		return "/admin/adminNotice";
		
	}
	
	//공지사항 글쓰기 DB에 저장
	@PostMapping("/insertNotice")
	public String insertNotice(HttpSession session,@RequestParam("post_title")String title,
								@RequestParam("post_contents")String contents) {
		System.out.println(session.getAttribute("role"));
		String id =(String)session.getAttribute("loginId");
		int role = (Integer)session.getAttribute("role");
		System.out.println(role);
		nDao.insertNotice(new NoticeDTO(0,id,role,title,contents,"0"));
		
		return "redirect:/admin/toAdminNotice?cPage=1";
	}
	
	//공지사항 글 수정
	@PostMapping("/updateNotice")
	@ResponseBody
	public String updateNotice(@RequestParam("notice_title")String title, 
			@RequestParam("notice_content")String content, @RequestParam("seq")int seq) {
		
		System.out.println(seq + title + content);
		int result = nDao.updateNotice(seq,title,content);
		if(result>0) {
			return "success";	
		}
		return "fail";
	}
	
	//공지사항 글 삭제
	@PostMapping("/deleteNotice")
	@ResponseBody
	public String deleteNotice(@RequestParam("notice_seq")int seq) {
		
		int result = nDao.deleteNoticeBySeq(seq);
		if(result>0) {
			return "success";
		}
		return "fail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// 신고관리 페이지로 이동
	@RequestMapping("/adminBlackList")
	public String adminBlackList(Model model, int cpage, HttpSession session) {
		model.addAttribute("menu", "report");
		List<ReportDTO> list = dao.selectGetPage(cpage * 10 - 9, cpage * 10);
		
		
		// 전체 신고목록 개수 카운트
		int allCount = dao.reportAllCount();
		// 처리완료 신고목록 개수 카운트
		int handleCount = dao.reportHandleCount();
		// 미처리 신고목록 개수 카운트
		int count = dao.reportCount();
		
		model.addAttribute("allCount", allCount);
		model.addAttribute("handleCount", handleCount);
		model.addAttribute("count", count);
		
		model.addAttribute("list", list);
		model.addAttribute("recordCountPerPage", 10);
		model.addAttribute("naviCountPerPage", 10);
		model.addAttribute("recordTotalCount", count);
		model.addAttribute("currentPage", cpage);
		
		session.setAttribute("cpage", cpage);
		return "/admin/adminBlackList";
	}
	
	// 신고관리 -> 신고 목록 출력
	@ResponseBody
	@RequestMapping("/getReportList")
	public Map<String, Object> getReportList(String status, HttpSession session, Model model) {
		Map<String, Object> resp = new HashMap<>();
		List<ReportDTO> list;
		System.out.println("처리 요청 값 : " + status);
		
		
		if("3".equals(status)) { // 처리완료건들 출력 ( 3 : 블랙리스트 처리 완료 / 5: 블랙리스트 해제 처리 완료 )
			list = dao.selectReportContentsByStatusHandle();
		}else if("4".equals(status)) { // 미처리건들 출력
			int reportStatus = Integer.parseInt(status);
			list = dao.selectReportContentsByStatus(reportStatus);
		}else {
			list = dao.selectReportContents();
		}
		
		resp.put("list", list);
		return resp;
	}
	
	// 블랙리스트 등록 로직
	@ResponseBody
	@RequestMapping("/blackOn")
	public String blackOn(int mem_status, String target_id, String black_option, int day, int reports_status, int target_seq) {
		
		int banDays;
			if(day == -1) {
				banDays = 99999;
			}else {
				banDays = day;
			}
			
		// 블랙리스트 테이블에 해당 유저가 있는지 먼저 검사
		List<BlackListDTO> list = dao.selectById(target_id);
		
		// blackList table 정지시작/종료일수 업데이트
		if(list == null || list.isEmpty()) {
			// members table mem_status 업데이트
			dao.updateMemberStatus(mem_status, target_id);
			dao.insertBlackList(target_id, black_option, banDays);
		}else{
			dao.updateBlackEndDate(banDays, target_id);
		}
		// 블랙리스트 등록 시 reports 테이블 status 업데이트
		dao.updateReportsStatus(reports_status, target_id);
		return "success";
	}
	
	// 블랙리스트 해제
	@ResponseBody
	@RequestMapping("/blackOff")
	public String blackOff(int mem_status, int reports_status, String target_id) {
		
		dao.deleteMembersStatus(mem_status, target_id); // 블랙리스트 해제 (membersTable status 업데이트) 로직
		dao.deleteBlackList(target_id); // 블랙리스트 정지시작/종료일수 비우기 (blackList Table) 로직
		dao.updateReportStatus(reports_status, target_id); // 블랙리스트 처리된 건을 해제하는 로직 (해제 -> 해제완료 버튼 구현)
		
		return "success";
	}
	
	// 신고 반려
	@ResponseBody
	@RequestMapping("/reportReject")
	public String reportReject(int reports_seq) {
		
		dao.reportReject(reports_seq);
		
		return "success";
	}
	
}
