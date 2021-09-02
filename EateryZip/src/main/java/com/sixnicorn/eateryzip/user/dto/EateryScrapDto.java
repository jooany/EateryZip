package com.sixnicorn.eateryzip.user.dto;

public class EateryScrapDto {
	private String b_id;
	private String g_id;
	
	public EateryScrapDto() {}

	public EateryScrapDto(String b_id, String g_id) {
		super();
		this.b_id = b_id;
		this.g_id = g_id;
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
	};
	
	
	
}
