package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.b_StoreDto;

public interface b_StoreService {
	
	public void getStoreInfo(HttpSession session, ModelAndView mView);
	// public Map<String,Object>isExistB_id(String inputB_id);
	public void addStore(b_StoreDto dto);
}
