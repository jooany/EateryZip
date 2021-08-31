package com.sixnicorn.eateryzip.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sixnicorn.eateryzip.user.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	// 포장 리뷰 작성 폼 컨트롤러
	@RequestMapping("/users/g_mypage/review_takeout_form")
	public String takeoutReviewForm(HttpServletRequest request) {
		
		service.getList(request);
		
		return "users/g_mypage/review_takeout_form" ;
	}


}
