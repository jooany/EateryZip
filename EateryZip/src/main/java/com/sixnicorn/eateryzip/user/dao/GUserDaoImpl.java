package com.sixnicorn.eateryzip.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.GUserDto;

@Repository
public class GUserDaoImpl implements GUserDao {
	
	@Autowired
	private SqlSession session;
	
	//DB에서 회원 한명의 정보를 select
	@Override
	public GUserDto getData(String g_id) {
		
		return session.selectOne("Guser.getData", g_id);
	}

	@Override
	public void insert(GUserDto dto) {
		session.insert("Guser.insert", dto);
	}

	@Override
	public boolean isExist(String inputId) {
		//인자로 전달 받은 아이디가 존재하는지 select 해본다.
		String id = session.selectOne("Guser.isExist", inputId);
			if(id==null) {
					return false;
			}else {
					return true;
			}
	}

}
