package com.sixnicorn.eateryzip.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.ReservationDto;
import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.ReviewGoodDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;


@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSession session;
	
	//리뷰 추천
	@Override
	public void doReviewGood(ReviewGoodDto dto) {
		session.insert("review.doReviewGood",dto);
	}
	//리뷰 취소
	@Override
	public void notReviewGood(int review_num) {
		session.delete("review.notReviewGood",review_num);
	}
	//리뷰 추천 유무 확인
	@Override
	public int isGood(ReviewGoodDto dto) {
		return session.selectOne("review.isGood",dto);
	}
	
	// 예약 내역 가져오기
	@Override
	public ReservationDto getReservationData(ReservationDto dto) {
		return session.selectOne("review.getReservationData",dto);
	}
	
	// 저장된 예약 리뷰 정보 가져오기
	@Override
	public ReviewDto getReviewDataR(int reservation_num) {		
		return session.selectOne("review.getReviewDataR",reservation_num);
	}

	// 예약 리뷰 등록하기
	@Override
	public void insertReviewR(ReviewDto dto) {
		session.insert("review.insertReviewR",dto);
	}
	
	// 예약 리뷰 수정하기
	@Override
	public void updateReviewR(ReviewDto dto) {
		session.update("review.updateReviewR",dto);
	}

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

	// 포장 리뷰 등록하기
	@Override
	public void insertReviewT(ReviewDto dto) {
		session.insert("review.insertReviewT",dto);
	}
	
	// 포장 리뷰 수정하기
	@Override
	public void updateReviewT(ReviewDto dto) {
		session.update("review.updateReviewT",dto);
	}
}


