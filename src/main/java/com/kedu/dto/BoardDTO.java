package com.kedu.dto;

public class BoardDTO {
	
	private int post_seq;
	private String post_category;
	private String mem_id;
	private String mem_nickname;
	private String mem_dong;
	private int post_hit;
	private String post_title;
	private String post_contents;
	private int post_like;
	private String post_date;
	
	// 하트가 채워져있는지 아닌지를 기록할 용도로 만든 변수, db컬럼,생성자에는 없는게 맞음.
	private int post_like_check;
	
	public int getPost_like_check() {
		return post_like_check;
	}
	public void setPost_like_check(int post_like_check) {
		this.post_like_check = post_like_check;
	}
	
	
	// 하트 수 카운트 변수
	private int post_like_count;
	
	public int getPost_like_count() {
		return post_like_count;
	}
	public void setPost_like_count(int post_like_count) {
		this.post_like_count = post_like_count;
	}
	
	//------------------------------------------------------------
	

	public BoardDTO() {}
	public BoardDTO(int post_seq, String post_category, String mem_id, String mem_nickname, String mem_dong,
			int post_hit, String post_title, String post_contents, int post_like, String post_date) {
		super();
		this.post_seq = post_seq;
		this.post_category = post_category;
		this.mem_id = mem_id;
		this.mem_nickname = mem_nickname;
		this.mem_dong = mem_dong;
		this.post_hit = post_hit;
		this.post_title = post_title;
		this.post_contents = post_contents;
		this.post_like = post_like;
		this.post_date = post_date;
	}
	
	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public String getPost_category() {
		return post_category;
	}
	public void setPost_category(String post_category) {
		this.post_category = post_category;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_dong() {
		return mem_dong;
	}
	public void setMem_dong(String mem_dong) {
		this.mem_dong = mem_dong;
	}
	public int getPost_hit() {
		return post_hit;
	}
	public void setPost_hit(int post_hit) {
		this.post_hit = post_hit;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_contents() {
		return post_contents;
	}
	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}
	public int getPost_like() {
		return post_like;
	}
	public void setPost_like(int post_like) {
		this.post_like = post_like;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
}