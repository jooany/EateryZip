package com.sixnicorn.eateryzip.eatery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSession session;
}
