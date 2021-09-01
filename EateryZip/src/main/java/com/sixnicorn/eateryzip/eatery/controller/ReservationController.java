package com.sixnicorn.eateryzip.eatery.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.eatery.service.ReservationService;
import com.sixnicorn.eateryzip.user.dto.ReservationDto;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService Reservationservice;
	
	@RequestMapping("/eatery/reservation_form")
	public String reservation_form() {
		
		return "eatery/reservation_form";
	}
	
	@RequestMapping(value ="/eatery/reservation_insertform", method = RequestMethod.POST)
	public String reservation_insertform(HttpServletRequest request, HttpSession session) {
		
		return "eatery/reservation_insertform";
	}
	
	@RequestMapping(value = "/eatery/reservation_insert", method = RequestMethod.POST)
	public ModelAndView reservation_insert(ModelAndView mView, ReservationDto dto, HttpSession session) {
		//g_id는 세션에서 얻어낸다.
		String id=(String)session.getAttribute("g_id");
		//ReservationDto 객체에 g_id담기
		dto.setG_id(id);
		Reservationservice.saveReservation(dto);
		mView.addObject("num", dto.getReservation_num());
		mView.setViewName("eatery/reservation_insert");
		return mView;
	}
	
	@RequestMapping("/eatery/reservation_info")
	public String info(HttpServletRequest request) {
	
		Reservationservice.getInfo(request);
		return "eatery/reservation_info";
	}
}








