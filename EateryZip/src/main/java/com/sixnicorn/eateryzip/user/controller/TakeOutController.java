package com.sixnicorn.eateryzip.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.TakeoutDto;
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
	
	@RequestMapping(value = "/eatery/takeout_info_insertform", method = RequestMethod.POST)
	public ModelAndView takeout_info_insertform(@RequestParam(value="menu_info",required=true) List<String> info,
			@RequestParam(value="menu_choice",required=true) List<String> choice,
			@RequestParam(value="menu_price",required=true) List<String> price,
			HttpServletRequest request, HttpSession session, ModelAndView mView) {
		
		
		mView.addObject("price",price);
		mView.addObject("choice",choice);
		mView.addObject("info",info);
		mView.setViewName("eatery/takeout_info_insertform");
		System.out.println(choice); 
		 
		
		return mView;
	}
	
	@RequestMapping(value = "/eatery/takeout_info_insert", method = RequestMethod.POST)
	public ModelAndView takeout_info_insert(ModelAndView mView2, TakeoutDto dto, HttpSession session, HttpServletRequest request) {
		//g_id는 세션에서 얻어낸다.
		String id=(String)session.getAttribute("g_id");
		//TakeOutDto 객체에 g_id 담기
		dto.setG_id(id);
		service.saveTakeOut(dto);
		service.saveMenu(dto, request);
		mView2.addObject("num", dto.getTakeout_num());
		mView2.setViewName("eatery/takeout_info_insert");
		return mView2;
	}
	
	@RequestMapping("/eatery/takeout_info")
	public String info(HttpServletRequest request) {
		service.getStoreInfo(request);
		service.getInfo(request);
		service.getMenuInfo(request);
		return "eatery/takeout_info";
	}
}
