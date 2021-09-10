package com.sixnicorn.eateryzip.user.controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.List;

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

import com.sixnicorn.eateryzip.user.dao.BStoreDao;
import com.sixnicorn.eateryzip.user.dto.BStoreDto;
import com.sixnicorn.eateryzip.user.service.BStoreService;

@Controller
public class BStoreController {

	@Autowired
	private BStoreService service;
	@Autowired
	private BStoreDao BStoreDao;
	
	
	// 주연 음식점 상세 정보 페이지
	@RequestMapping("/eatery/detail")
	public String  detailData(HttpServletRequest request,@RequestParam String b_id) {
		service.getDetailData(request, b_id);
		return "eatery/detail";
	}
	@RequestMapping("/eatery/ajax_detail")
	public String  detailDataFilter(HttpServletRequest request) {
		service.getDetailDataFilter(request);
		return "eatery/ajax_detail";
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
	
	// 리뷰 추천
	@RequestMapping(value="/eatery/private/ajax_good_insert_r")
	@ResponseBody
	public Map<String,Object> doReviewGood(HttpServletRequest request,@RequestParam int review_num){
		return service.doReviewGood(request,review_num);
	}
	// 리뷰 추천 취소
	@RequestMapping(value="/eatery/private/ajax_good_delete_r")
	@ResponseBody
	public Map<String,Object> notReviewGood(HttpServletRequest request,@RequestParam int review_num){
		return service.notReviewGood(request,review_num);
	}

	
	// 혜림
	@RequestMapping("/store/store_insertform")
	public ModelAndView insertForm(HttpSession session, ModelAndView mView,HttpServletRequest request) {
		service.getStore(session, mView,request);
		mView.setViewName("store/store_insertform");
		System.out.println("-----------4-----------");
		System.out.println("session:" +session);
		System.out.println("mView:" +mView);
		System.out.println("----------------------");
		return mView ;
	}
	
	/*
	// 가게 등록페이지 로딩, 저장된 내역 가져오기 insert+detail
	@RequestMapping("/store/store_insertform")
	public String insertForm(HttpServletRequest request) {
		System.out.println("-----------1-----------");
		System.out.println("request:" +request);
		System.out.println("----------------------");
		service.getStore(request);
		return "store/store_insertform";
	}
	*/
	
	/*
	// 가게 등록 페이지 로딩, 저장된 내역 가져오기
	@RequestMapping("/store/store_insertform")
	public ModelAndView insertForm(BStoreDto dto, ModelAndView mView) {		
		// BStoreService를 이용해서 ModelAndView객체에 가게의 정보가 담기게한다.
		service.getStore(dto, mView);
		// view page 정보담고
		mView.setViewName("store/store_insertform");
		// mView 리턴
		return mView;
	}
	
	

 	// 가게 등록 페이지 로딩, 저장된 내역 가져오기
	@RequestMapping("/store/store_insertform")
	public ModelAndView insertForm(String b_id, ModelAndView mView) {		
		// BStoreService를 이용해서 ModelAndView객체에 가게의 정보가 담기게한다.
		service.getStore(b_id, mView);
		// view page 정보담고
		mView.setViewName("store/store_insertform");
		System.out.println("-----------4-2-----------");
		System.out.println("b_id:" +b_id);
		System.out.println("mView:" +mView);
		System.out.println("----------------------");
		// mView 리턴
		return mView;
	}
	*/
	
	// 가게 등록
	@RequestMapping("/store/store_insert")
	public String insert(BStoreDto dto, HttpSession session, HttpServletRequest request) {
		String b_id=(String)session.getAttribute("b_id");
		dto.setB_id(b_id);
		service.saveStore(dto,request);
		System.out.println("-----------5-----------");
		System.out.println("request:" +request);
		System.out.println("dto:" +dto);
		System.out.println("session:" +session);
		System.out.println("----------------------");
		return "redirect:/store/store_insertform.do";
	}

	
	@RequestMapping(value="store/store_update", method=RequestMethod.POST)
	public String update (BStoreDto dto, HttpSession session, HttpServletRequest request) {
		String b_id=(String)session.getAttribute("b_id");
		dto.setB_id(b_id);
		service.updateStore(dto);
		System.out.println("-----------6-----------");
		System.out.println("request:" +request);
		System.out.println("dto:" +dto);
		System.out.println("session:" +session);
		System.out.println("----------------------");
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
	public String getList(HttpServletRequest request, BStoreDto dto) {
		service.getList(request, dto);
		
		return "eatery/list";
	}
	
	@RequestMapping("/eatery/ajax_map")
	@ResponseBody
	public List<BStoreDto> List_map(HttpServletRequest request) {
		
		String keyword=request.getParameter("keyword");
		String ex_keyword=request.getParameter("ex_keyword");
		String b_kind=request.getParameter("b_kind");
		String service=request.getParameter("service");

		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=4;
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		BStoreDto dto2=new BStoreDto();
		
		dto2.setStartRowNum(startRowNum);
		dto2.setEndRowNum(endRowNum);
		
		if(keyword==null){//1
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			dto2.setKeyword("");
			dto2.setEncodedK("");
			if(ex_keyword!=null){
				dto2.setEx_keyword(ex_keyword);
				if(b_kind!=null){
					dto2.setB_kind(b_kind);
					if(service!=null){
						dto2.setService(service);
					}else{
						dto2.setService("");
					}
				}else if(b_kind==null){ 
					dto2.setB_kind("");
					if(service!=null){
						dto2.setService(service);
					}else if(service==null){
						dto2.setService("");
					}
				} //2
			}else{ //1
				dto2.setEx_keyword("");
				if(b_kind!=null){
					dto2.setB_kind(b_kind);
					if(service!=null){
						dto2.setService(service);
					}else{
						dto2.setService("");
					}
				}else{
					dto2.setB_kind("");
					if(service!=null){
						dto2.setService(service);
					}else{
						dto2.setService("");
					}
				}
			}
		}else{
			dto2.setKeyword(keyword);
			dto2.setEncodedK(keyword);
			if(ex_keyword==null){
				ex_keyword="";
				if(b_kind==null){
					b_kind="";
					if(service==null){
						service="";
					}else{
						dto2.setService(service);
					}
				}else if(b_kind!=null){
					dto2.setB_kind(b_kind);
					if(service==null){
						service="";
					}else{
						dto2.setService(service);
					}
				
				}
			}else if(ex_keyword!=null){
				dto2.setEx_keyword(ex_keyword);
				if(b_kind!=null){
					dto2.setB_kind(b_kind);
					if(service==null){
						service="";
					}else{
						dto2.setService(service);
					}
				}else{
					b_kind="";
					if(service==null){
						service="";
					}else{
						dto2.setService(service);
					}
				}
			}
		}
		
		System.out.println("--service");
		System.out.println(dto2.getKeyword());
		System.out.println(dto2.getEx_keyword());
		System.out.println(dto2.getService());
		System.out.println(dto2.getB_kind());
		
		List<BStoreDto> result = BStoreDao.getList(dto2);
		System.out.println(result);
		return result;
	}
		
}
