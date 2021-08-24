package com.sixnicorn.eateryzip.eatery.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sixnicorn.eateryzip.eatery.service.MenuService;

@Controller
public class MenuController {
	@Autowired
	private MenuService service;
	
	@RequestMapping("/users/b_mypage/menu_insertform")
	public String insertForm(HttpServletRequest request) {		
		
		return "users/b_mypage/menu_insertform";
	}
	
	@RequestMapping("/users/b_mypage/private/menu_insert")
	public String insert(HttpServletRequest request) {		
		//사업자 번호 가져오기 
		//String b_id=(String)session.getAttribute("b_id");
		//String b_id=(String)session.setAttribute("0101234",b_id);
		
		return "users/b_mypage/menu_insert";
	}
	
	//ajax 프로필 사진 업로드 요청처리
	@RequestMapping(value = "/users/b_mypage/ajax_menu_img_upload",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authAjaxProfileUpload(HttpServletRequest request,
			@RequestParam MultipartFile image){
		
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map 을 리턴해서 json 문자열 응답하기
		return service.saveMenuImage(request, image);
	}

}
