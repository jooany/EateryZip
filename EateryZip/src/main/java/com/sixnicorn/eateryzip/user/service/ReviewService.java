package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sixnicorn.eateryzip.user.dto.ReviewDto;

public interface ReviewService {
	public Map<String, Object> saveImage(HttpServletRequest request, MultipartFile mFile);
	
	public void getListR(HttpServletRequest request,int reservation_num,String b_id);
	public void insertReviewR(ReviewDto dto);
	public void updateReviewR(ReviewDto dto);

	public void getListT(HttpServletRequest request,int takeout_num,String b_id);
	public void insertReviewT(ReviewDto dto);
	public void updateReviewT(ReviewDto dto);


}