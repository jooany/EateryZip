package com.sixnicorn.eateryzip.user.dao;

import com.sixnicorn.eateryzip.user.dto.b_StoreDto;

public interface b_StoreDao {

	// 가게정보 입력하기
	public void insert(b_StoreDto dto);
	// 가게정보 얻어오기
	public b_StoreDto getData(String b_id);
	// 가게정보 수정
	public void update(b_StoreDto dto);
}
