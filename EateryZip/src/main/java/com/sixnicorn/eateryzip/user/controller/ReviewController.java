package com.sixnicorn.eateryzip.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sixnicorn.eateryzip.user.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	


}
