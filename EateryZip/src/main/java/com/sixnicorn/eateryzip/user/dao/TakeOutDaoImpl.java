package com.sixnicorn.eateryzip.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TakeOutDaoImpl implements TakeOutDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTakeOutMaxNum() {
		
		return session.selectOne("takeout.getTakeOutMaxNum");
	}

}
