package com.sixnicorn.eateryzip.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sixnicorn.eateryzip.user.dao.ReviewDao;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reivewDao;
}
