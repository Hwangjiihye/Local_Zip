package com.kedu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meeting")
public class MeetingController {
	
	@RequestMapping("/test") // meeting jsp로 이동
	public String test() {
		return "meeting/meeting";
	}
	
	@RequestMapping("/meetingDetail") // meeting 디테일 jsp로 이동
	public String meetingCreateForm() {
		return "meeting/meetingDetail";
	}
}
