package com.sixnicorn.eateryzip.eatery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sixnicorn.eateryzip.eatery.dao.ReservationDao;
import com.sixnicorn.eateryzip.eatery.dto.ReservationDto;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao dao;

	@Override
	public void saveReservation(ReservationDto dto) {
		int seq=dao.getSequence();
		dto.setReservation_num(seq);
		dao.insert(dto);
	}

	@Override
	public void getInfo(HttpServletRequest request) {
		//자세히 보여줄 글번호를 읽어온다. 
		int num=Integer.parseInt(request.getParameter("reservation_num"));
		ReservationDto dto=dao.getData(num);
		request.setAttribute("dto", dto);
		
	}

}
