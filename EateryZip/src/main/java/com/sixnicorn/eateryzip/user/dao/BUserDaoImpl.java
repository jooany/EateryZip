package com.sixnicorn.eateryzip.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.BUserDto;



@Repository
public class BUserDaoImpl implements BUserDao {
	
	@Autowired
	private SqlSession session;

	//DB에서 회원 한명의 정보를 Select
	@Override
	public BUserDto getData(String b_id) {
		
		return session.selectOne("Buser.getData", b_id) ;
	}
	
	//회원가입 폼에서 입력 받은 정보를 DB에 insert(비밀번호 암호화 적용)
	@Override
	public void insert(BUserDto dto) {
		session.insert("Buser.insert", dto);
	}

	@Override
	public boolean isExist(String inputId) {
		//인자로 전달 받은 아이디가 존재하는지 select 해본다.
		String id = session.selectOne("Buser.isExist", inputId);
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}
	
	
	/* 혜림 */
	// 비즈니스회원정보 수정하기
	@Override
	public void update(BUserDto dto) {
		
		session.update("Buser.update", dto);
	}


		
}