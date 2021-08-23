package com.sixnicorn.eateryzip.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dao.b_StoreDao;
import com.sixnicorn.eateryzip.user.dto.b_StoreDto;

@Service
public class b_StoreServiceImpl implements b_StoreService{
	
	@Autowired
	private b_StoreDao dao;

	@Override
	public void addStore(b_StoreDto dto) {
		
		dao.insert(dto);
	}


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
