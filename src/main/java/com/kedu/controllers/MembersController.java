package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kedu.dao.MembersDAO;
import com.kedu.dto.MembersDTO;

@Controller
@RequestMapping("/members")
public class MembersController {
	
	@Autowired
	private MembersDAO dao;
	@Autowired
	private Gson gson;
	
	// 회원가입 창으로 이동 클릭 시
	@RequestMapping("/join")
	public String join() {
		return "members/joinform";
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping("/duplCheck")
	public String duplCheck(String mem_id) {
		int duplCheck = dao.duplCheck(mem_id);
		String result = gson.toJson(duplCheck);
		return result;
	}
	
	// 회원가입 완료 버튼 클릭 시
	@RequestMapping("/signup")
	public String signup(MembersDTO dto) {

	    String ssn = dto.getMem_ssn();
	    String genderCode = ssn.substring(7, 8);

	    if (genderCode.equals("1") || genderCode.equals("3")) {
	        dto.setMem_gender(1);
	    } else if (genderCode.equals("2") || genderCode.equals("4")) {
	        dto.setMem_gender(2);
	    }

	    dao.insert(dto);
	    return "redirect:/members/mypage"; // 나중에 로그인 창으로 이동하는 것으로 바꾸기
	}
	
	// 마이페이지 아이콘 클릭 시
	@RequestMapping("/mypage")
	public String mypage() {
		return "members/mypage";
	}
	
	// 마이페이지 > 내 정보 버튼 클릭 시
	@RequestMapping("/myInfo")
	public String mypage(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("loginId");
		MembersDTO list = dao.selectAll(id);
		
		model.addAttribute("list",list);
		return "members/myInfo";
	}
	
	// 로그아웃 버튼 > 홈으로 이동
//	@RequestMapping("/logout")
//	public String logout(HttpSession session) throws Exception {
//		
//		
//	}
	
	// 로그인
	@RequestMapping("/login")
	public String login(HttpSession session, String mem_id, String mem_password) throws Exception {
		
		return "/members/login";
	}
}
