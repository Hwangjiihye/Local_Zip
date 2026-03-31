package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kedu.dao.LifeInfoDAO;

@Controller
@RequestMapping("/lifeInfo")
public class LifeInfoController {
	
	@Autowired
	private LifeInfoDAO dao;
	@Autowired
	private Gson gson;

}
