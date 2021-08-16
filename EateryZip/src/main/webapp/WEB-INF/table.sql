-- 메뉴 테이블 
CREATE TABLE menu(
	b_id NUMBER NOT NULL, --사업자번호(음식점 고유번호)
	section_num NUMBER NOT NULL, --카테고리번호
	section_name VARCHAR2(100) NOT NULL, --카테고리명
	menu_name VARCHAR2(100) NOT NULL, --메뉴명
	menu_image VARCHAR2(100), -- 메뉴 이미지경로
	menu_price NUMBER NOT NULL -- 가격
);
-- 리뷰 테이블 
CREATE TABLE review(
	review_num NUMBER PRIMARY KEY, --글번호
	b_id NUMBER NOT NULL, --사업자번호(음식점 고유번호)
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
	b_id NUMBER, --사업자번호(음식점 고유번호)
	g_id VARCHAR2(100) --리뷰를 추천한 사용자
);

--일반회원정보 테이블
CREATE TABLE G_USER(
	G_ID VARCHAR2(100) PRIMARY KEY, --ID(숫자/문자/특별기호 사용)
	G_PWD VARCHAR2(100) NOT NULL, --비밀번호(숫자/문자/특별기호 사용)
	G_NAME VARCHAR2(100) NOT NULL, 
	G_ADDRESS VARCHAR2(100), -- 주소 API 사용에 따른 파악 필요
	G_EMAIL VARCHAR2(100), 
	G_PHONE VARCHAR2(100) NOT NULL, 
	G_DATE DATE NOT NULL, -- 가입날짜
	CLASS VARCHAR2(100) NOT NULL -- general 고정
);

--비즈니스회원정보 테이블
CREATE TABLE B_USER(
	B_ID VARCHAR2(100) PRIMARY KEY, --사업자번호(숫자8가지)
	B_PWD VARCHAR2(100) NOT NULL, --비밀번호(숫자/문자/특별기호 사용)
	B_NAME VARCHAR2(100) NOT NULL,
	B_ADDRESS VARCHAR2(100), -- 주소 API 사용에 따른 파악 필요
	B_EMAIL VARCHAR2(100),
	B_PHONE VARCHAR2(100) NOT NULL,
	B_DATE DATE NOT NULL, -- 가입날짜
	CLASS VARCHAR2(100) NOT NULL -- business 고정
);


--일반회원 등록 예시
INSERT INTO G_USER (G_ID,G_PWD,G_NAME,G_ADDRESS,G_EMAIL,G_PHONE,G_DATE,CLASS)
VALUES('zzzzz', 'zzzzz','이름', '경기도 부천시', 'zzz@zzz','01012345678',sysdate,'general');

--비즈니스회원 등록 예시
INSERT INTO B_USER (B_ID,B_PWD,B_NAME,B_ADDRESS,B_EMAIL,B_PHONE,B_DATE,CLASS)
VALUES('11111111', '11111111','이름','경기도 부천시', 'aaa@aaa','01012345678',sysdate,'business');






