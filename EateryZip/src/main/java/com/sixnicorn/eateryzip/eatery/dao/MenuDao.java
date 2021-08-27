package com.sixnicorn.eateryzip.eatery.dao;

import java.util.List;

import com.sixnicorn.eateryzip.eatery.dto.MenuDto;

public interface MenuDao {
	public void insert(MenuDto dto);
	public List<MenuDto> getList(String b_id);
	
	public List<Integer> getSectionNumList(String b_id);
	public int getSectionCount(String b_id);
	public int getSectionMaxNum(String b_id);
	public void updateSectionName(MenuDto dto);
	public void deleteMenu(int menu_num);
	public void update(MenuDto dto);
	public void deleteSection(int section_num);
}
