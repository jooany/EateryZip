package com.sixnicorn.eateryzip.eatery.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface ListService {
	public void getList(HttpServletRequest request);
	public void getStoreInfo(HttpSession session, ModelAndView mView);
}
