package com.sixnicorn.eateryzip.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sixnicorn.eateryzip.user.dao.b_StoreDao;

@Service
public class b_StoreServiceImpl implements b_StoreService{
	
	@Autowired
	private b_StoreDao dao;
	
	
}
