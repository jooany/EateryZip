package com.sixnicorn.eateryzip.user.dao;


import com.sixnicorn.eateryzip.user.dto.BStoreDto;

public interface BStoreDao {

	// 가게정보 등록하기
	public void insert(String b_id);
	// 가게정보 보기
	public BStoreDto StoreView(String b_id);
	// 가게정보 수정하기
	public void update(BStoreDto dto);
}
