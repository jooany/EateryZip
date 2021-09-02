package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.GUserDto;

public interface GUserService {
	//일반 회원 로그인 
	public void loginProcess(GUserDto dto, HttpSession session , String isSave , HttpServletResponse response);
	//일반 회원 추가
	public void addUser(GUserDto dto);
	//회원가입 ID check
	public Map<String, Object> isExistId(String inputId);
	
	
	
	// 혜림 -----------------------------------------------------------------------
	// 일반 회원정보
	public void getGmypage(HttpSession session, ModelAndView mView);
	// 일반회원 정보수정
	public void updateGUser(GUserDto dto, HttpSession session);
	// 일반회원 프로필이미지
	public Map<String, Object> saveG_profileImage(HttpServletRequest request, MultipartFile image);


}
