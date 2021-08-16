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

-- 가게등록 테이블
CREATE TABLE b_Store(
	b_id VARCHAR2(100) PRIMARY KEY, -- 사업자주소
	b_name VARCHAR2(100) NOT NULL, -- 상호명
	b_address VARCHAR2(100) NOT NULL, -- 가게주소
	b_kind VARCHAR2(100) NOT NULL, -- 업종
	intro VARCHAR2(60) NOT NULL, -- 소개글 (30자 이내)
	b_img_f VARCHAR2(100) NOT NULL, -- 가게 대표이미지
	b_phone VARCHAR2(100) NOT NULL, -- 가게연락처
	b_date VARCHAR2(100) NOT NULL, -- 영업일(매일 / 주말 / 평일)
	b_open VARCHAR2(100) NOT NULL, -- 가게 오픈시간
	b_close VARCHAR2(100) NOT NULL, -- 가게 마감시간
	b_holiday VARCHAR2(100), -- 가게 휴일
	notice VARCHAR2(100), -- 가게 공지사항
	service VARCHAR2(100) NOT NULL, -- 예약 , 포장 선택
	ex_keyword VARCHAR2(100) NOT NULL -- 편의사항/ 기타
);

-- 가게 등록 예시
INSERT INTO b_Store(b_id,b_name,b_address,b_kind,intro,b_img_f,
						b_phone,b_date,b_open,b_close,b_holiday,notice,service,ex_keyword )
VALUES ('1111111111', 'acorn', '서울특별시 강남구 테헤란로 124 삼원타워 5층', '브런치','안녕하세요','https://dummyimage.com/600x400/000/fff&text=dummy',
			'025398879','매일','09:30','18:00','일요일','만반잘부','예약/방문포장','주차/노키즈존/프라이빗');




