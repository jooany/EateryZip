package com.sixnicorn.eateryzip.user.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;

public class BStoreDaoImpl implements BStoreDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(BStoreDto dto) {
		/*
		 	namespace : BStore
		 	sql id : insert
		 	parameterType : BStoreDto , b_id
		 */
		session.insert("BStore.insert", dto);
	}

	@Override
	public BStoreDto StoreView(String b_id) {
		/*
		 	namespace : BStore
		 	sql id : StoreView
		 	parameterType : String
		 	resultType : BStoreDto
		*/
		return null;
	}

	@Override
	public void update(BStoreDto dto) {
		/*
		 	namespace : BStore
		 	sql id : update
		 	parameterType : BStoreDto
		*/
	}

	@Override
	public BStoreDto getData(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BStoreDto getData(BStoreDto dto) {
		// TODO Auto-generated method stub
		return null;
	}
}

}

