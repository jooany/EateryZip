package com.sixnicorn.eateryzip.user.dao;


import java.util.List;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;
import com.sixnicorn.eateryzip.user.dto.EateryScrapDto;
import com.sixnicorn.eateryzip.user.dto.MenuDto;
import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.StoreImgDto;

public interface BStoreDao {

	// 혜림
	
	// 가게정보 등록하기
	public void insert(BStoreDto dto);
	// 가게정보 보기
	public BStoreDto getStore(String b_id);
	// 가게정보 수정하기
	public void update(BStoreDto dto);
	
	
	
	
	//나현
	// 가게 리스트 불러오기
	public List<BStoreDto> getList(BStoreDto dto);
	public int getCount(BStoreDto dto);
	
	//주연
	public List<StoreImgDto> getStoreImgList(String b_id);
	public List<MenuDto> getMenuList(String b_id);
	
	public List<ReviewDto> getReviewList_R(ReviewDto dto);
	public List<ReviewDto> getReviewList_R_P(ReviewDto dto);
	public List<ReviewDto> getReviewList_P(ReviewDto dto);
	public List<ReviewDto> getReviewList_P_P(ReviewDto dto);
	
	public int getReviewCount(String b_id);
	public void insertStoreImg(StoreImgDto dto);
	public ReviewDto getKeyCount(ReviewDto dto);
	public void doScrap(EateryScrapDto dto);
	public void notScrap(EateryScrapDto dto);
	public int isScrap(EateryScrapDto dto);

}
