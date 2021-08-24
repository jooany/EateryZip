package com.sixnicorn.eateryzip.user.service;

import javax.servlet.http.HttpSession;

import com.sixnicorn.eateryzip.user.dto.GUserDto;

public interface GUserService {
	//일반 회원 로그인 
	public void loginProcess(GUserDto dto, HttpSession session);
	//일반 회원 추가
	public void addUser(GUserDto dto);
}
