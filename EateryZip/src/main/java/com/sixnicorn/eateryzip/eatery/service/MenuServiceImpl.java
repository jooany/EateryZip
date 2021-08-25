package com.sixnicorn.eateryzip.eatery.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sixnicorn.eateryzip.eatery.dao.MenuDao;
import com.sixnicorn.eateryzip.eatery.dto.MenuDto;


@Service
public class MenuServiceImpl implements MenuService{
	@Autowired
	private MenuDao menuDao;

	//리스트 가져오기 + 섹션 최대 개수 가져오기
	@Override
	public void getList(HttpServletRequest request) {
		//세션에 로그인 된 비즈니스 아이디를 읽어와서
		String b_id=(String)request.getSession().getAttribute("b_id");
		//저장된 카테고리 개수를 얻어낸다.
		int sectionCount=menuDao.getSectionCount(b_id);
		//전체 메뉴 list를 얻어낸다.
		List<MenuDto> list=menuDao.getList(b_id);
		
		//view page 에서 필요한 값 request 에 담기
		request.setAttribute("sectionCount", sectionCount);
		request.setAttribute("list",list);
	}
	
	@Override
	public Map<String, Object> saveMenuImage(HttpServletRequest request, MultipartFile mFile) {
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
	
	//메뉴 추가 
	@Override
	public List<MenuDto> saveMenu(HttpServletRequest request) {
		
		// 정규식으로 각 섹션 번호_메뉴 번호에 해당하는 input name을 통해 요청파라미터에서 카테고리번호,메뉴번호,카테고리명,메뉴명,이미지경로,가격 정보를 가져옴.
		// 전체 메뉴 개수 만큼 DTO를 생성해서 각각 값들을 넣어주고,
		// menuDao.insert(dto) 시켜줌.
		
		// [ updateform에 전달하는 방법 ]
		// DTO 리스트에 해당 DTO들 전부 넣어줌.
		// DTO 리스트를 return함.
		
		// updateform에 해당 DTO 리스트를 받아와서
		// 각 value 값에 데이터를 넣어줌 
		
		// 섹션 끝 번호와 총 메뉴 수를 가져옴.
		int section_num=Integer.parseInt(request.getParameter("section_num"));
		int menu_count=Integer.parseInt(request.getParameter("menu_count"));
		
		// 각 섹션에 해당하는 메뉴 개수를 가져옴.
		for(int i=1;i<section_num;i++) {
			Integer.parseInt(request.getParameter("section_"+i));
		}
		
		List<MenuDto> menuList = new ArrayList<MenuDto>();
		
		//menuDao.insert(dto);
		
		return menuList;
	}
	//메뉴 삭제
	@Override
	public void deleteMenu(HttpServletRequest request) {
		int menu_num=Integer.parseInt(request.getParameter("menu_num"));
		
		menuDao.deleteMenu(menu_num);
		
	}
	

}
