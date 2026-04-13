package com.kedu.dto;

public class AuthDTO {
	private String email;
	private String auth_code;
	private int auth_type;
	private int is_verified;
	private String auth_create_date;
	
	public AuthDTO() {
		super();
	}
	public AuthDTO(String email, String auth_code, int auth_type, int is_verified, String auth_create_date) {
		super();
		this.email = email;
		this.auth_code = auth_code;
		this.auth_type = auth_type;
		this.is_verified = is_verified;
		this.auth_create_date = auth_create_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAuth_code() {
		return auth_code;
	}
	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}
	public int getAuth_type() {
		return auth_type;
	}
	public void setAuth_type(int auth_type) {
		this.auth_type = auth_type;
	}
	public int getIs_verified() {
		return is_verified;
	}
	public void setIs_verified(int is_verified) {
		this.is_verified = is_verified;
	}
	public String getAuth_create_date() {
		return auth_create_date;
	}
	public void setAuth_create_date(String auth_create_date) {
		this.auth_create_date = auth_create_date;
	}
}