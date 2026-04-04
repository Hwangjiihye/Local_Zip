package com.kedu.dto;

public class CategoryVisitDTO {
	
	private String postCategory;
	private int count;
	
	public CategoryVisitDTO() {}
	
	public CategoryVisitDTO(String postCategory, int count) {
		this.postCategory = postCategory;
		this.count = count;
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
}