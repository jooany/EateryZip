package com.sixnicorn.eateryzip.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.MenuDto;

@Repository
public class MenuDaoImpl implements MenuDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public int getMenuMaxNum(String b_id) {
		return session.selectOne("menu.getMenuMaxNum",b_id);
	}
	@Override
	public void insert(MenuDto dto) {
		session.insert("menu.insert",dto);		
	}
	@Override
	public void update(MenuDto dto) {
		session.update("menu.update",dto);
	}
	@Override
	public List<MenuDto> getList(String b_id){
		return session.selectList("menu.getList",b_id);
	}
	
	@Override
	public List<Integer> getSectionNumList(String b_id){
		return session.selectList("menu.getSectionNumList",b_id);
	}
	@Override
	public int getSectionCount(String b_id) {
		return session.selectOne("menu.getSectionCount",b_id);
	}
	@Override
	public int getSectionMaxNum(String b_id) {
		return session.selectOne("menu.getSectionMaxNum",b_id);
	}
	@Override
	public void updateSectionName(MenuDto dto) {
		session.update("menu.updateSectionName", dto);
	}
	@Override
	public void deleteMenu(MenuDto dto) {
		session.delete("menu.delete_menu",dto);
	}
	@Override
	public int getIsDataInSection(MenuDto dto) {
		return session.selectOne("menu.getIsDataInSection",dto);
	}
	@Override
	public void deleteSection(MenuDto dto) {
		session.delete("menu.delete_section",dto);
	}

}
