package com.sixnicorn.eateryzip.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sixnicorn.eateryzip.user.service.TakeOutService;

@Controller
public class TakeOutController {
	
	@Autowired
	private TakeOutService service;
	
	@RequestMapping("/eatery/takeout_insertform")
	public String takeout_insertform(HttpServletRequest request) {
		
		service.getList(request);
		
		return "eatery/takeout_insertform";
	}
}
