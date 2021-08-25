package com.sixnicorn.eateryzip.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.b_StoreDto;

//스프링이 객체를 생성하고 spring bean container 에서 관리하도록 어노테이션을 붙여준다. 
@Repository
public class b_StoreDaoImpl implements b_StoreDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(b_StoreDto dto) {
		/*
		 *  Mapper's nameaspace : b_Store
		 *  sql's id : insert
		 *  parameterType : b_StoreDto
		 */
		session.insert("b_Store.insert", dto);
	}

	@Override
	public b_StoreDto getData(String b_id) {
		/*
		 *  Mapper's namespace : b_Store
		 *  sql's id : getData
		 *  parameterType : String
		 *  resultType : b_StoreDto
		 */
		b_StoreDto dto=session.selectOne("b_Store.getData", b_id);
		return dto;
	}

	@Override
	public void update(b_StoreDto dto) {
		/*
		 * Mapper's namespace : b_Store
		 * sql's id : update
		 * parameterType : b_StoreDto
		 */
		session.update("b_Store.update", dto);
	}
}
