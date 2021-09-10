package com.sixnicorn.eateryzip.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

@Repository
public class TakeOutDaoImpl implements TakeOutDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTakeOutMaxNum() {
		
		return session.selectOne("takeout.getTakeOutMaxNum");
	}

	@Override
	public void info_insert(TakeoutDto dto) {
		session.insert("takeout.insert", dto);
		
	}

	@Override
	public void menu_insert(TakeoutDto dto) {
		session.insert("takeout.menu_insert", dto);
	}

	@Override
	public int getSequence() {
		return session.selectOne("takeout.getSequence");
	}

	@Override
	public TakeoutDto getData(int num) {
		
		return session.selectOne("takeout.getData", num);
	}

	@Override
	public List<TakeoutDto> getData2(int num) {
		
		return session.selectList("takeout.getData2", num);
	}

	/*
	 * @Override public BStoreDto getStore(String b_id) {
	 * 
	 * return session.selectOne("BStore.getStore", b_id); }
	 */
}
