package com.sixnicorn.eateryzip.user.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSession session;
	
	// 포장 내역 가져오기
	@Override
	public TakeoutDto getTakeoutData(TakeoutDto dto) {
		return session.selectOne("review.getTakeoutData",dto);
	}
	
	// 저장된 포장 리뷰 정보 가져오기
	@Override
	public ReviewDto getReviewDataT(int takeout_num) {
		
		return session.selectOne("review.getReviewDataT",takeout_num);
	}
}
