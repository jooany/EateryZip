package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.BUserDto;

public interface BUserService {
	//비즈니스 회원 로그인 
	public void loginProcess(BUserDto dto, HttpSession session);
	//비즈니스 회원 추가
	public void addUser(BUserDto dto);
	//회원가입 ID check
	public Map<String, Object> isExistId(String inputId);
	
	
	/* 혜림  */
	// 비즈니스 회원 정보
	public void getBmypage(HttpSession session, ModelAndView mView);
	// 비즈니스회원 정보수정
	public void updateUser(BUserDto dto, HttpSession session);
	// 비즈니스회원 프로필이미지
	public Map<String, Object> saveB_profileImage(HttpServletRequest request, MultipartFile image);

}