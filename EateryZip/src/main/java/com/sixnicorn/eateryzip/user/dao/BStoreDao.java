package com.sixnicorn.eateryzip.user.dao;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;

public interface BStoreDao {

	// 가게정보 등록하기
	public void insert(BStoreDto dto);
	// 가게정보 보기
	public BStoreDto StoreView(String b_id);
	// 가게정보 수정하기
	public void update(BStoreDto dto);
	//글정보 얻어오기
	public BStoreDto getData(int num);
	//키워드를 활용한 글정보 얻어오기
	public BStoreDto getData(BStoreDto dto);
}
