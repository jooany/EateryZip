package com.sixnicorn.eateryzip.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sixnicorn.eateryzip.user.dao.MenuDao;
import com.sixnicorn.eateryzip.user.dao.TakeOutDao;
import com.sixnicorn.eateryzip.user.dto.MenuDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

@Service
public class TakeOutServiceImpl implements TakeOutService{

	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private TakeOutDao takeOutDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		//세션에 로그인 된 비즈니스 아이디를 읽어와서
		String b_id=request.getParameter("b_id");
		
		//take_out_num의 최대값을 가져온다.
		int takeOutMaxNum=takeOutDao.getTakeOutMaxNum();
		
		//저장된 카테고리 번호 리스트를 얻어낸다.
		List<Integer> sectionNumList=menuDao.getSectionNumList(b_id);
		
		//전체 메뉴 list를 얻어낸다.
		List<MenuDto> list=menuDao.getList(b_id);
		
		//view page 에서 필요한 값 request 에 담기
		request.setAttribute("sectionNumList", sectionNumList);
		request.setAttribute("list",list);
		request.setAttribute("takeOutMaxNum", takeOutMaxNum);
		
		
	}

	@Override
	public void saveTakeOut(TakeoutDto dto) {
		int seq=takeOutDao.getSequence();
		dto.setTakeout_num(seq);
		takeOutDao.info_insert(dto);
	}

	@Override
	public void saveMenu(TakeoutDto dto, HttpServletRequest request) {
		String[] menu = request.getParameterValues("menu_choice");
		
		for(String tmp : menu){
		   String[] info = tmp.split("/");  // [ "1". "2" ], ["2", "5"]
		   int code = Integer.parseInt(info[0]);
		   int amount = Integer.parseInt(info[1]);
		   int m_num = Integer.parseInt(info[2]);
		   String m_name=info[3];
		   dto.setMenu_num(code);;
		   dto.setMenu_count(amount);
		   dto.setTake_menu_num(m_num);
		   dto.setMenu_name(m_name);
		   takeOutDao.menu_insert(dto);
 		 };
	}

	@Override
	public void getInfo(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("takeout_num"));
		TakeoutDto dto=takeOutDao.getData(num);
		request.setAttribute("dto", dto);
	}

	@Override
	public void getMenuInfo(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("takeout_num"));
		List<TakeoutDto> list=takeOutDao.getData2(num);
		request.setAttribute("list", list);
	}


}
