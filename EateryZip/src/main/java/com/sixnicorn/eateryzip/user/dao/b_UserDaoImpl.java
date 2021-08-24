package com.sixnicorn.eateryzip.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.b_UserDto;

@Repository
public class b_UserDaoImpl implements b_UserDao {
	
	@Autowired
	private SqlSession session;

	//DB에서 회원 한명의 정보를 Select
	@Override
	public b_UserDto getData(String b_id) {
		
		return session.selectOne("b_user.b_getData", b_id) ;
	}
	
	//회원가입 폼에서 입력 받은 정보를 DB에 insert(비밀번호 암호화 적용)
	@Override
	public void insert(b_UserDto b_dto) {
		session.insert("b_user.b_insert", b_dto);
	}

	
	
	
	
	
	
	// 비즈니스회원정보 수정하기
	@Override
	public void update(b_UserDto b_dto) {
		
		session.update("b_users.update", b_dto);
	}
		
}
