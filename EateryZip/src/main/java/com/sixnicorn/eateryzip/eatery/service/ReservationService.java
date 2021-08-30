package com.sixnicorn.eateryzip.eatery.service;

import javax.servlet.http.HttpServletRequest;

import com.sixnicorn.eateryzip.eatery.dto.ReservationDto;

public interface ReservationService {
	// 예약 정보 저장
	public void saveReservation(ReservationDto dto);
	// 예약 정보 가져오기
	public void getInfo(HttpServletRequest request);
}
