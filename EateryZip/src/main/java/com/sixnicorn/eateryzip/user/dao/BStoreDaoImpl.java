package com.sixnicorn.eateryzip.user.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;
import com.sixnicorn.eateryzip.user.dto.MenuDto;
import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.StoreImgDto;

@Repository
public class BStoreDaoImpl implements BStoreDao {

	@Autowired
	private SqlSession session;
	
	// 혜림
	
	@Override
	public void insert(BStoreDto dto) {
		/*
		 	namespace : BStore
		 	sql id : insert
		 	parameterType : BStoreDto
		 */
		session.insert("BStore.insert", dto);
	}

	@Override
	public void update(BStoreDto dto) {
		/*
		 	namespace : BStore
		 	sql id : update
		 	parameterType : BStoreDto
		*/
		session.update("BStore.update", dto);
	}
	
	//혜림&주연
	@Override
	public BStoreDto getStore(String b_id) {
		/*
		 	namespace : BStore
		 	sql id : getStore
		 	parameterType : String
		 	resultType : BStoreDto
		*/
		return session.selectOne("BStore.getStore", b_id);
	}
	// 나현
	@Override
	public List<BStoreDto> getList(BStoreDto dto) {
		return session.selectList("BStore.getList", dto);
	}

	@Override
	public int getCount(BStoreDto dto) {
		/*
		 * Mapper's namespace : BStore
		 * sql's id : getCount
		 * resultType : int
		 */
		return session.selectOne("BStore.getCount");
	}
	
	//주연
	//음식점 정보 가져오기 - 상세 정보 페이지(혜림님과동일)
	//음식점 사진 리스트 가져오기
	@Override
	public List<StoreImgDto> getStoreImgList(String b_id){
		return session.selectList("BStore.getStoreImgList",b_id);
	}
	//메뉴 이름,이미지,가격 가져오기
	@Override
	public List<MenuDto> getMenuList(String b_id){
		return session.selectList("BStore.getMenuList",b_id);
	}
	//리뷰 리스트 가져오기
	@Override
	public List<ReviewDto> getReviewList(ReviewDto dto){
		return session.selectList("BStore.getReviewList",dto);
	}
	//리뷰 개수 세기
	@Override
	public int getReviewCount(String b_id){

		return session.selectOne("BStore.getReviewCount",b_id);
	}
	//리뷰 키워드별 개수 세기 
	@Override
	public int getKeyCount(ReviewDto dto) {
		
		return session.selectOne("BStore.getKeyCount",dto);
	}
}



