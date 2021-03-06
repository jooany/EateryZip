package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.BUserDto;
import com.sixnicorn.eateryzip.user.dto.GUserDto;

public interface BUserService {
	//비즈니스 회원 로그인 
	public Map<String, Object> loginProcess(BUserDto dto, HttpSession session , String isSave , HttpServletResponse response);
	//비즈니스 회원 추가
	public Map<String, Object> addUser(BUserDto dto);
	//회원가입 ID check
	public Map<String, Object> isExistId(String inputId);
	//비즈니스 아이디 찾기
	public Map<String, Object> findId(BUserDto dto);
	//비즈니스 패스워드 찾기
	public Map<String, Object> findPwd(BUserDto dto);
	//비즈니스 패스워드 변경
	public Map<String, Object> updatePwd(BUserDto dto, HttpSession session,
			HttpServletResponse response, HttpServletRequest request);
	
	 public Map<String, Object> updatePwd_mypage(BUserDto dto,HttpSession session,
		         HttpServletResponse response, HttpServletRequest request);
	 
	 public Map<String, Object> isExistPwd(String inputPwd,  HttpSession session);
	 
	public Map<String, Object> deleteUser(HttpSession session,HttpServletResponse response, HttpServletRequest request);
	
	/* 혜림  */
	// 비즈니스 회원 정보
	public void getBmypage(HttpSession session, ModelAndView mView);
	// 비즈니스회원 정보수정
	public void updateUser(BUserDto dto, HttpSession session);

	// 포장내역보기
	public void getBtakeoutList(HttpServletRequest request);
	// 예약내역보기
	public void getBreservationList(HttpServletRequest request);
	
}