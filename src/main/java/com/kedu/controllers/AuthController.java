package com.kedu.controllers;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.AuthDAO;
import com.kedu.dto.AuthDTO;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private AuthDAO dao;

	// 인증번호 발송 요청
	@RequestMapping(value = "/mailCheck", method = RequestMethod.POST)
	@ResponseBody
	public String mailCheck(@RequestParam("email") String email,@RequestParam("auth_type") int auth_type) {

		
		
		// 6자리 랜덤번호 생성
		String authCode = String.valueOf(new Random().nextInt(888888) + 111111);

		try {

			//메일 발송 로직
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			helper.setTo(email);
			helper.setSubject("[게시판] 인증번호 안내");
			helper.setText("인증번호: " + authCode, true);
			mailSender.send(mail);
			System.out.println(authCode);
			//db에 저장
			dao.saveAuth(new AuthDTO(email,authCode,auth_type,0,"0"));
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
		//인증번호 확인
	@RequestMapping(value="/verify" ,method=RequestMethod.POST)
	@ResponseBody
	public String verify(@RequestParam("email")String email,@RequestParam("auth_code") String auth_code) {
		
		if(dao.checkAuth(email, auth_code) > 0) {
			dao.updateVerified(email);
			return "success";
		}
		return "fail";
	}
	
		//최종 가입전에 인증확인
	@RequestMapping(value="/isVerified" ,method=RequestMethod.POST)
	@ResponseBody
	public String isVerified(@RequestParam("email") String email) {
		
		int result = dao.isVerified(email);
		
		return result+"";
	}
	
}
