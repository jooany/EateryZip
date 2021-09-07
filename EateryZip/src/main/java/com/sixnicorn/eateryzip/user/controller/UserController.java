package com.sixnicorn.eateryzip.user.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	///------ (임시 추후 혜림 이용)주연 ------------------------------------------
	@RequestMapping("/users/g_mypage/takeout_list")
	public String takeoutList(HttpServletRequest request) {

		return "users/g_mypage/takeout_list" ;
	}
	//---------------------------------주연끝----------------------------------
	
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
	@RequestMapping("/users/ajax_g_login")
	@ResponseBody
	public Map<String, Object> Ajax_g_login(GUserDto dto,
			@RequestParam String url , HttpSession session, 
			@RequestParam (value="isSave", required=false) String isSave, 
			HttpServletResponse response,
			HttpServletRequest request) {
		
		return Gservice.loginProcess(dto, session , isSave , response , url);
	}
	
	//비즈니스 회원 로그인
	@RequestMapping(value="/users/ajax_b_login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Ajax_b_login(BUserDto Bdto, 
			HttpSession session, @RequestParam (value="isSave", required=false) String isSave, HttpServletResponse response) {
			
		return Bservice.loginProcess(Bdto, session, isSave , response); 
	
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
	@RequestMapping(value="/users/ajax_g_signup", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Ajax_g_signup(GUserDto dto) {
		
		return Gservice.addUser(dto);
	}
	
	//비즈니스 회원 가입 
	@RequestMapping(value="/users/ajax_b_signup", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Ajax_b_signup(ModelAndView mView, BUserDto dto) {
		
		return Bservice.addUser(dto);
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
	
	//사업자번호 찾기 폼으로 이동
	@RequestMapping("/users/b_find_id_form")
	public String b_find_id_form(){
		return "users/b_find_id_form";
	}
	
	
	//사업자번호 찾기 기능 
	@RequestMapping("/users/ajax_b_find_id")
	@ResponseBody
	public Map<String, Object> b_find_id(BUserDto dto){
	
		return Bservice.findId(dto);
	}
	
	//일반 ID 찾기 폼으로 이동
	@RequestMapping("/users/g_find_id_form")
	public String g_find_id_form(){
		return "users/g_find_id_form";
	}
	
	//사업자번호 찾기 기능 
	@RequestMapping("/users/ajax_g_find_id")
	@ResponseBody
	public Map<String, Object> g_find_id(GUserDto dto){
	
		return Gservice.findId(dto);

	}
	
	//사업자 패스워드 찾기 폼으로 이동
	@RequestMapping("/users/b_find_pwd_form")
	public String b_find_pwd_form(){
		return "users/b_find_pwd_form";
	}
	
	//사업자 패스워드 찾기
	@RequestMapping("/users/ajax_b_find_pwd")
	@ResponseBody
	public Map<String, Object> b_find_pwd(BUserDto dto){
		
		return Bservice.findPwd(dto);
	}
	//사업자 패스워드 변경 폼으로 이동
		@RequestMapping("/users/b_change_pwd_form")
		public String b_change_pwd_form(@RequestParam String b_id) {
			return "users/b_change_pwd_form";
		}
	
	//사업자 패스워드 바꾸기
	@RequestMapping("/users/ajax_b_change_pwd")
	@ResponseBody
	public Map<String, Object> Ajax_b_change_pwd(BUserDto dto,
			HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		
		return Bservice.updatePwd(dto,session,response,request);
	}
	
		
	//일반 패스워드 찾기 폼으로 이동
	@RequestMapping("/users/g_find_pwd_form")
	public String g_find_pwd_form(){
		return "users/g_find_pwd_form";
	}
	
	//사업자 패스워드 찾기
		@RequestMapping("/users/ajax_g_find_pwd")
		@ResponseBody
		public Map<String, Object> g_find_pwd(GUserDto dto){
			return Gservice.findPwd(dto);
		}
		
		//사업자 패스워드 변경 폼으로 이동
		@RequestMapping("/users/g_change_pwd_form")
		public String g_change_pwd_form(@RequestParam String g_id) {
			return "users/g_change_pwd_form";
		}
		
		//사업자 패스워드 바꾸기
		@RequestMapping("/users/ajax_g_change_pwd")
		@ResponseBody
		public Map<String, Object> Ajax_g_change_pwd(GUserDto dto,
				HttpSession session, HttpServletResponse response, HttpServletRequest request) {
			return Gservice.updatePwd(dto,session,response,request);
		}
	
	//일반 , 비즈니스 회원 로그아웃
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		//logout 하면서 b_id , g_id 모두 제거되도록
		session.removeAttribute("b_id");
		session.removeAttribute("g_id");
		return "redirect:/home.do";
	}
	
	// 혜림 --------------------------------------------------------------------------
	// 비즈니스 회원가입정보보기
	@RequestMapping("/users/b_mypage/b_mypage")
	public ModelAndView Bmypage(HttpSession session, ModelAndView mView, HttpServletRequest request) {
		
		Bservice.getBmypage(session, mView);
		
		mView.setViewName("users/b_mypage/b_mypage");
		return mView;
	}

	// 비즈니스 개인정보 수정반영 요청처리
	@RequestMapping(value="users/b_mypage/update", method=RequestMethod.POST)
	public String update(BUserDto dto, HttpSession session) {
		// dto에는 프로필, 주소,이름,연락처,이메일 들어감
		Bservice.updateUser(dto, session);
		return "redirect:/users/b_mypage/b_mypage.do";
	}
	
	// 비즈니스 회원가입정보 수정하기
	@RequestMapping("/users/b_mypage/b_mypage_updateform")
	public ModelAndView updateForm(ModelAndView mView, HttpSession session, HttpServletRequest request) {
		Bservice.getBmypage(session, mView);
		mView.setViewName("users/b_mypage/b_mypage_updateform");
		return mView;
	}
	
	// 비즈니스회원 프로필이미지 ajax처리
	@RequestMapping(value="users/b_mypage/ajax_b_profile_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxProfileUpload(HttpServletRequest request, @RequestParam MultipartFile image){
		// 서비스를 이용해서 이미지를 upload폴더에 저장하고 리턴되는 Map을 리턴해서 json문자열 응답하기
		return Bservice.saveB_profileImage(request, image);
	}
	
	// 일반회원 가입정보보기
	@RequestMapping("/users/g_mypage/g_mypage")
	public ModelAndView Gmypage(HttpSession session, ModelAndView mView, HttpServletRequest request) {

		Gservice.getGmypage(session, mView);

		mView.setViewName("users/g_mypage/g_mypage");
		return mView;
	}

	// 일반 개인정보 수정반영 요청처리
	@RequestMapping(value="users/g_mypage/update", method=RequestMethod.POST)
	public String update(GUserDto dto, HttpSession session) {
		// dto에는 프로필, 주소,이름,연락처,이메일 들어감
		Gservice.updateGUser(dto, session);
		return "redirect:/users/g_mypage/g_mypage.do";
	}

	// 일반 회원가입정보 수정하기
	@RequestMapping("/users/g_mypage/g_mypage_updateform")
	public ModelAndView GupdateForm(ModelAndView mView, HttpSession session, HttpServletRequest request) {
		Gservice.getGmypage(session, mView);
		mView.setViewName("users/g_mypage/g_mypage_updateform");
		return mView;
	}

	// 일반회원 프로필이미지 ajax처리
	@RequestMapping(value="users/g_mypage/ajax_g_profile_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxGProfileUpload(HttpServletRequest request, @RequestParam MultipartFile image){
		// 서비스를 이용해서 이미지를 upload폴더에 저장하고 리턴되는 Map을 리턴해서 json문자열 응답하기
		return Gservice.saveG_profileImage(request, image);
	}
}
