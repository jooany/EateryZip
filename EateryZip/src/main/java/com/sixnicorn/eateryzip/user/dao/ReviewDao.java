package com.sixnicorn.eateryzip.user.dao;

import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

public interface ReviewDao {

	public TakeoutDto getTakeoutData(TakeoutDto dto);
	public ReviewDto getReviewDataT(int takeout_num);
	public void insertReviewT(ReviewDto dto);
	public void updateReviewT(ReviewDto dto);
}

