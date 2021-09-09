package com.sixnicorn.eateryzip.user.dao;

import java.util.List;

import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

public interface TakeOutDao {
	//메뉴의 번호 최대값 가져오기
	public int getTakeOutMaxNum();
	//주문 정보 입력 insert
	public void info_insert(TakeoutDto dto);
	//주문 메뉴 정보 insert
	public void menu_insert(TakeoutDto dto);
	//takeout 테이블 시퀀스 미리 가져오기
	public int getSequence();
	//저장된 주문정보 가져오기
	public TakeoutDto getData(int num);
	//저장된 주문 메뉴 가져오기
	public List<TakeoutDto> getData2(int num);
}
