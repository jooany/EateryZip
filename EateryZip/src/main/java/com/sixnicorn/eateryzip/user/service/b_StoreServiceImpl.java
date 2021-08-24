package com.sixnicorn.eateryzip.user.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dao.b_StoreDao;
import com.sixnicorn.eateryzip.user.dto.b_StoreDto;

@Service
public class b_StoreServiceImpl implements b_StoreService{
	
	@Autowired
	private b_StoreDao dao;
	
	@Override
	public void saveStoreImage(b_StoreDto dto, HttpServletRequest request) {
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값을 얻어오기
		MultipartFile image = dto.getStoreFile();
		//원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
		String orgFileName = image.getOriginalFilename();
		//파일 크기 -> 다운로드가 없으므로, 여기서는 필요 없다.
		long fileSize = image.getSize();
		
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		//db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if(!upload.exists()) {
			//만약 디렉토리가 존재하지X
			upload.mkdir();//폴더 생성
		}
		//저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgFileName;
		
		try {
			//upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
			System.out.println();	//임시 출력
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//dto 에 업로드된 파일의 정보를 담는다.
		//-> parameter 로 넘어온 dto 에는 caption, image 가 들어 있었다.
		//-> 추가할 것 : b_id, imagePath 만 추가로 담아주면 된다.
		//-> b_id : db 에 추가하면서 자동으로 들어감
		//String b_id = (String)request.getSession().getAttribute("b_id");
		//dto.setB_id(b_id);
		// b_Store은 사진 다운 기능이 없다. -> orgFileName, saveFileName, fileSize 저장할 필요X
		// imagePath 만 저장해주면 됨
		dto.setB_img_f("/upload/" + saveFileName);

		// b_StoreDao 를 이용해서 DB 에 저장하기
		dao.insert(dto);
	}


	@Override
	public Map<String, Object> uploadAjaxImage(b_StoreDto dto, HttpServletRequest request) {
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값을 얻어오기
		MultipartFile image = dto.getStoreFile();
		//원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
		String orgFileName = image.getOriginalFilename();
		//파일 크기
		long fileSize = image.getSize();
		
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		//db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if(!upload.exists()) {
			//만약 디렉토리가 존재하지X
			upload.mkdir();//폴더 생성
		}
		//저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgFileName;
		
		try {
			//upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
			System.out.println();	//임시 출력
		}catch(Exception e) {
			e.printStackTrace();
		}

		String imagePath = "/upload/" + saveFileName;
		
		//ajax upload 를 위한 imagePath return
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imagePath", imagePath);
		
		return map;
	}


	@Override
	public void insert(b_StoreDto dto, HttpServletRequest request) {
		//dto : caption, imagePath 가지고 있다.
		//dto 에 writer(id) 추가
		dto.setB_id((String)request.getSession().getAttribute("id"));
		
		//GalleryDao 를 이용해서 DB 에 저장하기
		dao.insert(dto);
		
	}


	@Override
	public void getDetail(ModelAndView mView, String b_id) {
		// b_id에 해당하는 데이터(dto)를 가져온다.
		b_StoreDto dto = dao.getData(b_id);
		//ModelAndView 에 가져온 b_StoreDto 를 담는다.
		mView.addObject("dto", dto);
		
	}


	@Override
	public void updateStore(b_StoreDto dto) {
		dao.update(dto);
		
	}


	@Override
	public void getStore(HttpSession session, ModelAndView mView, String b_id) {
		//인자로 전달된 회원의 번호를 이용해서 회원정보를 얻어와서 
		b_StoreDto dto=dao.getData(b_id);
		//ModelAndView 객체에 담아준다. 
		mView.addObject("dto", dto);
	}

}
