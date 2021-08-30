package com.sixnicorn.eateryzip.eatery.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sixnicorn.eateryzip.eatery.dto.MenuDto;
import com.sixnicorn.eateryzip.user.dao.BStoreDao;
import com.sixnicorn.eateryzip.user.dto.BStoreDto;

@Service
public class ListServiceImpl implements ListService{
	
	@Autowired
	private BStoreDao BStoreDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;

		//글 목록 얻어오기 
		//List<BStoreDto> list=BStoreDao.getList(dto);
		//전체글의 갯수
		//int totalRow=BStoreDao.getCount(dto);
		
		//view page 에서 필요한 값을 request 에 담아준다. 
		//request.setAttribute("list", list);
		//request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void getData(HttpServletRequest request) {
		//목록의 정보 얻어와서 
		//BStoreDto dto=BStoreDao.getData(dto);
		//request 에 담아준다.
		//request.setAttribute("dto", dto);
	}
	
}	
