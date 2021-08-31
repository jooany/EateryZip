package com.sixnicorn.eateryzip.user.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sixnicorn.eateryzip.user.dao.GUserDao;
import com.sixnicorn.eateryzip.user.dto.GUserDto;

@Service
public class GUserServiceImpl implements GUserService {
	
	@Autowired
	private GUserDao Gdao;

	//일반회원가입 로그인 처리 과정
	@Override
	public void loginProcess(GUserDto dto, HttpSession session , String isSave , HttpServletResponse response) {
		boolean isValid= false;
		
		String g_id = dto.getG_id();
		String changedG_id=g_id.trim();
		
		String g_pwd = dto.getG_pwd();
		String changedG_pwd=g_pwd.trim();
		
		GUserDto result=Gdao.getData(changedG_id);
		if(result != null) {
			//만일 존재하는 아이디라면, 비밀번호가 일치하는지 확인한다.
			String encodedPwd=result.getG_pwd();
			String inputPwd=changedG_pwd;	
			isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		}
		
		if(isValid) { //만일 위의 정보가 모두 충족될 시,
			//session 영역에 아이디를 저장한다.
			session.setAttribute("g_id", dto.getG_id());
			session.setMaxInactiveInterval(60*60*6);
			
			if(isSave != null){//만일 넘어오는 값이 있다면
			      //쿠키에 id 와 pwd 를 특정 키값으로 담아서 쿠키도 응답 되도록 한다.
			      Cookie idCook=new Cookie("savedg_Id", changedG_id);
			      idCook.setMaxAge(60*60*6); //쿠키 유지시간 (초단위)
			      response.addCookie(idCook); //기본객체 response의 addCookie 메소드를 사용
			      
			      Cookie pwdCook=new Cookie("savedg_Pwd", changedG_pwd);
			      pwdCook.setMaxAge(60*60*6);
			      response.addCookie(pwdCook);
			   }else {
				      Cookie idCook=new Cookie("savedg_Id", changedG_id);
				      idCook.setMaxAge(0); //쿠키 유지시간 (초단위)
				      response.addCookie(idCook);
				      
				      Cookie pwdCook=new Cookie("savedg_Pwd", changedG_pwd);
				      pwdCook.setMaxAge(0);
				      response.addCookie(pwdCook);
			   }
		}
		
	}

	//일반 회원 가입 로직
	@Override
	public void addUser(GUserDto dto) {
		//입력 받은 비밀번호를 암호화 하는 로직
		String pwd = dto.getG_pwd();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(pwd);
		//암호화한 비밀번호를 Dto에 다시 넣어준다.
		dto.setG_pwd(encodedPwd);
		
		Gdao.insert(dto);
		
	}

	@Override
	public Map<String, Object> isExistId(String inputId) {
		//Map 객체를 생성해서
		Map<String, Object> map = new HashMap<String, Object>();
		//isExist 라는 키값으로 아이다가 존재하는지를 여부름 담고
		map.put("isExist",Gdao.isExist(inputId));
		//Map 객체를 리턴해준다.
		return map;
	}

}
