package com.sixnicorn.eateryzip.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dao.b_StoreDao;
import com.sixnicorn.eateryzip.user.dto.b_StoreDto;
import com.sixnicorn.eateryzip.user.service.b_StoreService;

@Controller
public class b_StoreController {
   
   @Autowired
   private b_StoreService service;
   @Autowired
   private b_StoreDao dao;
   
   // 가게insertform 페이지로 이동
   @RequestMapping(value = "/store/store_insertform")
   public ModelAndView authInsertForm(HttpServletRequest request) {
      
      return new ModelAndView("store/store_insertform");
   }
   
   //gallery 사진 업로드 & DB 저장
   @RequestMapping(value = "/store/store_upload")
   public ModelAndView authInsert(b_StoreDto dto, HttpServletRequest request) {
      //form 에서 dto 로 데이터 받아옴
      //dto : b_name,..., MultipartFile storeFile; 를 가지고 있다.
      //request :  imagePath 만드는데 사용, session 영역의 b_id 가져오는데 사용
      service.saveStoreImage(dto, request);
      
      return new ModelAndView("store/store_upload");
   }
   
   //gallery 사진 업로드 form - ajax form
   @RequestMapping(value = "/store/ajax_form")
   public ModelAndView authAjaxForm(HttpServletRequest request) {
      
      return new ModelAndView("gallery/ajax_form");
   }

   //gallery 사진 업로드 - ajax
   //json 으로 return 할 것
   @RequestMapping(value = "/store/ajax_upload")
   @ResponseBody
   public Map<String, Object> authAjaxUpload(b_StoreDto dto, HttpServletRequest request){      
      //form 에서 dto 로 데이터 받아옴
      //dto : MultipartFile storeFile 를 가지고 있다.
      //request : imagePath 만드는데 사용, session 영역의 b_id 가져오는데 사용
      //return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
      return service.uploadAjaxImage(dto, request);
   }
   
   //imagePath 구성 X -> dto 로 imagePath 를 받아서 DB 에 저장하기
   @RequestMapping(value = "/b_Store/ajax_insert")
   @ResponseBody
   public Map<String, Object> authAjaxInsert(b_StoreDto dto, HttpServletRequest request) {
      //dto : b_name,..., imagePath 가지고 있다.
      //request : dto 에 b_id 추가
      service.insert(dto, request);
      Map<String, Object> map=new HashMap<>();
      map.put("isSuccess", true);
      return map;
   }   
   
   // b_Store가게정보의 b_id가 parameter get 방식으로 넘어온다.
   //detail 페이지
   @RequestMapping(value = "/store/store_detail", method = RequestMethod.GET)
   public ModelAndView detail(ModelAndView mView, @RequestParam String b_id) {
      // detail 페이지에 필요한 data를 b_id로 가져와, ModelAndView 에 저장
      service.getDetail(mView, b_id);
      mView.setViewName("store/store_detail");
      
      return mView;
   }

	// 전송되는 파라미터명이 dto의 필드명과 일치해야한다.
	@RequestMapping(value="/store/store_insertform",method=RequestMethod.GET)
	public String insertForm() {
		
		return "store/store_insertform";
	}
	
	// 가게등록 요청처리(post방식요청은 요청 method를 명시하는 것이 좋다.)
//	@RequestMapping(value="/store/store_insert", method=RequestMethod.POST)
//	public ModelAndView insert(HttpSession session ,ModelAndView mView, b_StoreDto dto) {
		
//		service.addStore(dto);
//		mView.setViewName("store/store_insert");
//		return mView;
//	}
}




