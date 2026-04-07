package com.kedu.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.AttachmentDAO;
import com.kedu.dto.AttachmentDTO;

@Controller
@RequestMapping("/attach")
public class AttachmentController {

	@Autowired
	private AttachmentDAO aDao;
	
	@RequestMapping("/list")
	public String getAttachList(@RequestParam("seq")int seq,Model model) {
		List<AttachmentDTO> list = aDao.getAttachment(seq);
		model.addAttribute("list",list);
		return "";
	}
	
	@RequestMapping("/download")
	public void download() {
		
	}
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
