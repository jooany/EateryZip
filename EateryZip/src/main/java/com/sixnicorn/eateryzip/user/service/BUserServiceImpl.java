package com.sixnicorn.eateryzip.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sixnicorn.eateryzip.user.dao.BUserDao;
import com.sixnicorn.eateryzip.user.dto.BUserDto;

@Service
public class BUserServiceImpl implements BUserService {
	
	@Autowired
	private BUserDao Bdao;

	//비즈니스회원 로그인 처리 과정
	@Override
	public void loginProcess(BUserDto dto, HttpSession session) {
		//입력한 정보가 맞는지 확인 - 기본 값 false
		boolean isValid= false;
		
		BUserDto result=Bdao.getData(dto.getB_id());
		if(result != null) {
			//만일 존재하는 아이디라면, 비밀번호가 일치하는지 확인한다.
			String encodedPwd=result.getB_pwd();
			String inputPwd=dto.getB_pwd();	
			isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		}
		
		if(isValid) { //만일 위의 정보가 모두 충족될 시,
			//session 영역에 아이디를 저장한다.
			session.setAttribute("b_id", dto.getB_id());
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

}
