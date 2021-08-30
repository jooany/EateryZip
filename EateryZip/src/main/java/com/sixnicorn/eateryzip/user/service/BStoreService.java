package com.sixnicorn.eateryzip.user.service;

import javax.servlet.http.HttpServletRequest;

public interface BStoreService {

	
	// 가게등록
//	public void insert(BStoreDto dto);
	
	//가게정보 등록하기
//	public void saveStore(BStoreDto dto, String b_id);

	// 가게정보보기
//	public void getDetail(HttpServletRequest request, ModelAndView mView);


	
	// 가게정보 수정하기 위해 정보 불러오는 기능
	// public void getData(HttpServletRequest request); 
	
	//나현
	public void getList(HttpServletRequest request);
}
