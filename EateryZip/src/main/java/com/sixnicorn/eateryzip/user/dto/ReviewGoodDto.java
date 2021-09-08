package com.sixnicorn.eateryzip.user.dto;

public class ReviewGoodDto {
	private int review_num;
	private String id;
	
	public ReviewGoodDto(){}

	public ReviewGoodDto(int review_num, String id) {
		super();
		this.review_num = review_num;
		this.id = id;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	};
	
	



}
