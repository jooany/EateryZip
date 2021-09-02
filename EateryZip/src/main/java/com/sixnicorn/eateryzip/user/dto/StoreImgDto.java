package com.sixnicorn.eateryzip.user.dto;

public class StoreImgDto {
	private String b_id;
	private String store_img;
	
	public StoreImgDto (){};
	
	public StoreImgDto(String b_id, String store_img) {
		super();
		this.b_id = b_id;
		this.store_img = store_img;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getStore_img() {
		return store_img;
	}

	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}

}
