package com.sixnicorn.eateryzip.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	// 포장 리뷰 작성 폼 컨트롤러
	@RequestMapping("/users/g_mypage/review_takeout_form")
	public String takeoutReviewForm(HttpServletRequest request,@RequestParam int takeout_num,@RequestParam String b_id) {
		
		service.getList(request,takeout_num,b_id);
		
		return "users/g_mypage/review_takeout_form" ;
	}
	
	//ajax사진 업로드 요청처리
	@RequestMapping(value = "/users/g_mypage/ajax_menu_img_upload",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authAjaxProfileUpload(HttpServletRequest request,
			@RequestParam MultipartFile image){
		
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map 을 리턴해서 json 문자열 응답하기
		return service.saveImage(request, image);
	}
	
	// 포장 리뷰 등록
	@RequestMapping("/users/g_mypage/review_insert")
	public String insertReviewT(ReviewDto dto,@RequestParam int takeout_num,@RequestParam String b_id) {
		
		service.insertReviewT(dto);
		
		return "redirect:/users/g_mypage/review_takeout_form.do?takeout_num="+takeout_num+"&b_id="+b_id;
	}
	
	// 포장 리뷰 수정 
	@RequestMapping("/users/g_mypage/review_update")
	public String updateReviewT(ReviewDto dto,@RequestParam int takeout_num,@RequestParam String b_id) {
		service.updateReviewT(dto);
		
		return "redirect:/users/g_mypage/review_takeout_form.do?takeout_num="+takeout_num+"&b_id="+b_id;
	}


}
