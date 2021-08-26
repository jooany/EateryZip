package com.sixnicorn.eateryzip.eatery.dao;

import java.util.List;

import com.sixnicorn.eateryzip.eatery.dto.ListDto;
import com.sixnicorn.eateryzip.eatery.dto.MenuDto;

public interface ListDao {
	//메뉴 리스트 얻어오기
	public List<MenuDto> getList(String b_id);
	//카테고리 개수 얻어오기
	public int getSectionCount(String b_id);
	//가게 정보 얻어오기
	//public BStoreDto StoreView(String b_id);
}
