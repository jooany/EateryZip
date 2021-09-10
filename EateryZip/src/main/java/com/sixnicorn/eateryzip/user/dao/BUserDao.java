package com.sixnicorn.eateryzip.user.dao;

import java.util.List;

import com.sixnicorn.eateryzip.user.dto.BUserDto;
import com.sixnicorn.eateryzip.user.dto.ReservationDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

public interface BUserDao {
	//인자로 전달하는 아이디에 해당하는 정보를 리턴하는 메소드
	public BUserDto getData(String b_id);
	//인자로 전달된 가입하는 회원의 정보를 DB에 저장하는 메소드
	public boolean insert(BUserDto dto);
	//인자로 전달된 아이딕 존재 하는지 여부를 리턴하는 메소드
	public boolean isExist(String inputId); //boolean type으로 return
	//회원 아이디 찾는 형식
	public String getId(BUserDto dto);
	
	public String getPwd(BUserDto dto);

	public boolean changePwd(BUserDto dto);
	
	/* 혜림 */
	public boolean delete(String b_id);
	
	// 비즈니스회원정보를 수정하는 메소드
	public void update(BUserDto dto);
	// 포장내역 목록
	public List<TakeoutDto> getList(TakeoutDto dto);
	// 포장내역 갯수
	public int getBtakeoutCount(TakeoutDto dto);
	// 예약내역 목록
	public List<ReservationDto> getList2(ReservationDto dto);
	// 예약내역 갯수
	public int getBreservationCount(ReservationDto dto);
}