package com.kedu.dto;

public class MembersDTO {
	private String mem_id;
	private String mem_password;
	private String mem_nickname;
	private String mem_name;
	private String mem_ssn;
	private int mem_gender;
	private String mem_phone;
	private String mem_email;
	private String mem_zip_code;
	private String mem_address1;
	private String mem_address2;
	private String mem_dong;
	private int mem_role;
	private String mem_join_date;
	private int mem_status;
	private String end_date;
	
	public MembersDTO() {}
	public MembersDTO(String mem_id, String mem_password, String mem_nickname, String mem_name, String mem_ssn,
			int mem_gender, String mem_phone, String mem_email, String mem_zip_code, String mem_address1,
			String mem_address2, String mem_dong, int mem_role, String mem_join_date, int mem_status) {
		super();
		this.mem_id = mem_id;
		this.mem_password = mem_password;
		this.mem_nickname = mem_nickname;
		this.mem_name = mem_name;
		this.mem_ssn = mem_ssn;
		this.mem_gender = mem_gender;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.mem_zip_code = mem_zip_code;
		this.mem_address1 = mem_address1;
		this.mem_address2 = mem_address2;
		this.mem_dong = mem_dong;
		this.mem_role = mem_role;
		this.mem_join_date = mem_join_date;
		this.mem_status = mem_status;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_password() {
		return mem_password;
	}
	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_ssn() {
		return mem_ssn;
	}
	public void setMem_ssn(String mem_ssn) {
		this.mem_ssn = mem_ssn;
	}
	public int getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(int mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_zip_code() {
		return mem_zip_code;
	}
	public void setMem_zip_code(String mem_zip_code) {
		this.mem_zip_code = mem_zip_code;
	}
	public String getMem_address1() {
		return mem_address1;
	}
	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}
	public String getMem_address2() {
		return mem_address2;
	}
	public void setMem_address2(String mem_address2) {
		this.mem_address2 = mem_address2;
	}
	public String getMem_dong() {
		return mem_dong;
	}
	public void setMem_dong(String mem_dong) {
		this.mem_dong = mem_dong;
	}
	public int getMem_role() {
		return mem_role;
	}
	public void setMem_role(int mem_role) {
		this.mem_role = mem_role;
	}
	public String getMem_join_date() {
		return mem_join_date;
	}
	public void setMem_join_date(String mem_join_date) {
		this.mem_join_date = mem_join_date;
	}
	public int getMem_status() {
		return mem_status;
	}
	public void setMem_status(int mem_status) {
		this.mem_status = mem_status;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
}