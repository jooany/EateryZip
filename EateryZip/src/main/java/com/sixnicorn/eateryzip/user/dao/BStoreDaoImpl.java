package com.sixnicorn.eateryzip.user.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;

@Repository
public class BStoreDaoImpl implements BStoreDao {

	@Autowired
	private SqlSession session;
	
	// 혜림
	
	@Override
	public void insert(BStoreDto dto) {
		/*
		 	namespace : BStore
		 	sql id : insert
		 	parameterType : BStoreDto
		 */
		session.insert("BStore.insert", dto);
	}

	@Override
	public void update(BStoreDto dto) {
		/*
		 	namespace : BStore
		 	sql id : update
		 	parameterType : BStoreDto
		*/
		session.update("BStore.update", dto);
	}

	@Override
	public BStoreDto getStore(String b_id) {
		/*
		 	namespace : BStore
		 	sql id : getStore
		 	parameterType : String
		 	resultType : BStoreDto
		*/
		return session.selectOne("BStore.getStore", b_id);
	}



	// 나현
	@Override
	public List<BStoreDto> getList(BStoreDto dto) {
		return session.selectList("BStore.getList", dto);
	}

	@Override
	public int getCount(BStoreDto dto) {
		/*
		 * Mapper's namespace : BStore
		 * sql's id : getCount
		 * resultType : int
		 */
		return session.selectOne("BStore.getCount");
	}
}



