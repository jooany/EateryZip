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
	
	@RequestMapping("/eatery/menu_insertform")
	public String insertForm(HttpServletRequest request) {		
		
		return "eatery/menu_insertform";
	}
	
	//ajax 프로필 사진 업로드 요청처리
	@RequestMapping(value = "/eatery/ajax_menu_img_upload",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authAjaxProfileUpload(HttpServletRequest request,
			@RequestParam MultipartFile image){
		
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map 을 리턴해서 json 문자열 응답하기
		return service.saveMenuImage(request, image);
	}

}
