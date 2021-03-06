package com.sixnicorn.eateryzip.user.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sixnicorn.eateryzip.user.dao.MenuDao;
import com.sixnicorn.eateryzip.user.dto.MenuDto;


@Service
public class MenuServiceImpl implements MenuService{
	@Autowired
	private MenuDao menuDao;

	//리스트 가져오기 + 섹션 최대 개수 가져오기
	@Override
	public void getList(HttpServletRequest request) {
		//세션에 로그인 된 비즈니스 아이디를 읽어와서
		String b_id=(String)request.getSession().getAttribute("b_id");
		//저장된 메뉴 번호 최댓값을 얻어낸다.
		int menuMaxNum=menuDao.getMenuMaxNum(b_id);
		//저장된 카테고리 번호 최댓값을 얻어낸다.
		int sectionMaxNum=menuDao.getSectionMaxNum(b_id);
		//저장된 카테고리 개수를 얻어낸다.
		int sectionCount=menuDao.getSectionCount(b_id);
		//저장된 카테고리 번호 리스트를 얻어낸다.
		List<Integer> sectionNumList=menuDao.getSectionNumList(b_id);
		
		//전체 메뉴 list를 얻어낸다.
		List<MenuDto> list=menuDao.getList(b_id);
		
		//view page 에서 필요한 값 request 에 담기
		request.setAttribute("menuMaxNum", menuMaxNum);
		request.setAttribute("sectionMaxNum", sectionMaxNum);
		request.setAttribute("sectionCount", sectionCount);
		request.setAttribute("sectionNumList", sectionNumList);
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
	public Map<String, Object> saveMenu(MenuDto dto) {

		menuDao.insert(dto);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("menuNum",dto.getMenu_num());
		map.put("menuName",dto.getMenu_name());
		map.put("menuImg",dto.getMenu_image());
		map.put("menuPrice",dto.getMenu_price());
		map.put("sectionNum",dto.getSection_num());
		
		return map;
		
	}
	//메뉴 수정
	@Override
	public Map<String, Object> updateMenu(MenuDto dto) {
		menuDao.update(dto);
		
		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("menuNum",dto.getMenu_num());
		map.put("menuName",dto.getMenu_name());
		map.put("menuImg",dto.getMenu_image());
		map.put("menuPrice",dto.getMenu_price());
		
		return map;
	}
	//카테고리명 변경
	@Override
	public Map<String, Object> updateSectionName(HttpServletRequest request,int section_num,String section_name) {
		String b_id=(String)request.getSession().getAttribute("b_id");
		
		MenuDto dto=new MenuDto();
		dto.setB_id(b_id);
		dto.setSection_num(section_num);
		dto.setSection_name(section_name);
		
		if(menuDao.getSectionCount(b_id) !=0) {
			
		}
		
		menuDao.updateSectionName(dto);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("isSuccess",true);
		return map;
		
	}
	//메뉴 삭제
	@Override
	public Map<String, Object> deleteMenu(HttpServletRequest request, int menu_num, int section_num) {
		
		String b_id=(String)request.getSession().getAttribute("b_id");
		
		MenuDto dto=new MenuDto();
		dto.setB_id(b_id);
		dto.setMenu_num(menu_num);
		
		menuDao.deleteMenu(dto);
		
		MenuDto dto2=new MenuDto();
		
		dto2.setB_id(b_id);
		dto2.setSection_num(section_num);
		
		int isDataInSectionCount = menuDao.getIsDataInSection(dto2);
		
		Map<String,Object> map=new HashMap<String,Object>();
		//섹션 번호 저장
		map.put("sectionNum",section_num);
		//메뉴를 삭제한 후에 해당 섹션에 메뉴가 있으면 true 없으면 false를 저장함.
		if(isDataInSectionCount !=0) {
			map.put("isDataInSection",true);
		}else {
			map.put("isDataInSection",false);
		}
		
		return map;
	}
	//섹션 삭제
	@Override
	public Map<String, Object> deleteSection(HttpServletRequest request,int section_num){
		
		String b_id=(String)request.getSession().getAttribute("b_id");
		
		MenuDto dto=new MenuDto();
		dto.setB_id(b_id);
		dto.setSection_num(section_num);
		
		menuDao.deleteSection(dto);	
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("isSuccess",true);
		
		return map;
	}


}
