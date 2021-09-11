package com.sixnicorn.eateryzip.user.dto;

public class EateryScrapDto {
	private String b_id;
	private String g_id;
	
	// 혜림 --------------------------------
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum;
	private String b_name;
	private String b_kind;
	private String intro;
	private int isScrap;

	
	public EateryScrapDto() {}


	public EateryScrapDto(String b_id, String g_id, int startRowNum, int endRowNum, int prevNum, int nextNum,
			String b_name, String b_kind, String intro, int isScrap) {
		super();
		this.b_id = b_id;
		this.g_id = g_id;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.b_name = b_name;
		this.b_kind = b_kind;
		this.intro = intro;
		this.isScrap = isScrap;
	}


	public String getB_id() {
		return b_id;
	}


	public void setB_id(String b_id) {
		this.b_id = b_id;
	}


	public String getG_id() {
		return g_id;
	}


	public void setG_id(String g_id) {
		this.g_id = g_id;
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


	public int getIsScrap() {
		return isScrap;
	}


	public void setIsScrap(int isScrap) {
		this.isScrap = isScrap;
	}
	
}
