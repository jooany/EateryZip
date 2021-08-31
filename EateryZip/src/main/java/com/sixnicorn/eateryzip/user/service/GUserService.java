package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sixnicorn.eateryzip.user.dto.GUserDto;

public interface GUserService {
	//일반 회원 로그인 
	public void loginProcess(GUserDto dto, HttpSession session , String isSave , HttpServletResponse response);
	//일반 회원 추가
	public void addUser(GUserDto dto);
	//회원가입 ID check
	public Map<String, Object> isExistId(String inputId);
}
