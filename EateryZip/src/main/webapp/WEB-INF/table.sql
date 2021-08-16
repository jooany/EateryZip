-- 메뉴 테이블 
CREATE TABLE menu(
	b_id VARCHAR2(100) NOT NULL, --사업자번호(음식점 고유번호)
	section_num NUMBER NOT NULL, --카테고리번호
	section_name VARCHAR2(100) NOT NULL, --카테고리명
	menu_name VARCHAR2(100) NOT NULL, --메뉴명
	menu_image VARCHAR2(100), -- 메뉴 이미지경로
	menu_price NUMBER NOT NULL -- 가격
);
-- 리뷰 테이블 
CREATE TABLE review(
	review_num NUMBER PRIMARY KEY, --글번호
	b_id VARCHAR2(100) NOT NULL, --사업자번호(음식점 고유번호)
	writer VARCHAR2(100) NOT NULL, --작성자
	review_image VARCHAR2(100) NOT NULL, --리뷰 이미지경로
	review_content CLOB NOT NULL, -- 리뷰 내용
	regdate DATE, -- 작성 날짜
	keyword_review VARCHAR2(100) -- 키워드 리뷰
);
-- 리뷰 번호 얻어낼 시퀀스
CREATE SEQUENCE review_seq; 
-- 리뷰 추천 테이블 
CREATE TABLE review_recommendation(
	review_num NUMBER, --사업자번호(글번호)
	g_id VARCHAR2(100)  --리뷰를 추천한 사용자
);
-- 리뷰 추천 테이블 
CREATE TABLE eatery_scrap(
	b_id VARCHAR2(100), --사업자번호(음식점 고유번호)
	g_id VARCHAR2(100) --리뷰를 추천한 사용자
);











