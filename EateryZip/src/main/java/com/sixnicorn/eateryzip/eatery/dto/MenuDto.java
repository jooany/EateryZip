package com.sixnicorn.eateryzip.eatery.dto;

public class MenuDto {
	private int menu_seq_num;
	private int menu_num;
	private String b_id;
	private int section_num;
	private String section_name;
	private String menu_name;
	private String menu_image;
	private int menu_price;
	
	public MenuDto() {}

	public MenuDto(int menu_seq_num, int menu_num, String b_id, int section_num, String section_name, String menu_name,
			String menu_image, int menu_price) {
		super();
		this.menu_seq_num = menu_seq_num;
		this.menu_num = menu_num;
		this.b_id = b_id;
		this.section_num = section_num;
		this.section_name = section_name;
		this.menu_name = menu_name;
		this.menu_image = menu_image;
		this.menu_price = menu_price;
	}

	public int getMenu_seq_num() {
		return menu_seq_num;
	}

	public void setMenu_seq_num(int menu_seq_num) {
		this.menu_seq_num = menu_seq_num;
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public int getSection_num() {
		return section_num;
	}

	public void setSection_num(int section_num) {
		this.section_num = section_num;
	}

	public String getSection_name() {
		return section_name;
	}

	public void setSection_name(String section_name) {
		this.section_name = section_name;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_image() {
		return menu_image;
	}

	public void setMenu_image(String menu_image) {
		this.menu_image = menu_image;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	
	
	
	
}
