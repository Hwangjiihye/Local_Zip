package com.kedu.dto;

public class DailyVisitDTO {
	
	private String day;
	private int totalCount;
	private int newCount;
	
	public DailyVisitDTO() {}
	
	public DailyVisitDTO(String day, int totalCount, int newCount) {
		this.day = day;
		this.totalCount = totalCount;
		this.newCount = newCount;
	}
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getNewCount() {
		return newCount;
	}
	public void setNewCount(int newCount) {
		this.newCount = newCount;
	}
}