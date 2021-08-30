package com.sixnicorn.eateryzip.eatery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ListController {

	@RequestMapping("/eatery/list")
	public String list() {
		
		return "eatery/list";
	}

}
