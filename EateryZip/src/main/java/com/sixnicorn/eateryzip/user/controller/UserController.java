package com.sixnicorn.eateryzip.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.b_UserDto;
import com.sixnicorn.eateryzip.user.service.b_UserService;

@Controller
public class UserController {

	@Autowired
	private b_UserService b_service;
	
	//일반회원 로그인 폼으로 이동
	@RequestMapping(value="/users/g_login_form", method = RequestMethod.GET)
	public String g_oginForm(){
		return "users/g_login_form";
	}
	
	//비즈니스 회원 로그인 폼으로 이동
	@RequestMapping(value="/users/b_login_form", method = RequestMethod.GET)
	public String b_loginForm(){
		return "users/b_login_form";
	}
	
	//비즈니스 회원 로그인
	@RequestMapping(value="/users/b_login", method = RequestMethod.POST)
	public ModelAndView b_login(ModelAndView mView, b_UserDto b_dto, 
			HttpSession session) {
			
		b_service.loginProcess(b_dto, session); //Service에 필요로 하는 객체가 있다면 넣어주어야한다.
		mView.setViewName("users/b_login");
		return mView;
	}
		
	//비즈니스 회원 가입 폼으로 이동
	@RequestMapping(value = "/users/b_signup_form", method = RequestMethod.GET )
	public String singupForm() {
		return "users/b_signup_form";
	}		
	
	//비즈니스 회원 가입 
	@RequestMapping(value="/users/b_signup", method=RequestMethod.POST)
	public ModelAndView signup(ModelAndView mView, b_UserDto dto) {
		
		b_service.addUser(dto);
		mView.setViewName("users/b_signup");
		return mView;
	}
}
