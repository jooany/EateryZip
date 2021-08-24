package com.sixnicorn.eateryzip.eatery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	
	@RequestMapping("/eatery/reservation_form")
	public String reservation_form() {
		
		return "eatery/reservation_form";
	}
}
