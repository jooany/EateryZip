package com.sixnicorn.eateryzip.user.dto;

public class ReservationDto {
	private int reservation_num;
	private String g_id;
	private String b_id;
	private String reservation_name;
	private String reservation_date;
	private String reservation_time;
	private String reservation_people;
	private String reservation_phone;
	private String reservation_memo;
	private String b_store_name;
	private String b_store_addr;
	
	//디폴트 생성자 
	public ReservationDto() {}

	public ReservationDto(int reservation_num, String g_id, String b_id, String reservation_name,
			String reservation_date, String reservation_time, String reservation_people, String reservation_phone,
			String reservation_memo, String b_store_name, String b_store_addr) {
		super();
		this.reservation_num = reservation_num;
		this.g_id = g_id;
		this.b_id = b_id;
		this.reservation_name = reservation_name;
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.reservation_people = reservation_people;
		this.reservation_phone = reservation_phone;
		this.reservation_memo = reservation_memo;
		this.b_store_name = b_store_name;
		this.b_store_addr = b_store_addr;
	}

	public int getReservation_num() {
		return reservation_num;
	}

	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
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

	public String getReservation_name() {
		return reservation_name;
	}

	public void setReservation_name(String reservation_name) {
		this.reservation_name = reservation_name;
	}

	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public String getReservation_time() {
		return reservation_time;
	}

	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}

	public String getReservation_people() {
		return reservation_people;
	}

	public void setReservation_people(String reservation_people) {
		this.reservation_people = reservation_people;
	}

	public String getReservation_phone() {
		return reservation_phone;
	}

	public void setReservation_phone(String reservation_phone) {
		this.reservation_phone = reservation_phone;
	}

	public String getReservation_memo() {
		return reservation_memo;
	}

	public void setReservation_memo(String reservation_memo) {
		this.reservation_memo = reservation_memo;
	}

	public String getB_store_name() {
		return b_store_name;
	}

	public void setB_store_name(String b_store_name) {
		this.b_store_name = b_store_name;
	}

	public String getB_store_addr() {
		return b_store_addr;
	}

	public void setB_store_addr(String b_store_addr) {
		this.b_store_addr = b_store_addr;
	}

	
}
