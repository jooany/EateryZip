package com.sixnicorn.eateryzip.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.GUserDto;
import com.sixnicorn.eateryzip.user.dto.ReservationDto;
import com.sixnicorn.eateryzip.user.dto.TakeoutDto;

@Repository
public class GUserDaoImpl implements GUserDao {
   
   @Autowired
   private SqlSession session;
   
   //프로필이미지
   @Override
   public String getProfileImg(String g_id) {
	   return session.selectOne("Guser.getProfileImg",g_id);
   }
   
   //DB에서 회원 한명의 정보를 select
   @Override
   public GUserDto getData(String g_id) {
      
      return session.selectOne("Guser.getData", g_id);
   }

   @Override
   public boolean insert(GUserDto dto) {
      int result = session.insert("Guser.insert", dto);
         if(result > 0){
            return true;
         }else{
            return false;
         }
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

   @Override
   public String getId(GUserDto dto) {
      
      return session.selectOne("Guser.getId",dto);
   }

   @Override
   public String getPwd(GUserDto dto) {
      return session.selectOne("Guser.getPwd", dto);
   }

   @Override
   public boolean changePwd(GUserDto dto) {
      int result = session.update("Guser.pwdChange",dto);
      if(result > 0) {
         return true;
      }else {
         return false;
      }
   }


	// 혜림 ----------------------------------------------------------
	// 일반회원 정보 수정하기
	@Override
	public void update(GUserDto dto) {
		// TODO Auto-generated method stub
		session.update("Guser.update", dto);
	}
	// 일반회원 탈퇴하기
	@Override
	public boolean delete(String g_id) {
		// guser에 담긴 값들을 보내준다.
		int result =session.delete("Guser.delete", g_id);
		if(result>0) {
			return true;
		}else {
			return false;
		}
		
	}
	// 포장내역 리스트
	@Override
	public List<TakeoutDto> getList(TakeoutDto dto) {

		return session.selectList("Guser.getTakeoutList", dto);
	}
	// 포장내역 갯수
	@Override
	public int getTakeoutCount(TakeoutDto dto) {
		
		return session.selectOne("Guser.getTakeoutCount", dto);
	}
	
	// 예약내역 리스트
	@Override
	public List<ReservationDto> getList2(ReservationDto dto) {

		return session.selectList("Guser.getReservationList", dto);
	}
	// 예약내역 갯수
	@Override
	public int getReservationCount(ReservationDto dto) {
		
		return session.selectOne("Guser.getReservationCount", dto);
	}
	
	
	
	
	
	
}