package com.sixnicorn.eateryzip.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sixnicorn.eateryzip.user.dto.b_StoreDto;

// bean이 될 수 있도록
@Repository
public class b_StoreDaoImpl implements b_StoreDao {
	// 핵심의존 객체
	@Autowired
	private SqlSession session;

	@Override
	public void insert(b_StoreDto dto) {
		session.insert("b_store.insert", dto);
		
	}
	
	

}
