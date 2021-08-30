package com.sixnicorn.eateryzip.user.dto;

import org.springframework.web.multipart.MultipartFile;

public class BStoreDto {

	// 필드
	private String b_id;
	private String b_name;
	private String b_Store_Address;
	private String b_kind;
	private String intro;
	// 파일 시스템에 저장된 파일명
	private String b_img_f;
	private String b_Store_phone;
	private String b_Store_date;
	private String b_open;
	private String b_close;
	private String b_holiday;
	private String notice;
	private String service;
	private String ex_keyword;
	// 파일 업로드 처리를 하기위한 필드
	private MultipartFile storeFile;
	
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum;
	
	// 디폴트 생성자
	public BStoreDto() {}

	public BStoreDto(String b_id, String b_name, String b_Store_Address, String b_kind, String intro, String b_img_f,
			String b_Store_phone, String b_Store_date, String b_open, String b_close, String b_holiday, String notice,
			String service, String ex_keyword, MultipartFile storeFile, int startRowNum, int endRowNum, int prevNum,
			int nextNum) {
		super();
		this.b_id = b_id;
		this.b_name = b_name;
		this.b_Store_Address = b_Store_Address;
		this.b_kind = b_kind;
		this.intro = intro;
		this.b_img_f = b_img_f;
		this.b_Store_phone = b_Store_phone;
		this.b_Store_date = b_Store_date;
		this.b_open = b_open;
		this.b_close = b_close;
		this.b_holiday = b_holiday;
		this.notice = notice;
		this.service = service;
		this.ex_keyword = ex_keyword;
		this.storeFile = storeFile;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
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

	public String getB_Store_Address() {
		return b_Store_Address;
	}

	public void setB_Store_Address(String b_Store_Address) {
		this.b_Store_Address = b_Store_Address;
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

	public String getB_Store_phone() {
		return b_Store_phone;
	}

	public void setB_Store_phone(String b_Store_phone) {
		this.b_Store_phone = b_Store_phone;
	}

	public String getB_Store_date() {
		return b_Store_date;
	}

	public void setB_Store_date(String b_Store_date) {
		this.b_Store_date = b_Store_date;
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

	public String getB_holiday() {
		return b_holiday;
	}

	public void setB_holiday(String b_holiday) {
		this.b_holiday = b_holiday;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
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

	public MultipartFile getStoreFile() {
		return storeFile;
	}

	public void setStoreFile(MultipartFile storeFile) {
		this.storeFile = storeFile;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

}
