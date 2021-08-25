package com.sixnicorn.eateryzip.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BStoreController {

	// 가게정보 등록하기 b_id로 사업자번호 인식
	@RequestMapping("/store/store_insertform")
	public String insertform() {
		// 가게등록폼으로 이동시키면 된다.
		return "store/store_insertform";
	}
	
	
	
	
}
