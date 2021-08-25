package com.sixnicorn.eateryzip.user.dao;

import com.sixnicorn.eateryzip.user.dto.BUserDto;

public interface BUserDao {
	//인자로 전달하는 아이디에 해당하는 정보를 리턴하는 메소드
	public BUserDto getData(String b_id);
	//인자로 전달된 가입하는 회원의 정보를 DB에 저장하는 메소드
	public void insert(BUserDto dto);
	
	
	
	
	// 비즈니스회원정보를 수정하는 메소드
	public void update(BUserDto dto);	
}