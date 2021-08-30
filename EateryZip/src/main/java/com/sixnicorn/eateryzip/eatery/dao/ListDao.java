package com.sixnicorn.eateryzip.eatery.dao;

import java.util.List;

import com.sixnicorn.eateryzip.eatery.dto.ListDto;
import com.sixnicorn.eateryzip.user.dto.BStoreDto;

public interface ListDao {
	//글목록
	public List<BStoreDto> getList(BStoreDto dto);
	//글개수
	public int getCount(BStoreDto dto);
	//글정보 얻어오기
	public BStoreDto getData(int num);
}
