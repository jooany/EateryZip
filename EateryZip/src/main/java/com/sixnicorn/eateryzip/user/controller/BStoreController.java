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

	
	// 혜림
	
	@RequestMapping("/store/store_insertform")
	public ModelAndView insertForm(HttpSession session, ModelAndView mView) {
		service.getStore(session, mView);
		mView.setViewName("store/store_insertform");
		return mView ;
	}
	
	// 가게 등록
	@RequestMapping("/store/store_insert")
	public String insert(BStoreDto dto, HttpSession session, HttpServletRequest request) {
		String b_id=(String)session.getAttribute("b_id");
		dto.setB_id(b_id);
		service.saveStore(dto);
		return "redirect:/store/store_insertform";
	}
	
	@RequestMapping("/store/store_update")
	public String update (BStoreDto dto, HttpSession session, HttpServletRequest request) {
		String b_id=(String)session.getAttribute("b_id");
		dto.setB_id(b_id);
		service.updateStore(dto);
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
	public String getList(HttpServletRequest request) {
		service.getList(request);
		
		return "eatery/list";
	}
		
}
