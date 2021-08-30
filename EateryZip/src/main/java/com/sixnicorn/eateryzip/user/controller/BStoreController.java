package com.sixnicorn.eateryzip.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BStoreController {

	// 가게정보 등록하기 b_id로 사업자번호 인식
	@RequestMapping("/store/store_insertform")
	public String insertform(HttpServletRequest request) {
		// request : session영역 b_id 가져오는데 사용
		return "store/store_insertform";
	}
	
	// 가게정보 등록하기 b_id로 사업자번호 인식
//	@RequestMapping("/store/store_insertform")
//	public String insertform(HttpServletRequest request) {
		// request : session영역 b_id 가져오는데 사용
//		return "store/store_insertform";
//	}
	
//	@RequestMapping("/store/store_insert")
//	public String insert(HttpServletRequest request) {
//		String b_id = insert(request);
//		request.setAttribute("b_id", b_id);
//		return "store/store_insert";
//	}
	
		
}
