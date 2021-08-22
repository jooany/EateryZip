package com.sixnicorn.eateryzip.user.service;

import javax.servlet.http.HttpSession;

import com.sixnicorn.eateryzip.user.dto.b_UserDto;

public interface b_UserService {
	//비즈니스 회원 로그인 
	public void loginProcess(b_UserDto b_dto, HttpSession session);
	//비즈니스 회원 추가
	public void addUser(b_UserDto dto);
}
