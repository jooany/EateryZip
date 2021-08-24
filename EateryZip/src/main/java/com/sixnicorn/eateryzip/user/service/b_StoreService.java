package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.sixnicorn.eateryzip.user.dto.b_StoreDto;

public interface b_StoreService {
	// 가게정보를 추가 해 주는 메소드 
	// public void addStore(b_StoreDto dto);
	// 가게정보를 수정 해 주는 메소드 
	public void updateStore(b_StoreDto dto);
	// 가게정보를 인자로 전달한 ModelAndView 객체에 담아주는 메소드
	public void getStore(HttpSession session, ModelAndView mView, String b_id);
	// 가게대표이미지 저장하기
	public void saveStoreImage(b_StoreDto dto, HttpServletRequest request);
	// 가게에 이미지 저장하기 ajax
	public Map<String, Object> uploadAjaxImage(b_StoreDto dto, HttpServletRequest request);
	// 가게등록하기
	public void insert(b_StoreDto dto, HttpServletRequest request);
	// 가게정보보기
	public void getDetail(ModelAndView mView, String b_id);
	
}

