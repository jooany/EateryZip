package com.sixnicorn.eateryzip.user.service;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dao.BStoreDao;
import com.sixnicorn.eateryzip.user.dto.BStoreDto;
import com.sixnicorn.eateryzip.user.dto.EateryScrapDto;
import com.sixnicorn.eateryzip.user.dto.MenuDto;
import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.ReviewGoodDto;
import com.sixnicorn.eateryzip.user.dto.StoreImgDto;

@Service
public class BStoreServiceImpl implements BStoreService{

	@Autowired
	private BStoreDao BStoreDao;
	
	//주연
	//리뷰 추천
	@Override
	public Map<String, Object> doReviewGood(HttpServletRequest request,int review_num) {
		String id=(String)request.getSession().getAttribute("g_id");
		
		ReviewGoodDto dto=new ReviewGoodDto();
		dto.setReview_num(review_num);
		dto.setId(id);
		
		BStoreDao.doReviewGood(dto);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("isDoReviewGood",true);
		return map;
	}
	//리뷰 추천 취소
	@Override
	public Map<String, Object> notReviewGood(HttpServletRequest request,int review_num) {
		String id=(String)request.getSession().getAttribute("g_id");
		
		ReviewGoodDto dto=new ReviewGoodDto();
		dto.setReview_num(review_num);
		dto.setId(id);
		
		BStoreDao.notReviewGood(dto);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("isNotReviewGood",true);
		return map;
	}
		
	@Override
	public void getDetailData(HttpServletRequest request,String b_id) {
		
		String g_id=(String)request.getSession().getAttribute("g_id");
		request.setAttribute("b_id", b_id);
		//음식점 정보 얻어오기
		BStoreDto dto=BStoreDao.getStore(b_id);
		//음식점 이미지 리스트 얻어오기
		List<StoreImgDto> storeImgList=BStoreDao.getStoreImgList(b_id);
		//음식점 메뉴 리스트 얻어오기
		List<MenuDto> menuList=BStoreDao.getMenuList(b_id);

		request.setAttribute("dto", dto);
		request.setAttribute("storeImgList", storeImgList);
		request.setAttribute("menuList", menuList);
		
		//리뷰 페이징 처리 위한 로직
		// 필터 종류를 파라미터로 읽어와 본다.
		String array=request.getParameter("array");
		String only=request.getParameter("only");
		
		if(array == null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			array="latest";
		}
		if(only == null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			only="all";
		}
		
		request.setAttribute("array", array);
		request.setAttribute("only", only);
		
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
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

		//BStoreDto 객체에 startRowNum 과 endRowNum 을 담는다.
		ReviewDto dto2=new ReviewDto();
		dto2.setStartRowNum(startRowNum);
		dto2.setEndRowNum(endRowNum);
		dto2.setB_id(b_id);
		
		if(g_id != null){
			dto2.setId(g_id);
		}

		//글 목록 얻어오기
		List<ReviewDto> reviewList =new ArrayList<ReviewDto>();
		
		if(array.equals("latest")&&only.equals("all")) { //최신순
			reviewList=BStoreDao.getReviewList_R(dto2);
		}else if(array=="latest"&&only=="photo") { //최신순+사진 리뷰만
			reviewList=BStoreDao.getReviewList_R_P(dto2);	
		}else if(array=="popular"&&only=="all") { //인기순
			reviewList=BStoreDao.getReviewList_P(dto2);
		}else if(array=="popular"&&only=="photo") {  //인기순+사진 리뷰만
			reviewList=BStoreDao.getReviewList_P_P(dto2);
		}
		
		//전체글의 갯수
		int totalRow=BStoreDao.getReviewCount(b_id);
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		

		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다.
		}
		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		
		// 키워드 총 개수
		request.setAttribute("totalRow", totalRow);
		
		//키워드 개수 순서대로 리스트 가져오기
		String[] stringList = {"가성비가 좋아요","포장이 꼼꼼해요","디저트가 맛있어요","친절해요","특별한 메뉴가 있어요","커피가 맛있어요","음료가 맛있어요","대화하기 좋아요","인테리어가 멋져요","사진이 잘 나와요","뷰가 좋아요"};
		
		List<ReviewDto> keyList = new ArrayList<ReviewDto>();
	
		
		for(int i=0;i<stringList.length;i++) {
			ReviewDto rDto=new ReviewDto();
			rDto.setB_id(b_id);
			rDto.setKey_word(stringList[i]);
			ReviewDto rDto2=BStoreDao.getKeyCount(rDto);
			keyList.add(rDto2);
		}

		//keyList의 각 dto에 key_word와 good_count를 통해서 
		// 키워드 + 키워드 선택한 수 
		// 가져올 수 있다.
		request.setAttribute("keyList", keyList);
		
		
		//스크랩 유무 확인하기
		
		EateryScrapDto eatDto=new EateryScrapDto();
		eatDto.setB_id(b_id);
		

		if(g_id != null){
			eatDto.setG_id(g_id);
			int isScrap=BStoreDao.isScrap(eatDto);
			
			request.setAttribute("isScrap",isScrap);
		}

	}
	
	// ajax 상세페이지
	@Override
	public void getDetailDataFilter(HttpServletRequest request) {
		
		String g_id=(String)request.getSession().getAttribute("g_id");
		request.setAttribute("g_id", g_id);
		
		//리뷰 페이징 처리 위한 로직
		// 필터 종류를 파라미터로 읽어와 본다.
		String b_id=request.getParameter("b_id");
		String array=request.getParameter("array");
		String only=request.getParameter("only");
		
		request.setAttribute("b_id", b_id);
		request.setAttribute("array", array);
		request.setAttribute("only", only);
		
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
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

		//BStoreDto 객체에 startRowNum 과 endRowNum 을 담는다.
		ReviewDto dto2=new ReviewDto();
		dto2.setStartRowNum(startRowNum);
		dto2.setEndRowNum(endRowNum);
		dto2.setB_id(b_id);
		
		if(g_id != null){
			dto2.setId(g_id);
		}

		//글 목록 얻어오기
		//필터 거친 리뷰 개수 얻어오기
		List<ReviewDto> reviewList =new ArrayList<ReviewDto>();
		int totalRow=0;
		if(array.equals("latest")&&only.equals("all")) { //최신순
			reviewList=BStoreDao.getReviewList_R(dto2);
			totalRow=BStoreDao.getReviewCount(b_id);
		}else if(array.equals("latest")&&only.equals("photo")) { //최신순+사진 리뷰만
			reviewList=BStoreDao.getReviewList_R_P(dto2);	
			totalRow=BStoreDao.getReviewCountOnly(b_id);
		}else if(array.equals("popular")&&only.equals("all")) { //인기순
			reviewList=BStoreDao.getReviewList_P(dto2);
			totalRow=BStoreDao.getReviewCount(b_id);
		}else if(array.equals("popular")&&only.equals("photo")) {  //인기순+사진 리뷰만
			reviewList=BStoreDao.getReviewList_P_P(dto2);
			totalRow=BStoreDao.getReviewCountOnly(b_id);
		}
		
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		

		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다.
		}
		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		
		// 키워드 총 개수
		request.setAttribute("totalRow", totalRow);
		
		//키워드 개수 순서대로 리스트 가져오기
		String[] stringList = {"가성비가 좋아요","포장이 꼼꼼해요","디저트가 맛있어요","친절해요","특별한 메뉴가 있어요","커피가 맛있어요","음료가 맛있어요","대화하기 좋아요","인테리어가 멋져요","사진이 잘 나와요","뷰가 좋아요"};
		
		List<ReviewDto> keyList = new ArrayList<ReviewDto>();
	
		
		for(int i=0;i<stringList.length;i++) {
			ReviewDto rDto=new ReviewDto();
			rDto.setB_id(b_id);
			rDto.setKey_word(stringList[i]);
			ReviewDto rDto2=BStoreDao.getKeyCount(rDto);
			keyList.add(rDto2);
		}

		//keyList의 각 dto에 key_word와 good_count를 통해서 
		// 키워드 + 키워드 선택한 수 
		// 가져올 수 있다.
		request.setAttribute("keyList", keyList);
		
	}
	
	//스크랩하기
	@Override
	public Map<String, Object> doScrap(HttpServletRequest request,String b_id) {
		String g_id=(String)request.getSession().getAttribute("g_id");
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		if(g_id == null) {
			map.put("isDoScrap","");
		}else {
			EateryScrapDto dto=new EateryScrapDto();
			dto.setB_id(b_id);
			dto.setG_id(g_id);
			
			BStoreDao.doScrap(dto);
			map.put("isDoScrap",true);
		}
		return map;
	}
	//스크랩 취소하기
	@Override
	public Map<String, Object> notScrap(HttpServletRequest request,String b_id) {
		String g_id=(String)request.getSession().getAttribute("g_id");
		
		EateryScrapDto dto=new EateryScrapDto();
		dto.setB_id(b_id);
		dto.setG_id(g_id);
		
		BStoreDao.notScrap(dto);
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("isNotScrap",true);
		return map;
	}
	
	
	// 혜림
	
	// 가게 대표이미지 구현하기 (3개까지는 아직 구현하지 못함)
	@Override
	public Map<String, Object> saveStoreImage(HttpServletRequest request, MultipartFile image) {
		//업로드된 파일에 대한 정보를 MultipartFile 객체를 이용해서 얻어낼수 있다.	
		// 원본 파일명
		String orgFileName=image.getOriginalFilename();
		//upload 폴더에 저장할 파일명을 직접구성한다.
		String saveFileName=System.currentTimeMillis()+orgFileName;
		// webapp/upload 폴더까지의 실제 경로 얻어내기 
		String realPath=request.getServletContext().getRealPath("/upload");
		// upload 폴더가 존재하지 않을경우 만들기 위한 File 객체 생성
		File upload=new File(realPath);
		if(!upload.exists()) {//만일 존재 하지 않으면
			upload.mkdir(); //만들어준다.
		}
		try {
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=realPath+File.separator+saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			image.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", "/upload/"+saveFileName);
		return map;
	}

	@Override
	public void saveStore(BStoreDto dto,HttpServletRequest request) {
		System.out.println("-----------1----------");
		System.out.println("dto:" +dto);
		System.out.println("----------------------");
		
		BStoreDao.insert(dto);
	}


	@Override
	public void updateStore(BStoreDto dto) {

		BStoreDao.update(dto);
		
	}
	
	@Override
	public void getStore(HttpSession session, ModelAndView mView, HttpServletRequest request) {
		String b_id = (String)session.getAttribute("b_id");
		BStoreDto dto = BStoreDao.getStore(b_id);
		System.out.println("-----------3-----------");
		System.out.println("session:" +session);
		System.out.println("dto:" +dto);
		System.out.println("mView:" +mView);
		System.out.println("----------------------");
		
		mView.addObject("dto",dto);

	}
	
	
	@Override
	public void getStore(String b_id, ModelAndView mView) {
		//음식점 정보 얻어오기
		BStoreDto dto=BStoreDao.getStore(b_id);
		mView.addObject("dto", dto);
		System.out.println("-----------3-2-----------");
		System.out.println("dto:" +dto);
		System.out.println("mView:" +mView);
		System.out.println("----------------------");
	}
	
	
	
	// 리스트 페이지 리스트 불러오기 ///////////////////
	@Override
	public void getList(HttpServletRequest request, BStoreDto dto) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=4;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
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
		// 혜림 시작 -------------------------------------------------------------
		/*
		[ 검색 키워드에 관련된 처리 ]
		-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
		String keyword=request.getParameter("keyword");
		String ex_keyword=request.getParameter("ex_keyword");
		String b_kind=request.getParameter("b_kind");
		String service=request.getParameter("service");
		
		System.out.println("---들어올때");
		System.out.println(keyword);
		System.out.println(ex_keyword);
		System.out.println(b_kind);
		System.out.println(service);
	
		if(keyword !=null){
			String encodedK=URLEncoder.encode(keyword);
			request.setAttribute("encodedK", encodedK);
		}
		if(ex_keyword!=null){
			String encodedEx=URLEncoder.encode(ex_keyword);
			request.setAttribute("encodedEx", encodedEx);
		}
		if(b_kind !=null){
			String encodedB=URLEncoder.encode(b_kind);
			
			request.setAttribute("encodedB", encodedB);
		}
		if(service !=null){
			String encodedS=URLEncoder.encode(service);
			request.setAttribute("encodedS", encodedS);
		}
		
		BStoreDto dto2=new BStoreDto();
		
		// 혜림 시작 -------------------------------------------------------------
		//만일 키워드가 넘어오지 않는다면 
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
		
		//만일 검색 키워드가 넘어온다면 
		
		// 혜림 끝 -------------------------------------------------------------

		
		//BStoreDto 객체에 startRowNum 과 endRowNum 을 담는다.
		dto2.setStartRowNum(startRowNum);
		dto2.setEndRowNum(endRowNum);
		
		System.out.println("--dto2");
		System.out.println(dto2.getEncodedK());
		System.out.println(dto2.getEx_keyword());
		System.out.println(dto2.getB_kind());
		System.out.println(dto2.getService());
		
		
		List<BStoreDto> list=BStoreDao.getList(dto2);
		//글 목록 얻어오기 
	
		//전체글의 갯수
		int totalRow=BStoreDao.getCount(dto2);
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		//특수기호를 인코딩한 키워드를 미리 준비한다. 

		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다.
		}
		//view page 에서 필요한 값을 request 에 담아준다. 
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
		// 혜림
		request.setAttribute("keyword", keyword);
		request.setAttribute("ex_keyword",ex_keyword);
		request.setAttribute("service",service);
		request.setAttribute("b_kind", b_kind);
	
	
	}
}