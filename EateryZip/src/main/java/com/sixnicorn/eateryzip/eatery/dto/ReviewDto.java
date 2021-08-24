package com.sixnicorn.eateryzip.eatery.dto;

public class ReviewDto {
	private int review_num;
	private String b_id;
	private String writer;
	private String review_image;
	private String review_content;
	private String regdate;
	private String keyword_review;
	private String review_kind;
	
	public ReviewDto(int review_num, String b_id, String writer, String review_image, String review_content,
			String regdate, String keyword_review, String review_kind) {
		super();
		this.review_num = review_num;
		this.b_id = b_id;
		this.writer = writer;
		this.review_image = review_image;
		this.review_content = review_content;
		this.regdate = regdate;
		this.keyword_review = keyword_review;
		this.review_kind = review_kind;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getReview_image() {
		return review_image;
	}

	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getKeyword_review() {
		return keyword_review;
	}

	public void setKeyword_review(String keyword_review) {
		this.keyword_review = keyword_review;
	}

	public String getReview_kind() {
		return review_kind;
	}

	public void setReview_kind(String review_kind) {
		this.review_kind = review_kind;
	}
	
	
	
	
}
