package com.sixnicorn.eateryzip.user.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sixnicorn.eateryzip.user.dao.BUserDao;
import com.sixnicorn.eateryzip.user.dto.BUserDto;

@Service
public class BUserServiceImpl implements BUserService {
	
	@Autowired
	private BUserDao Bdao;

	//비즈니스회원 로그인 처리 과정
	@Override
	public void loginProcess(BUserDto dto, HttpSession session , String isSave , HttpServletResponse response) {
		//입력한 정보가 맞는지 확인 - 기본 값 false
		boolean isValid= false;
		
		String b_id = dto.getB_id();
		String changedB_id=b_id.trim();
		
		String b_pwd = dto.getB_pwd();
		String changedB_pwd=b_pwd.trim();
		
		BUserDto result=Bdao.getData(changedB_id);
		
		if(result != null) {
			//만일 존재하는 아이디라면, 비밀번호가 일치하는지 확인한다.
			String encodedPwd=result.getB_pwd();
			String inputPwd=changedB_pwd;	
			isValid=BCrypt.checkpw(inputPwd, encodedPwd);
			
		}	
		
		if(isValid) { //만일 위의 정보가 모두 충족될 시,
			
			//session 영역에 아이디를 저장한다.
			session.setAttribute("b_id", dto.getB_id());
			session.setMaxInactiveInterval(60*60*6);
		
			   if(isSave != null){//만일 넘어오는 값이 있다면
			      //쿠키에 id 와 pwd 를 특정 키값으로 담아서 쿠키도 응답 되도록 한다.
			      Cookie idCook=new Cookie("savedb_Id", changedB_id);
			      idCook.setMaxAge(60*60*6); //쿠키 유지시간 (초단위)
			      response.addCookie(idCook); //기본객체 response의 addCookie 메소드를 사용
			      
			      Cookie pwdCook=new Cookie("savedb_Pwd", changedB_pwd);
			      pwdCook.setMaxAge(60*60*6);
			      response.addCookie(pwdCook);
			   }else {
				      Cookie idCook=new Cookie("savedb_Id", changedB_id);
				      idCook.setMaxAge(0); //쿠키 유지시간 (초단위)
				      response.addCookie(idCook);
				      
				      Cookie pwdCook=new Cookie("savedb_Pwd", changedB_pwd);
				      pwdCook.setMaxAge(0);
				      response.addCookie(pwdCook);
			   }
		}
	}

	//비즈니스 회원가입 로직
	@Override
	public void addUser(BUserDto dto) {
		//입력 받은 비밀번호를 암호화 하는 로직
		String pwd = dto.getB_pwd();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(pwd);
		//암호화한 비밀번호를 Dto에 다시 넣어준다.
		dto.setB_pwd(encodedPwd);
		
		Bdao.insert(dto);
	}

	//회원가입 ID check
	@Override
	public Map<String, Object> isExistId(String inputId) {
		//Map 객체를 생성해서
		Map<String, Object> map = new HashMap<String, Object>();
		//isExist 라는 키값으로 아이다가 존재하는지를 여부름 담고
		map.put("isExist",Bdao.isExist(inputId));
		//Map 객체를 리턴해준다.
		return map;
	}
	//비즈니스회원 아이디 찾기
	@Override
	public BUserDto findId(BUserDto dto) {
		
		BUserDto dto2 = dto;
		
		return dto2 ;
	}
	
	
	
	// 비즈니스회원가입 정보보기
	@Override
	public void getBmypage(HttpSession session, ModelAndView mView) {
		// 로그인된 아이디를 읽어온다.
		String b_id = (String)session.getAttribute("b_id");
		// DB에서 회원정보를 얻어와서
		BUserDto dto = Bdao.getData(b_id);
		
		// ModelAndView 객체에 담아준다.
		mView.addObject("dto", dto);
	}
	
	@Override
	public void updateUser(BUserDto dto, HttpSession session) {
		// 수정할 회원의 아이디
		String b_id = (String)session.getAttribute("b_id");
		// b_UserDto에 아이디도 담아주고
		dto.setB_id(b_id);

		// b_UserDao를 이용해서 수정반영한다.
		Bdao.update(dto);
		
	}
	
	
	// 비즈니스회원 프로필이미지
	@Override
	public Map<String, Object> saveB_profileImage(HttpServletRequest request, MultipartFile image) {
		//업로드된 파일에 대한 정보를 MultipartFile 객체를 이용해서 얻어낼수 있다.
		//원본 파일명
		String orgFileName=image.getOriginalFilename();
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
			image.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		// json 문자열을 출력하기 위한 Map객체 생성하고 정보담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imagePath", "/upload/"+saveFileName);
		return map;
	}

}