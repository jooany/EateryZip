package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sixnicorn.eateryzip.user.dto.ReviewDto;

public interface ReviewService {

	public void getList(HttpServletRequest request,int takeout_num,String b_id);

	public Map<String, Object> saveImage(HttpServletRequest request, MultipartFile mFile);

	public void insertReviewT(ReviewDto dto);

	public void updateReviewT(ReviewDto dto);

}