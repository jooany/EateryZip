package com.sixnicorn.eateryzip.eatery.dto;

public class ListDto {
	//필드
	private String b_id; //사업자번호
	private String b_name; //상호명
	private String b_kind; //업종
	private String intro; //소개글(30자 이내)
	private String b_img_f; //대표이미지
	private String b_open; //오픈
	private String b_close; //마감
	private String service; //예약 , 포장 선택
	private String ex_keyword; //편의사항, 기타
	private int menu_price; //메뉴 가격
	private String keyword_review; //키워드 리뷰
	private String popular; //인기순
	private String recommend; //추천순
	private String recent; //최신순

	//생성자
	public ListDto() {}

	public ListDto(String b_id, String b_name, String b_kind, String intro, String b_img_f, String b_open,
			String b_close, String service, String ex_keyword, int menu_price, String keyword_review, String popular,
			String recommend, String recent) {
		super();
		this.b_id = b_id;
		this.b_name = b_name;
		this.b_kind = b_kind;
		this.intro = intro;
		this.b_img_f = b_img_f;
		this.b_open = b_open;
		this.b_close = b_close;
		this.service = service;
		this.ex_keyword = ex_keyword;
		this.menu_price = menu_price;
		this.keyword_review = keyword_review;
		this.popular = popular;
		this.recommend = recommend;
		this.recent = recent;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_kind() {
		return b_kind;
	}

	public void setB_kind(String b_kind) {
		this.b_kind = b_kind;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getB_img_f() {
		return b_img_f;
	}

	public void setB_img_f(String b_img_f) {
		this.b_img_f = b_img_f;
	}

	public String getB_open() {
		return b_open;
	}

	public void setB_open(String b_open) {
		this.b_open = b_open;
	}

	public String getB_close() {
		return b_close;
	}

	public void setB_close(String b_close) {
		this.b_close = b_close;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getEx_keyword() {
		return ex_keyword;
	}

	public void setEx_keyword(String ex_keyword) {
		this.ex_keyword = ex_keyword;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getKeyword_review() {
		return keyword_review;
	}

	public void setKeyword_review(String keyword_review) {
		this.keyword_review = keyword_review;
	}

	public String getPopular() {
		return popular;
	}

	public void setPopular(String popular) {
		this.popular = popular;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public String getRecent() {
		return recent;
	}

	public void setRecent(String recent) {
		this.recent = recent;
	}

}