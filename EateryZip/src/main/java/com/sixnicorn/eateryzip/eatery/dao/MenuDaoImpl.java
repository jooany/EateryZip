package com.sixnicorn.eateryzip.eatery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.eatery.dto.MenuDto;

@Repository
public class MenuDaoImpl implements MenuDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(MenuDto dto) {
		session.insert("menu.insert",dto);		
	}

}
