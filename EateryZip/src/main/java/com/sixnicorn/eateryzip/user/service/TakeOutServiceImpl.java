package com.sixnicorn.eateryzip.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sixnicorn.eateryzip.user.dao.MenuDao;
import com.sixnicorn.eateryzip.user.dto.MenuDto;

@Service
public class TakeOutServiceImpl implements TakeOutService{

	@Autowired
	private MenuDao menuDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		//세션에 로그인 된 비즈니스 아이디를 읽어와서
		String b_id=request.getParameter("b_id");
		
		//저장된 카테고리 번호 리스트를 얻어낸다.
		List<Integer> sectionNumList=menuDao.getSectionNumList(b_id);
		
		//전체 메뉴 list를 얻어낸다.
		List<MenuDto> list=menuDao.getList(b_id);
		
		//view page 에서 필요한 값 request 에 담기
		request.setAttribute("sectionNumList", sectionNumList);
		request.setAttribute("list",list);
		
		
	}


}
