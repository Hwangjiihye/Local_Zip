package com.kedu.dto;

public class PostLikeDTO {
	
	private int like_seq;
	private int post_seq;
	private String mem_id;
	private String like_date;
	
	public PostLikeDTO() {}
	public PostLikeDTO(int like_seq, int post_seq, String mem_id, String like_date) {
		super();
		this.like_seq = like_seq;
		this.post_seq = post_seq;
		this.mem_id = mem_id;
		this.like_date = like_date;
	}
	
	public int getLike_seq() {
		return like_seq;
	}
	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
	}
	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getLike_date() {
		return like_date;
	}
	public void setLike_date(String like_date) {
		this.like_date = like_date;
	}
}