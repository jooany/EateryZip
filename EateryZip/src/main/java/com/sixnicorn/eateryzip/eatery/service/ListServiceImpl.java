package com.sixnicorn.eateryzip.eatery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.eatery.dao.MenuDao;
import com.sixnicorn.eateryzip.eatery.dto.MenuDto;

@Service
public class ListServiceImpl implements ListService{
	
	@Autowired
	private MenuDao menuDao;
	
	//리스트 가져오기 + 섹션 최대 개수 가져오기
	@Override
	public void getList(HttpServletRequest request) {
		//세션에 로그인 된 비즈니스 아이디를 읽어와서
		String b_id=(String)request.getSession().getAttribute("b_id");
		//저장된 카테고리 개수를 얻어낸다.
		int sectionCount=menuDao.getSectionCount(b_id);
		//전체 메뉴 list를 얻어낸다.
		List<MenuDto> list=menuDao.getList(b_id);
			
		//view page 에서 필요한 값 request 에 담기
		request.setAttribute("sectionCount", sectionCount);
		request.setAttribute("list",list);
	}
		
	//가게 정보 가져오기
	@Override
	public void getStoreInfo(HttpSession session, ModelAndView mView) {
		// 로그인된 사업자번호를 읽어온다.
//		String b_id = (String)session.getAttribute("b_id");
//		b_StoreDto dto = dao.getData(b_id);
		// ModelAndView 객체에 담아준다.
//		mView.addObject("dto", dto);
//		return null;
	}
}
