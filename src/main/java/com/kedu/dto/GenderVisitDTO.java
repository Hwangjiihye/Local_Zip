package com.kedu.dto;

public class GenderVisitDTO {
	
	private String gender;
	private int count;
	
	public GenderVisitDTO() {}
	
	public GenderVisitDTO(String gender, int count) {
		this.gender = gender;
		this.count = count;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}