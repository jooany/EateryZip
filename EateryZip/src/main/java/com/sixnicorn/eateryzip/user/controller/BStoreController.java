package com.sixnicorn.eateryzip.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;
import com.sixnicorn.eateryzip.user.service.BStoreService;

@Controller
public class BStoreController {

	@Autowired
	private BStoreService service;
	
	// 주연 음식점 상세 정보 페이지
	@RequestMapping("/eatery/detail")
	public String  detailData(HttpServletRequest request,@RequestParam String b_id) {
		service.getDetailData(request, b_id);
		return "eatery/detail";
	}
	@RequestMapping("/eatery/ajax_detail")
	public String  detailDataFilter(HttpServletRequest request) {
		service.getDetailDataFilter(request);
		return "eatery/ajax_detail";
	}
	// 음식점 스크랩 하기 
	@RequestMapping(value="/eatery/private/ajax_good_insert")
	@ResponseBody
	public Map<String,Object> doScrap(HttpServletRequest request,@RequestParam String b_id){
		return service.doScrap(request,b_id);
	}
	// 음식점 스크랩 취소하기 
	@RequestMapping(value="/eatery/private/ajax_good_delete")
	@ResponseBody
	public Map<String,Object> notScrap(HttpServletRequest request,@RequestParam String b_id){
		return service.notScrap(request,b_id);
	}
	
	// 리뷰 추천
	@RequestMapping(value="/eatery/private/ajax_good_insert_r")
	@ResponseBody
	public Map<String,Object> doReviewGood(HttpServletRequest request,@RequestParam int review_num){
		return service.doReviewGood(request,review_num);
	}
	// 리뷰 추천 취소
	@RequestMapping(value="/eatery/private/ajax_good_delete_r")
	@ResponseBody
	public Map<String,Object> notReviewGood(HttpServletRequest request,@RequestParam int review_num){
		return service.notReviewGood(request,review_num);
	}

	
	// 혜림
	@RequestMapping("/store/store_insertform")
	public ModelAndView insertForm(HttpSession session, ModelAndView mView,HttpServletRequest request) {
		service.getStore(session, mView,request);
		mView.setViewName("store/store_insertform");
		System.out.println("-----------4-----------");
		System.out.println("session:" +session);
		System.out.println("mView:" +mView);
		System.out.println("----------------------");
		return mView ;
	}
	
	/*
	// 가게 등록페이지 로딩, 저장된 내역 가져오기 insert+detail
	@RequestMapping("/store/store_insertform")
	public String insertForm(HttpServletRequest request) {
		System.out.println("-----------1-----------");
		System.out.println("request:" +request);
		System.out.println("----------------------");
		service.getStore(request);
		return "store/store_insertform";
	}
	*/
	
	/*
	// 가게 등록 페이지 로딩, 저장된 내역 가져오기
	@RequestMapping("/store/store_insertform")
	public ModelAndView insertForm(BStoreDto dto, ModelAndView mView) {		
		// BStoreService를 이용해서 ModelAndView객체에 가게의 정보가 담기게한다.
		service.getStore(dto, mView);
		// view page 정보담고
		mView.setViewName("store/store_insertform");
		// mView 리턴
		return mView;
	}
	
	

 	// 가게 등록 페이지 로딩, 저장된 내역 가져오기
	@RequestMapping("/store/store_insertform")
	public ModelAndView insertForm(String b_id, ModelAndView mView) {		
		// BStoreService를 이용해서 ModelAndView객체에 가게의 정보가 담기게한다.
		service.getStore(b_id, mView);
		// view page 정보담고
		mView.setViewName("store/store_insertform");
		System.out.println("-----------4-2-----------");
		System.out.println("b_id:" +b_id);
		System.out.println("mView:" +mView);
		System.out.println("----------------------");
		// mView 리턴
		return mView;
	}
	*/
	
	// 가게 등록
	@RequestMapping("/store/store_insert")
	public String insert(BStoreDto dto, HttpSession session, HttpServletRequest request) {
		String b_id=(String)session.getAttribute("b_id");
		dto.setB_id(b_id);
		service.saveStore(dto,request);
		System.out.println("-----------5-----------");
		System.out.println("request:" +request);
		System.out.println("dto:" +dto);
		System.out.println("session:" +session);
		System.out.println("----------------------");
		return "redirect:/store/store_insertform.do";
	}

	
	@RequestMapping(value="store/store_update", method=RequestMethod.POST)
	public String update (BStoreDto dto, HttpSession session, HttpServletRequest request) {
		String b_id=(String)session.getAttribute("b_id");
		dto.setB_id(b_id);
		service.updateStore(dto);
		System.out.println("-----------6-----------");
		System.out.println("request:" +request);
		System.out.println("dto:" +dto);
		System.out.println("session:" +session);
		System.out.println("----------------------");
		return "redirect:/store/store_insertform.do";
	}
	
	
	//ajax 가게대표이미지 업로드 요청처리
	@RequestMapping(value = "/store/ajax_store_img_upload",	method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxProfileUpload(HttpServletRequest request, @RequestParam MultipartFile image){
		
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map 을 리턴해서 json 문자열 응답하기
		return service.saveStoreImage(request, image);
	}
	
	// 나현
	
	@RequestMapping("/eatery/list")
	public String getList(HttpServletRequest request, BStoreDto dto) {
		service.getList(request, dto);
		
		return "eatery/list";
	}
		
}
