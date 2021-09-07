-- 메뉴 테이블 
CREATE TABLE menu(
	menu_seq_num NUMBER PRIMARY KEY,
	menu_num NUMBER NOT NULL,
	b_id VARCHAR2(100) NOT NULL, --사업자번호(음식점 고유번호)
	section_num NUMBER NOT NULL, --카테고리번호
	section_name VARCHAR2(100) NOT NULL, --카테고리명
	menu_name VARCHAR2(100) NOT NULL, --메뉴명
	menu_image VARCHAR2(100), -- 메뉴 이미지경로
	menu_price NUMBER NOT NULL -- 가격
);
-- 메뉴 번호 얻어낼 시퀀스 
CREATE SEQUENCE menu_seq;

-- 리뷰 테이블 
CREATE TABLE review(
	review_num NUMBER PRIMARY KEY, --글번호
	b_id VARCHAR2(100) NOT NULL, --사업자번호(음식점 고유번호)
	writer VARCHAR2(100) NOT NULL, --작성자
	review_image VARCHAR2(100), --리뷰 이미지경로
	review_content CLOB NOT NULL, -- 리뷰 내용
	regdate DATE, -- 작성 날짜
	keyword_review VARCHAR2(100), -- 키워드 리뷰
	review_kind VARCHAR2(10) NOT NULL, -- 포장 OR 예약
	takeout_num NUMBER, -- 예약 or 포장 번호
	reservation_num NUMBER
);
-- 리뷰 번호 얻어낼 시퀀스
CREATE SEQUENCE review_seq; 
-- 리뷰 추천 테이블 
CREATE TABLE review_good(
	review_num NUMBER NOT NULL,
	id VARCHAR2(100) NOT NULL
);
-- 음식점 추천 테이블 
CREATE TABLE eatery_scrap(
	b_id VARCHAR2(100) NOT NULL, --사업자번호(음식점 고유번호)
	g_id VARCHAR2(100) NOT NULL --리뷰를 추천한 사용자
);

--일반회원정보 테이블
CREATE TABLE G_USER(
	G_ID VARCHAR2(100) PRIMARY KEY, --ID(숫자/문자/특별기호 사용)
	G_PWD VARCHAR2(100) NOT NULL, --비밀번호(숫자/문자/특별기호 사용)
	G_NAME VARCHAR2(100) NOT NULL, 
	G_ADDRESS VARCHAR2(100), -- 주소 API 사용에 따른 파악 필요
	G_EMAIL VARCHAR2(100), 
	G_EMAIL2 VARCHAR2(100),
	G_PHONE VARCHAR2(100) NOT NULL, 
	G_REGDATE DATE NOT NULL, -- 가입날짜
	G_PROFILE varchar2(100),
	GRADE VARCHAR2(100) NOT NULL -- general 고정
);

--비즈니스회원정보 테이블
CREATE TABLE B_USER(
	B_ID VARCHAR2(100) PRIMARY KEY, --사업자번호(숫자8가지)
	B_PWD VARCHAR2(100) NOT NULL, --비밀번호(숫자/문자/특별기호 사용)
	B_NAME VARCHAR2(100) NOT NULL,
	B_ADDRESS VARCHAR2(100), -- 주소 API 사용에 따른 파악 필요
	B_EMAIL VARCHAR2(100),
	B_EMAIL2 VARCHAR2(100),
	B_PHONE VARCHAR2(100) NOT NULL,
	B_REGDATE DATE NOT NULL, -- 가입날짜
	B_PROFILE varchar2(100),
	GRADE VARCHAR2(100) NOT NULL -- business 고정
);


--일반회원 등록 예시
INSERT INTO G_USER (G_ID,G_PWD,G_NAME,G_ADDRESS,G_EMAIL,G_EMAIL2,G_PHONE,G_REGDATE,GRADE)
VALUES('zzzzz', 'zzzzz','이름', '경기도 부천시', 'zzz','@naver.com','01012345678',sysdate,'general');

--비즈니스회원 등록 예시
INSERT INTO B_USER (B_ID,B_PWD,B_NAME,B_ADDRESS,B_EMAIL,G_EMAIL2,B_PHONE,B_REGDATE,GRADE)
VALUES('11111111', '11111111','이름','경기도 부천시', 'aaa','@naver.com','01012345678',sysdate,'business');

--일반 회원 이메일 Email2 추가
update g_user set g_email2 ='@naver'
where g_id = '해당 아이디 입력';

--비즈니스 회원 이메일 email2 추가
update b_user set b_email2 = '@naver'
where b_id = '해당 사업자 번호 입력';

-- 가게등록 테이블
CREATE TABLE B_Store(
	b_id VARCHAR2(100) PRIMARY KEY, -- 사업자번호
	b_name VARCHAR2(100) NOT NULL, -- 상호명
	b_Store_Address VARCHAR2(100) NOT NULL, -- 가게주소
	b_kind VARCHAR2(100) NOT NULL, -- 업종
	intro VARCHAR2(60) NOT NULL, -- 소개글 (30자 이내)
	b_img_f VARCHAR2(100) NOT NULL, -- 가게 대표이미지
	b_Store_phone VARCHAR2(100) NOT NULL, -- 가게연락처
	b_Store_date VARCHAR2(100) NOT NULL, -- 영업일(매일 / 주말 / 평일)
	b_open VARCHAR2(100) NOT NULL, -- 가게 오픈시간
	b_close VARCHAR2(100) NOT NULL, -- 가게 마감시간
	b_holiday VARCHAR2(100), -- 가게 휴일
	notice VARCHAR2(100), -- 가게 공지사항
	service VARCHAR2(100) NOT NULL, -- 예약 , 포장 선택
	ex_keyword VARCHAR2(100) NOT NULL -- 편의사항/ 기타
);
-- 가게 등록 예시
INSERT INTO B_Store(b_id,b_name,b_Store_Address,b_kind,intro,b_img_f,
						b_Store_phone,b_Store_date,b_open,b_close,b_holiday,notice,service,ex_keyword )
VALUES ('1111111111', 'acorn', '서울특별시 강남구 테헤란로 124 삼원타워 5층', '브런치','안녕하세요','https://dummyimage.com/600x400/000/fff&text=dummy',
			'025398879','매일','09:30','18:00','일요일','만반잘부','예약/방문포장','주차/노키즈존/프라이빗');

-- 예약 테이블
CREATE TABLE reservation(
	reservation_num NUMBER PRIMARY KEY, -- 방문 예약 번호
	g_id VARCHAR2(100), -- 로그인 id
	b_id VARCHAR2(100), -- 사업자 번호
	reservation_name VARCHAR2(100) NOT NULL, --예약자 이름
	reservation_date VARCHAR2(100), -- 방문 날짜
	reservation_time VARCHAR2(100) NOT NULL, -- 방문 시간
	reservation_people VARCHAR2(100) NOT NULL, -- 방문 인원
	reservation_phone VARCHAR2(100) NOT NULL, -- 연락처
	reservation_memo VARCHAR2(200) -- 요청 사항
	b_store_name VARCHAR2(100) --가게 이름
	b_store_addr VARCHAR2(100) --가게 주소
);
CREATE SEQUENCE reservation_seq;

-- 포장 테이블
CREATE TABLE takeout(
	takeout_num NUMBER PRIMARY KEY, -- 포장 번호
	b_id VARCHAR2(100), -- 로그인 아이디
	G_ID VARCHAR2(100), -- 사업자 번호
	takeout_name VARCHAR2(100) NOT NULL, -- 예약자 이름
	takeout_date DATE, -- 예약 날짜( 당일날짜)
	takeout_time VARCHAR2(100) NOT NULL, --픽업시간
	takeout_phone VARCHAR2(100) NOT NULL, -- 연락처
	takeout_memo VARCHAR2(200), --요청사항
	takeout_menu VARCHAR2(100), -- 메뉴
	takeout_count NUMBER, -- 수량
	takeout_price NUMBER -- 가격
);
CREATE SEQUENCE takeout_seq;






