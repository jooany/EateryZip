package com.sixnicorn.eateryzip.eatery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.eatery.dto.ListDto;
import com.sixnicorn.eateryzip.eatery.dto.MenuDto;

@Repository
public class ListDaoImpl implements ListDao{
	@Autowired
	private SqlSession session;
	
	//메뉴 리스트 얻어오기
	@Override
	public List<MenuDto> getList(String b_id){
		return session.selectList("menu.getList",b_id);
	}
	
	//카테고리 개수 얻어오기
	@Override
	public int getSectionCount(String b_id) {
		return session.selectOne("menu.getSectionCount",b_id);
	}
	
	//가게 정보 얻어오기
//	@Override
//	public BStoreDto StoreView(String b_id) {
//		
//		return null;
//	}
}
