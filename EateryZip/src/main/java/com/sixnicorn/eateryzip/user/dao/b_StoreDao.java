package com.sixnicorn.eateryzip.user.dao;

import com.sixnicorn.eateryzip.user.dto.b_StoreDto;

public interface b_StoreDao {

	// 인자로 전달된 아이디가 존재하는지 여부를 리턴하는 메소드
	// public boolean isExist(String inputB_id);
	// 인자로 전달된 가게정보를 DB에 저장하는 메소드
	public void insert(b_StoreDto dto);
	
	
}
