package com.sixnicorn.eateryzip.user.dto;

public class TakeoutDto {
	private int takeout_num;
	private String g_id;
	private String b_id;
	private String takeout_name;
	private String takeout_date;
	private String takeout_time;
	private String takeout_phone;
	private String takeout_memo;
	private String menu;
	private int count;
	private int price;
	private String b_name;
	
	public TakeoutDto() {}

	public TakeoutDto(int takeout_num, String g_id, String b_id, String takeout_name, String takeout_date,
			String takeout_time, String takeout_phone, String takeout_memo, String menu, int count, int price,
			String b_name) {
		super();
		this.takeout_num = takeout_num;
		this.g_id = g_id;
		this.b_id = b_id;
		this.takeout_name = takeout_name;
		this.takeout_date = takeout_date;
		this.takeout_time = takeout_time;
		this.takeout_phone = takeout_phone;
		this.takeout_memo = takeout_memo;
		this.menu = menu;
		this.count = count;
		this.price = price;
		this.b_name = b_name;
	}

	public int getTakeout_num() {
		return takeout_num;
	}

	public void setTakeout_num(int takeout_num) {
		this.takeout_num = takeout_num;
	}

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getTakeout_name() {
		return takeout_name;
	}

	public void setTakeout_name(String takeout_name) {
		this.takeout_name = takeout_name;
	}

	public String getTakeout_date() {
		return takeout_date;
	}

	public void setTakeout_date(String takeout_date) {
		this.takeout_date = takeout_date;
	}

	public String getTakeout_time() {
		return takeout_time;
	}

	public void setTakeout_time(String takeout_time) {
		this.takeout_time = takeout_time;
	}

	public String getTakeout_phone() {
		return takeout_phone;
	}

	public void setTakeout_phone(String takeout_phone) {
		this.takeout_phone = takeout_phone;
	}

	public String getTakeout_memo() {
		return takeout_memo;
	}

	public void setTakeout_memo(String takeout_memo) {
		this.takeout_memo = takeout_memo;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	

	
	
	

}
