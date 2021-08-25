package com.sixnicorn.eateryzip.user.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

	
	
	
	
	
	
	// 비즈니스회원가입 정보보기
	@Override
	public void getMypage(HttpSession session, ModelAndView mView) {
		// 로그인된 아이디를 읽어온다.
		String B_id = (String)session.getAttribute("B_id");
		// DB에서 회원정보를 얻어와서
		BUserDto b_dto = Bdao.getData(B_id);
		
		// ModelAndView 객체에 담아준다.
		mView.addObject("b_dto", b_dto);
	}
	// 비즈니스회원가입 정보 수정하기
	@Override
	public void updateUsers(BUserDto b_dto, HttpSession session) {
		// 수정할 회원의 아이디
		String B_id = (String)session.getAttribute("B_id");
		// b_UserDto에 아이디도 담아주고
		b_dto.setB_id(B_id);
		// b_UserDao를 이용해서 수정반영한다.
		Bdao.update(b_dto);
		
	}
	// 비즈니스회원 프로필이미지
	@Override
	public Map<String, Object> saveB_profile(HttpServletRequest request, MultipartFile b_image) {
		//업로드된 파일에 대한 정보를 MultipartFile 객체를 이용해서 얻어낼수 있다.
		//원본 파일명
		String orgFileName=b_image.getOriginalFilename();
		//upload 폴더에 저장할 파일명을 직접구성한다.
		// 1234123424343xxx.jpg
		String b_saveFileName=System.currentTimeMillis()+orgFileName;
		// webapp/upload 폴더까지의 실제 경로 얻어내기 
		String realPath=request.getServletContext().getRealPath("/upload");
		// upload 폴더가 존재하지 않을경우 만들기 위한 File 객체 생성
		File upload=new File(realPath);
		if(!upload.exists()) {//만일 존재 하지 않으면
				upload.mkdir(); //만들어준다.
		}
		try {
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=realPath+File.separator+b_saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			b_image.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		// json 문자열을 출력하기 위한 Map객체 생성하고 정보담기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_imagePath", "/upload/"+b_saveFileName);
		return map;
	}

}
