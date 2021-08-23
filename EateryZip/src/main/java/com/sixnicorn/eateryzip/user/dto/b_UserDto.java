package com.sixnicorn.eateryzip.user.dto;

public class b_UserDto {
	private String b_id;
	private String b_pwd;
	private String b_newPwd; 
	private String b_name;
	private String b_address;
	private String b_email;
	private String b_phone;
	private String b_profile;
	private String b_regdate;
	private String grade;
	
	public b_UserDto() {}

	public b_UserDto(String b_id, String b_pwd, String b_newPwd, String b_name, String b_address, String b_email,
			String b_phone, String b_profile, String b_regdate, String grade) {
		super();
		this.b_id = b_id;
		this.b_pwd = b_pwd;
		this.b_newPwd = b_newPwd;
		this.b_name = b_name;
		this.b_address = b_address;
		this.b_email = b_email;
		this.b_phone = b_phone;
		this.b_profile = b_profile;
		this.b_regdate = b_regdate;
		this.grade = grade;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_pwd() {
		return b_pwd;
	}

	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}

	public String getB_newPwd() {
		return b_newPwd;
	}

	public void setB_newPwd(String b_newPwd) {
		this.b_newPwd = b_newPwd;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_address() {
		return b_address;
	}

	public void setB_address(String b_address) {
		this.b_address = b_address;
	}

	public String getB_email() {
		return b_email;
	}

	public void setB_email(String b_email) {
		this.b_email = b_email;
	}

	public String getB_phone() {
		return b_phone;
	}

	public void setB_phone(String b_phone) {
		this.b_phone = b_phone;
	}

	public String getB_profile() {
		return b_profile;
	}

	public void setB_profile(String b_profile) {
		this.b_profile = b_profile;
	}

	public String getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	
	
	
}
