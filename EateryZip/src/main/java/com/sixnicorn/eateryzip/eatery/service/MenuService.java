package com.sixnicorn.eateryzip.eatery.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sixnicorn.eateryzip.eatery.dto.MenuDto;

public interface MenuService {
	
	public void getList(HttpServletRequest request);
	public Map<String, Object> saveMenuImage(HttpServletRequest request, 
			MultipartFile mFile);
	public void saveMenu(MenuDto dto);
	public Map<String, Object> updateMenu(MenuDto dto);
	public void updateSectionName(HttpServletRequest request,int section_num,String section_name);
	public void deleteMenu(int num);
	public void deleteSection(int num);

}
