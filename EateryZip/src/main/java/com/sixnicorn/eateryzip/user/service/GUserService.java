package com.sixnicorn.eateryzip.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dto.GUserDto;

public interface GUserService {
   //일반 회원 로그인 
   public Map<String, Object> loginProcess(GUserDto dto, HttpSession session , String isSave 
         , HttpServletResponse response , String url);
   //일반 회원 추가
   public Map<String, Object> addUser(GUserDto dto);
   //회원가입 ID check
   public Map<String, Object> isExistId(String inputId);
   //일반 아이디 찾기
   public Map<String, Object> findId(GUserDto dto);
   //일반 패스워드 찾기
   public Map<String, Object> findPwd(GUserDto dto);
   //일반 패스워드 변경
   public Map<String, Object> updatePwd(GUserDto dto, HttpSession session,
         HttpServletResponse response, HttpServletRequest request);
   
   public Map<String, Object> updatePwd_mypage(GUserDto dto,HttpSession session,
	         HttpServletResponse response, HttpServletRequest request);
   //
   public Map<String, Object> isExistPwd(String inputPwd,  HttpSession session);
   //일반 유저 회원탈퇴
   public Map<String, Object> deleteUser(HttpSession session,HttpServletResponse response, HttpServletRequest request);
   
	
	// 혜림 -----------------------------------------------------------------------
	// 일반 회원정보
	public void getGmypage(HttpSession session, ModelAndView mView);
	// 일반회원 정보수정
	public void updateGUser(GUserDto dto, HttpSession session);
	// 일반회원 프로필이미지
	public Map<String, Object> saveG_profileImage(HttpServletRequest request, MultipartFile image);
	// 일반회원 탈퇴
	public void deleteUser(HttpSession session, ModelAndView mView);
	
	// 포장내역보기
	public void getTakeoutList(HttpServletRequest request);
	// 예약내역보기
	public void getReservationList(HttpServletRequest request);
	// 스크랩내역 보기
	public void getScrapList(HttpServletRequest request);
	// 스크랩 취소
	public Map<String, Object> notScrap(HttpServletRequest request,String b_id);
}