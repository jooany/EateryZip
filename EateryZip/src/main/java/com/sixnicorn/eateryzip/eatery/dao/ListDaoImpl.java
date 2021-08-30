package com.sixnicorn.eateryzip.eatery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;

@Repository
public class ListDaoImpl implements ListDao{
	@Autowired
	private SqlSession session;

	//BStore의 모든 리스트 가져오기
	@Override
	public List<BStoreDto> getList(BStoreDto dto) {
		/*
		 * Mapper's namespace : BStore
		 * sql's id : getList
		 * parameterType : BStoreDto
		 * resultType : BStoreDto
		 */
		return session.selectList("BStore.getList", dto);
	}
	
	//row 의 총 개수 구하기
	@Override
	public int getCount(BStoreDto dto) {
		/*
		 * Mapper's namespace : BStore
		 * sql's id : getCount
		 * resultType : int
		 */
		return session.selectOne("BStore.getCount");
	}

	@Override
	public BStoreDto getData(int num) {
		/*
		 * Mapper's namespace : BStore
		 * sql's id : getData
		 * parameterType : int
		 * resultType : BStoreDto
		 */
		return session.selectOne("BStore.getData", num);
	}

	
}
