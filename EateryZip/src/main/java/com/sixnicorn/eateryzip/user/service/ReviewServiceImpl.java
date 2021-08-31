package com.sixnicorn.eateryzip.user.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sixnicorn.eateryzip.user.dao.ReviewDao;
import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		
		int takeout_num=Integer.parseInt(request.getParameter("takeout_num"));
		String b_id=request.getParameter("b_id");
		//포장 내역 가져오기
		TakeoutDto dto=new TakeoutDto();
		dto.setB_id(b_id);
		dto.setTakeout_num(takeout_num);

		TakeoutDto dto1=reviewDao.getTakeoutData(dto);
		
		//저장된 리뷰 가져오기
		ReviewDto dto2=new ReviewDto();
		dto2=reviewDao.getReviewDataT(takeout_num);
		
		request.setAttribute("dto1", dto1);
		request.setAttribute("dto2", dto2);

	}
}
