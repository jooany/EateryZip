package com.sixnicorn.eateryzip.eatery.dao;

import java.util.List;

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
	
	@Override
	public List<MenuDto> getList(String b_id){
		return session.selectList("menu.getList",b_id);
	}
	@Override
	public int getSectionCount(String b_id) {
		return session.selectOne("menu.getSectionCount",b_id);
	}
	@Override
	public void deleteMenu(int menu_num) {
		session.delete("menu.delete",menu_num);
	}

}
