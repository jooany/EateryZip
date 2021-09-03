package com.sixnicorn.eateryzip.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(ReservationDto dto) {
		session.insert("reservation.insert", dto);
	}

	@Override
	public ReservationDto getData(int num) {
		
		return session.selectOne("reservation.getData", num);
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("reservation.getSequence");
	}

	

}
