package com.sixnicorn.eateryzip.user.dto;

public class GUserDto {
	private String g_id;
	private String g_pwd;
	private String g_newPwd; 
	private String g_name;
	private String g_address;
	private String g_email;
	private String g_email2;
	private String g_phone;
	private String g_profile;
	private String g_regdate;
	private String grade;
	
	public GUserDto() {}

	public GUserDto(String g_id, String g_pwd, String g_newPwd, String g_name, String g_address, String g_email,
			String g_email2, String g_phone, String g_profile, String g_regdate, String grade) {
		super();
		this.g_id = g_id;
		this.g_pwd = g_pwd;
		this.g_newPwd = g_newPwd;
		this.g_name = g_name;
		this.g_address = g_address;
		this.g_email = g_email;
		this.g_email2 = g_email2;
		this.g_phone = g_phone;
		this.g_profile = g_profile;
		this.g_regdate = g_regdate;
		this.grade = grade;
	}

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public String getG_pwd() {
		return g_pwd;
	}

	public void setG_pwd(String g_pwd) {
		this.g_pwd = g_pwd;
	}

	public String getG_newPwd() {
		return g_newPwd;
	}

	public void setG_newPwd(String g_newPwd) {
		this.g_newPwd = g_newPwd;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_address() {
		return g_address;
	}

	public void setG_address(String g_address) {
		this.g_address = g_address;
	}

	public String getG_email() {
		return g_email;
	}

	public void setG_email(String g_email) {
		this.g_email = g_email;
	}

	public String getG_email2() {
		return g_email2;
	}

	public void setG_email2(String g_email2) {
		this.g_email2 = g_email2;
	}

	public String getG_phone() {
		return g_phone;
	}

	public void setG_phone(String g_phone) {
		this.g_phone = g_phone;
	}

	public String getG_profile() {
		return g_profile;
	}

	public void setG_profile(String g_profile) {
		this.g_profile = g_profile;
	}

	public String getG_regdate() {
		return g_regdate;
	}

	public void setG_regdate(String g_regdate) {
		this.g_regdate = g_regdate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}
