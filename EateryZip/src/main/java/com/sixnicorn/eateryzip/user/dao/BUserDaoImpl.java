package com.sixnicorn.eateryzip.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.BUserDto;
import com.sixnicorn.eateryzip.user.dto.ReservationDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;



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
	public boolean insert(BUserDto dto) {
		int result = session.insert("Buser.insert", dto);
			if(result > 0){
				return true;
			}else{
				return false;
			}
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
	
	@Override
	public String getId(BUserDto dto) {
		
		return session.selectOne("Buser.getId",dto);
	}
	
	@Override
	public String getPwd(BUserDto dto) {
		
		return session.selectOne("Buser.getPwd", dto);
	}
	
	@Override
	public boolean changePwd(BUserDto dto) {
		int result = session.update("Buser.pwdChange",dto);
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}

	
	/* 혜림 */
	// 비즈니스회원정보 수정하기
	@Override
	public void update(BUserDto dto) {
		
		session.update("Buser.update", dto);
	}
	
	// 포장내역 리스트
	@Override
	public List<TakeoutDto> getList(TakeoutDto dto) {

		return session.selectList("Buser.getBtakeoutList", dto);
	}
	// 포장내역 갯수
	@Override
	public int getBtakeoutCount(TakeoutDto dto) {
		
		return session.selectOne("Buser.getBtakeoutCount", dto);
	}
	// 예약내역 리스트
	@Override
	public List<ReservationDto> getList2(ReservationDto dto) {
		
		return session.selectList("Buser.getBreservationList", dto);
	}
	// 예약내역 갯수
	@Override
	public int getBreservationCount(ReservationDto dto) {

		return session.selectOne("Buser.getBreservationCount", dto);
	}

	
}