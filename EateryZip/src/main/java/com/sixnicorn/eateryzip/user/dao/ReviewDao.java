package com.sixnicorn.eateryzip.user.dao;

import com.sixnicorn.eateryzip.user.dto.ReservationDto;
import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.ReviewGoodDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

public interface ReviewDao {
	public ReservationDto getReservationData(ReservationDto dto);
	public ReviewDto getReviewDataR(int reservation_num);
	public void insertReviewR(ReviewDto dto);
	public void updateReviewR(ReviewDto dto);

	public TakeoutDto getTakeoutData(TakeoutDto dto);
	public ReviewDto getReviewDataT(int takeout_num);
	public void insertReviewT(ReviewDto dto);
	public void updateReviewT(ReviewDto dto);
	
	public int isGood(ReviewGoodDto dto);
}


