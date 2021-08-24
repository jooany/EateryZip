package com.sixnicorn.eateryzip.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.b_StoreDto;
import com.sixnicorn.eateryzip.user.service.b_StoreService;

/*
 	@Controller
	public class Test {
		
		@RequestMapping("/test/send")
		public String send(HttpServletRequest request) {
			String msg = request.getParameter("msg");
			System.out.println(msg);
			
			// "/WEB_INF/views/" + "test/send" + ".jsp"
			return "test/send";
		}
	}
*/

@Controller
public class b_StoreController {
	
	@Autowired
	private b_StoreService service;

	/*
	 	/b_Store_info 요청이 왔을 때 이 메소드로 요청처리하기
	*/
	/*
	1번
	// <input type="text" name="b_id" />에 입력한 파라미터를 어떻게 추출할까?
	@RequestMapping("/private/b_Store_info")
	public String insert(HttpServletRequest request) {
		// 폼 전송되는 파라미터를 추출해서
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		String b_name = request.getParameter("b_name");
		String b_Store_Address = request.getParameter("b_Store_Address");
		String b_kind = request.getParameter("b_kind");
		String intro = request.getParameter("intro");
		String b_img_f = request.getParameter("b_img_f");
		String b_Store_phone = request.getParameter("b_Store_phone");
		String b_Store_date = request.getParameter("b_Store_date");
		String b_open = request.getParameter("b_open");
		String b_close = request.getParameter("b_close");
		String b_holiday = request.getParameter("b_holiday");
		String notice = request.getParameter("notice");
		String service = request.getParameter("service");
		String ex_keyword = request.getParameter("ex_keyword");		
		// dto에 담고
		b_StoreDto dto = new b_StoreDto();
		dto.setB_id(b_id);
		dto.setB_name(b_name);
		dto.setB_Store_Address(b_Store_Address);
		dto.setB_kind(b_kind);
		dto.setIntro(intro);
		dto.setB_img_f(b_img_f);
		dto.setB_Store_phone(b_Store_phone);
		dto.setB_Store_date(b_Store_date);
		dto.setB_open(b_open);
		dto.setB_close(b_close);
		dto.setB_holiday(b_holiday);
		dto.setNotice(notice);
		dto.setService(service);
		dto.setEx_keyword(ex_keyword);
		// dao를 이용해서 DB에 저장하고
		
		// 응답하기		
		return "/private/b_Store_info";
	}
	2번
	@RequestMapping("/private/b_Store_info")
	public String insert(@RequestParam int b_id,
			@RequestParam String b_name,
			@RequestParam String b_Store_Address,
			@RequestParam String b_kind,
			@RequestParam String intro,
			@RequestParam String b_img_f,
			@RequestParam String b_Store_phone,
			@RequestParam String b_Store_date,
			@RequestParam String b_open,
			@RequestParam String b_close,
			@RequestParam String b_holiday,
			@RequestParam String notice,
			@RequestParam String service,
			@RequestParam String ex_keyword) {
	
		// dto에 담고
		b_StoreDto dto = new b_StoreDto();
		dto.setB_id(b_id);
		dto.setB_name(b_name);
		dto.setB_Store_Address(b_Store_Address);
		dto.setB_kind(b_kind);
		dto.setIntro(intro);
		dto.setB_img_f(b_img_f);
		dto.setB_Store_phone(b_Store_phone);
		dto.setB_Store_date(b_Store_date);
		dto.setB_open(b_open);
		dto.setB_close(b_close);
		dto.setB_holiday(b_holiday);
		dto.setNotice(notice);
		dto.setService(service);
		dto.setEx_keyword(ex_keyword);
		// dao를 이용해서 DB에 저장하고
		
		// 응답하기		
		return "/private/b_Store_info";
	}
	*/
	// 전송되는 파라미터명이 dto의 필드명과 일치해야한다.
	@RequestMapping(value="/store/store_insertform",method=RequestMethod.GET)
	public String insertForm() {
		
		return "store/store_insertform";
	}
	
	// 가게등록 요청처리(post방식요청은 요청 method를 명시하는 것이 좋다.)
	@RequestMapping(value="/store/store_insert", method=RequestMethod.POST)
	public ModelAndView insert(HttpSession session ,ModelAndView mView, b_StoreDto dto) {
		
		service.addStore(dto);
		mView.setViewName("store/store_insert");
		return mView;
	}
}




