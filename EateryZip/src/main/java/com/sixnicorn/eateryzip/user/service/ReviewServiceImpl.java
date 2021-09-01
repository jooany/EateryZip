package com.sixnicorn.eateryzip.user.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sixnicorn.eateryzip.user.dao.ReviewDao;
import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void getList(HttpServletRequest request,int takeout_num,String b_id) {
		
		//int takeout_num=Integer.parseInt(request.getParameter("takeout_num"));
		//String b_id=request.getParameter("b_id");
		//포장 내역 가져오기
		TakeoutDto dto=new TakeoutDto();
		dto.setB_id(b_id);
		dto.setTakeout_num(takeout_num);

		TakeoutDto dto1=reviewDao.getTakeoutData(dto);
		
		//저장된 리뷰 가져오기
		ReviewDto dto2=new ReviewDto();
		dto2=reviewDao.getReviewDataT(takeout_num);
		
		request.setAttribute("dto1", dto1);
		request.setAttribute("dto2", dto2);

	}
	
	@Override
	public Map<String, Object> saveImage(HttpServletRequest request, MultipartFile mFile) {
		//업로드된 파일에 대한 정보를 MultipartFile 객체를 이용해서 얻어낼수 있다.	
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//upload 폴더에 저장할 파일명을 직접구성한다.
		// 1234123424343xxx.jpg
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
			mFile.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", "/upload/"+saveFileName);
		
		return map;
	}
	
	// 포장 리뷰 등록하기
	@Override
	public void insertReviewT(ReviewDto dto) {
		reviewDao.insertReviewT(dto);
	}
	
	//포장 리뷰 수정하기
	@Override
	public void updateReviewT(ReviewDto dto) {
		reviewDao.updateReviewT(dto);
	}
}
