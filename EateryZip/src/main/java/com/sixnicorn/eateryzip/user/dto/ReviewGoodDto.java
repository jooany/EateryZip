package com.sixnicorn.eateryzip.user.dto;

public class ReviewGoodDto {
	private int review_num;
	private String g_id;
	
	public ReviewGoodDto(){}

	public ReviewGoodDto(int review_num, String g_id) {
		super();
		this.review_num = review_num;
		this.g_id = g_id;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	};

}
