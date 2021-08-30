package com.sixnicorn.eateryzip.user.controller;

import java.net.URLEncoder;
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

import com.sixnicorn.eateryzip.user.dto.BUserDto;
import com.sixnicorn.eateryzip.user.dto.GUserDto;
import com.sixnicorn.eateryzip.user.service.BUserService;
import com.sixnicorn.eateryzip.user.service.GUserService;

@Controller
public class UserController {

	@Autowired
	private BUserService Bservice;
	@Autowired
	private GUserService Gservice;
	
	//maps 테스트 .jsp로 이동
	@RequestMapping("users/map_seoul")
	public String S_map() {
		
		return "users/map_seoul";
	}
	
	//maps 테스트 .jsp로 이동
	@RequestMapping("users/map_busan")
	public String B_map() {
		
		return "users/map_busan";
	}
	
	//maps 테스트 .jsp로 이동
	@RequestMapping("users/map_seoul_detail")
	public String BD_map() {
		
		return "users/map_seoul_detail";
	}
	
	//maps 테스트 .jsp로 이동
	@RequestMapping("users/map_busan_detail")
	public String map() {
		
		return "users/map_busan_detail";
	}
	
	
	//일반회원 로그인 폼으로 이동
	@RequestMapping("/users/g_login_form")
	public String GloginForm(){
		return "users/g_login_form";
	}
	
	//비즈니스 회원 로그인 폼으로 이동
	@RequestMapping("/users/b_login_form")
	public String BloginForm(){
		return "users/b_login_form";
	}
	
	//일반 회원 로그인
	@RequestMapping("/users/g_login")
	public ModelAndView Glogin(ModelAndView mView, GUserDto dto,
			@RequestParam String url , HttpSession session) {

		Gservice.loginProcess(dto, session); //Service에 필요로 하는 객체가 있다면 넣어주어야한다.
		
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		mView.setViewName("users/g_login");
		return mView;
	}
	
	//비즈니스 회원 로그인
	@RequestMapping(value="/users/b_login", method = RequestMethod.POST)
	public ModelAndView Blogin(ModelAndView mView, BUserDto Bdto, 
			HttpSession session, @RequestParam String isSave) {
			
		Bservice.loginProcess(Bdto, session); //Service에 필요로 하는 객체가 있다면 넣어주어야한다.
		mView.setViewName("users/b_login");
		return mView;
	}
		
	//회원가입 이용약관 폼으로 이동
	@RequestMapping("/users/select_signup_form")
	public String select_singupForm() {
		return "users/select_signup_form";
	}
	
	//일반 회원 가입 폼으로 이동
	@RequestMapping(value = "/users/g_signup_form", method = RequestMethod.GET )
	public String G_singupForm() {
		return "users/g_signup_form";
	}
	
	//비즈니스 회원 가입 폼으로 이동
	@RequestMapping(value = "/users/b_signup_form", method = RequestMethod.GET )
	public String B_singupForm() {
		return "users/b_signup_form";
	}		
	
	//일반 회원 가입 
	@RequestMapping(value="/users/g_signup", method=RequestMethod.POST)
	public ModelAndView B_signup(ModelAndView mView, GUserDto dto) {
		
		Gservice.addUser(dto);
		mView.setViewName("users/g_signup");
		return mView;
	}
	
	//비즈니스 회원 가입 
	@RequestMapping(value="/users/b_signup", method=RequestMethod.POST)
	public ModelAndView G_signup(ModelAndView mView, BUserDto dto) {
		
		Bservice.addUser(dto);
		mView.setViewName("users/b_signup");
		return mView;
	}
	
	//비즈니스 회원 가입 아이디 중복 확인을 해서 json 문자열을 리턴해주는 메소드
	@RequestMapping("/users/g_checkid")
	@ResponseBody
	public Map<String, Object> G_checkid(@RequestParam String inputId){
		return Gservice.isExistId(inputId);
		//결국 {isExist":true}or{isExist":false} 형태
	}
	
	//비즈니스 회원 가입 아이디 중복 확인을 해서 json 문자열을 리턴해주는 메소드
	@RequestMapping("/users/b_checkid")
	@ResponseBody
	public Map<String, Object> B_checkid(@RequestParam String inputId){
		return Bservice.isExistId(inputId);
		//결국 {isExist":true}or{isExist":false} 형태
	}
	
	//일반 , 비즈니스 회원 로그아웃
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		//logout 하면서 b_id , g_id 모두 제거되도록
		session.removeAttribute("b_id");
		session.removeAttribute("g_id");
		return "users/logout";
	}
	
	// 비즈니스 회원가입정보보기
	@RequestMapping("/users/b_mypage/b_mypage")
	public ModelAndView authMypage(HttpSession session, ModelAndView mView) {
		
		Bservice.getMypage(session, mView);
		
		mView.setViewName("users/b_mypage/b_mypage");
		return mView;
	}
	
	// 비즈니스 회원가입정보 수정하기
	@RequestMapping("/users/b_mypage/b_mypage_updateform")
	public ModelAndView authUpdateForm(ModelAndView mView, HttpSession session, HttpServletRequest request) {
		Bservice.getMypage(session, mView);
		mView.setViewName("users/b_mypage/b_mypage_updateform");
		return mView;
	}
	// 비즈니스회원 프로필이미지 ajax처리
	@RequestMapping(value="/users/b_mypage/ajax_profile_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authAjaxProfileUpload(HttpServletRequest request,
			@RequestParam MultipartFile b_image){
		// 서비스를 이용해서 이미지를 upload폴더에 저장하고 리턴되는 Map을 리턴해서 json문자열 응답하기
		return Bservice.saveB_profile(request, b_image);
	}
	
}
