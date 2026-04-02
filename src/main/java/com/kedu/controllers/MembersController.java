package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 로그인 경유 후 아래 로그인으로 이동
	@RequestMapping("/loginUi")
	public String loginUI() throws Exception {
		return "members/login";
	}
	
	// 회원가입 완료 버튼 클릭 시
	@RequestMapping("/signup")
	public String signup(MembersDTO dto, String mem_dong, HttpSession session) {

	    String ssn = dto.getMem_ssn();
	    String genderCode = ssn.substring(7, 8);

	    if (genderCode.equals("1") || genderCode.equals("3")) {
	        dto.setMem_gender(1);
	    } else if (genderCode.equals("2") || genderCode.equals("4")) {
	        dto.setMem_gender(2);
	    }
	    
	    session.setAttribute("dong", mem_dong);
	    
	    System.out.println(mem_dong);
	    
	    dao.insert(dto);
	    return "redirect:/members/loginUi";
	}
	// 로그인, (메인)닉네임 출력(새로운거), 로그인 alert 기능
	@RequestMapping("/login")
	public String login(HttpSession session, String mem_id, String mem_password, RedirectAttributes rttr) throws Exception {
		
		if(mem_id == null || mem_id.trim().equals("") || mem_password == null || mem_password.trim().equals("")) {
			rttr.addFlashAttribute("msg", "empty");
			return "redirect:/members/loginUi";
		}
		
		int result = dao.login(mem_id,  mem_password);
		
		if(result == 1) {
			String nickname = dao.nickname(mem_id);
			String dong = dao.address(mem_id); // 로그인 아이디로 주소 저장(00동 출력용)
			session.setAttribute("loginId", mem_id); 
			session.setAttribute("nickname", nickname);
			session.getAttribute("dong");// 로그인 아이디로 주소 저장(00동 출력용)
			return "redirect:/";
		} else if(result == 0){
			rttr.addFlashAttribute("msg", "pwFail");
		} else {
			rttr.addFlashAttribute("msg", "idFail");
		}
		
		return "redirect:/members/loginUi";
		}
	
	// 마이페이지 아이콘 클릭 시
	@RequestMapping("/mypage")
	public String mypage(HttpSession session) {
		session.getAttribute("nickname");
		if(session.getAttribute("loginId") == null) {
			return "redirect:/members/loginUi";
		}else {
			return "members/mypage";
		}
	}
	
	// 마이페이지 > 내 정보 버튼 클릭 시
	@RequestMapping("/myInfo")
	public String mypage(HttpSession session, Model model) throws Exception{
		String id = (String)session.getAttribute("loginId");
		MembersDTO list = dao.selectAll(id);
		
		model.addAttribute("list",list);
		return "members/myInfo";
	}
	
	//로그아웃 버튼 > 홈으로 이동
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/update")
	public String update(MembersDTO dto, HttpSession session) throws Exception {
		dao.updateById(dto, dto.getMem_id());
		session.setAttribute("nickname", dto.getMem_nickname());
		return "redirect:/members/myInfo";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		dao.deleteById(id);
		session.invalidate();
		return "home";
	}
	
}
