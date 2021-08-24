package com.sixnicorn.eateryzip.user.service;

import javax.servlet.http.HttpSession;

import com.sixnicorn.eateryzip.user.dto.BUserDto;

public interface BUserService {
	//비즈니스 회원 로그인 
	public void loginProcess(BUserDto dto, HttpSession session);
	//비즈니스 회원 추가
	public void addUser(BUserDto dto);
}
