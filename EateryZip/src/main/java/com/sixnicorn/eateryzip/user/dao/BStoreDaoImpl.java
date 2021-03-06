package com.sixnicorn.eateryzip.user.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sixnicorn.eateryzip.user.dto.BStoreDto;
import com.sixnicorn.eateryzip.user.dto.EateryScrapDto;
import com.sixnicorn.eateryzip.user.dto.MenuDto;
import com.sixnicorn.eateryzip.user.dto.ReviewDto;
import com.sixnicorn.eateryzip.user.dto.ReviewGoodDto;
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
	
	@Override
	public void insertStoreImg(StoreImgDto dto) {
		session.insert("BStore.insertStoreImg",dto);
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

		String keyword=dto.getEncodedK();
		String ex_keyword=dto.getEx_keyword();
		String b_kind=dto.getB_kind();
		String service=dto.getService();
		
		System.out.println("----DaoImpl");
		System.out.println(keyword);
		System.out.println(ex_keyword);
		System.out.println(b_kind);
		System.out.println(service);
		
		return session.selectList("BStore.getList", dto);
	}
	

	@Override
	public int getCount(BStoreDto dto) {
		/*
		 * Mapper's namespace : BStore
		 * sql's id : getCount
		 * resultType : int
		 */
		return session.selectOne("BStore.getCount", dto);
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
	
	
	//[최신순] 리뷰 리스트 가져오기
	@Override
	public List<ReviewDto> getReviewList_R(ReviewDto dto){
		return session.selectList("BStore.getReviewList_R",dto);
	}
	//[최신순+사진리뷰만]
	@Override
	public List<ReviewDto> getReviewList_R_P(ReviewDto dto){
		return session.selectList("BStore.getReviewList_R_P",dto);
	}
	//[인기순]
	@Override
	public List<ReviewDto> getReviewList_P(ReviewDto dto){
		return session.selectList("BStore.getReviewList_P",dto);
	}
	//[인기순+사진리뷰만]
	@Override
	public List<ReviewDto> getReviewList_P_P(ReviewDto dto){
		return session.selectList("BStore.getReviewList_P_P",dto);
	}
	
	
	//리뷰 개수 세기
	@Override
	public int getReviewCount(String b_id){

		return session.selectOne("BStore.getReviewCount",b_id);
	}
	//리뷰 사진만 개수 세기
	@Override
	public int getReviewCountOnly(String b_id){

		return session.selectOne("BStore.getReviewCountOnly",b_id);
	}
	
	//리뷰 키워드별 개수 세기 
	@Override
	public ReviewDto getKeyCount(ReviewDto dto) {
		
		return session.selectOne("BStore.getKeyCount",dto);
	}
	//음식점 스크랩하기
	@Override
	public void doScrap(EateryScrapDto dto) {
		session.insert("BStore.doScrap",dto);
	}
	//음식점 스크랩취소하기
	@Override
	public void notScrap(EateryScrapDto dto) {
		session.delete("BStore.notScrap",dto);
	}
	//음식점 스크랩 유무 확인하기
	@Override
	public int isScrap(EateryScrapDto dto) {
		return session.selectOne("BStore.isScrap",dto);
	}
	//리뷰 추천
	@Override
	public void doReviewGood(ReviewGoodDto dto) {
		session.insert("BStore.doReviewGood",dto);
	}
	//리뷰 취소
	@Override
	public void notReviewGood(ReviewGoodDto dto) {
		session.delete("BStore.notReviewGood",dto);
	}
	//배너이미지리스트<-리뷰이미지가져오기
	@Override
	public List<ReviewDto> getReviewImgList(String b_id) {
		return session.selectList("BStore.getReviewImgList",b_id);
	}

}



