package com.sixnicorn.eateryzip.eatery.controller;

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

import com.sixnicorn.eateryzip.eatery.dto.MenuDto;
import com.sixnicorn.eateryzip.eatery.service.MenuService;

@Controller
public class MenuController {
	@Autowired
	private MenuService service;
	
	//메뉴 등록 페이지 로딩. 저장된 리스트 가져오기
	@RequestMapping("/users/b_mypage/menu_insertform")
	public String insertForm(HttpServletRequest request) {		
		
		service.getList(request);
		
		return "users/b_mypage/menu_insertform";
	}
	//메뉴 등록
	@RequestMapping("/users/b_mypage/menu_insert")
	public String insert(MenuDto dto, HttpSession session, HttpServletRequest request) {		
		//사업자 번호 가져오기 
		String b_id=(String)session.getAttribute("b_id");

		dto.setB_id(b_id);
		
		service.saveMenu(dto);
		
		return "users/b_mypage/menu_insert";
	}
	//메뉴 수정
	@RequestMapping(value="/users/b_mypage/menu_update", 
			method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(MenuDto dto) {
		
		return service.updateMenu(dto);
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
	
	//카테고리명 변경
	@RequestMapping(value="/users/b_mypage/update_section_name")
	@ResponseBody
	public Map<String, Object> updateSectionName(HttpServletRequest request,@RequestParam int section_num,@RequestParam String section_name) {
		
		
		return service.updateSectionName(request,section_num,section_name);
	}
	
	//메뉴 삭제
	@RequestMapping(value="/users/b_mypage/delete_menu")
	public String delete(@RequestParam int menu_num) {
		
		service.deleteMenu(menu_num);
		
		return "redirect:/users/b_mypage/menu_insertform.do";
	}
	//메뉴 삭제
	@RequestMapping(value="/users/b_mypage/delete_section")
	public String deleteSection(@RequestParam int section_num) {
		
		service.deleteSection(section_num);
		
		return "redirect:/users/b_mypage/menu_insertform.do";
	}

}
