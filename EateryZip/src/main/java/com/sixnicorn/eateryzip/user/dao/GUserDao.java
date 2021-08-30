package com.sixnicorn.eateryzip.user.dao;

import com.sixnicorn.eateryzip.user.dto.GUserDto;

public interface GUserDao {
	//인자로 전달하는 아이디에 해당하는 정보를 리턴하는 메소드
	public GUserDto getData(String g_id);
	//인자로 전달된 가입하는 회원의 정보를 DB에 저장하는 메소드
	public void insert(GUserDto dto);
	//인자로 전달된 아이딕 존재 하는지 여부를 리턴하는 메소드
	public boolean isExist(String inputId); //boolean type으로 return
}
