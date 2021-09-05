package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;

public interface BStoreService {

	// 혜림
	
	// 가게정보 등록 및 가져오기
	public void getStore(String b_id, ModelAndView mView);
	// public void getStore(HttpServletRequest request);
	public void getStore(HttpSession session, ModelAndView mView,HttpServletRequest request);

	// 가게대표이미지 등록하기 (3개까지 나오게 구현해보자)
	public Map<String, Object> saveStoreImage(HttpServletRequest request, MultipartFile image);

	// 가게정보 등록
	public void saveStore(BStoreDto dto,HttpServletRequest request);
	
	// 가게정보 수정하기
	public void updateStore(BStoreDto dto);
	
	
	
	
	//나현
	public void getList(HttpServletRequest request);
	
	//주연
	public void getDetailData(HttpServletRequest request, String b_id);
}