package com.sixnicorn.eateryzip.user.dao;

import com.sixnicorn.eateryzip.user.dto.ReservationDto;

public interface ReservationDao {
	// 예약 저장 하기
	public void insert(ReservationDto dto);
	// 예약 정보 불러오기
	public ReservationDto getData(int num);
	// 시퀀스 미리 얻어오기
	public int getSequence();
}
