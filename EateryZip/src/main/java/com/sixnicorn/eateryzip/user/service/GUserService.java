package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.BUserDto;
import com.sixnicorn.eateryzip.user.dto.GUserDto;

public interface GUserService {
	//일반 회원 로그인 
	public void loginProcess(GUserDto dto, HttpSession session , String isSave , HttpServletResponse response);
	//일반 회원 추가
	public void addUser(GUserDto dto);
	//회원가입 ID check
	public Map<String, Object> isExistId(String inputId);
	//일반 아이디 찾기
	public void findId(GUserDto dto, ModelAndView mView);
	//일반 패스워드 찾기
	public boolean findPwd(GUserDto dto, ModelAndView mView);
	//일반 패스워드 변경
	public void updatePwd(GUserDto dto, ModelAndView mView , HttpSession session);
}
