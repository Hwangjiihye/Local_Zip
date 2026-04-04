package com.kedu.dto;

public class CategoryVisitDTO {
	
	private String postCategory;
	private int count;
	private int visitCount;
	
	public CategoryVisitDTO() {}
	
	public CategoryVisitDTO(String postCategory, int count, int visitCount) {
		this.postCategory = postCategory;
		this.count = count;
		this.visitCount = visitCount;
	}
	
	public String getPostCategory() {
		return postCategory;
	}
	public void setPostCategory(String postCategory) {
		this.postCategory = postCategory;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
}