package com.sixnicorn.eateryzip.user.service;

import javax.servlet.http.HttpServletRequest;

import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

public interface TakeOutService {
	public void getList(HttpServletRequest request);
	//포장 정보 insert
	public void saveTakeOut(TakeoutDto dto);
	//포장 메뉴 insert
	public void saveMenu(TakeoutDto dto, HttpServletRequest request);
	// 예약 정보 가져오기
	public void getInfo(HttpServletRequest request);
	//포장 메뉴 정보 가져오기
	public void getMenuInfo(HttpServletRequest request);
	//B_Store 정보 가져오기 
	public void getStoreInfo(HttpServletRequest request);
	 
}
