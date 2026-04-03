package com.kedu.dto;

public class FeedBackDTO {
	
	private int suggestion_seq;
	private String mem_id;
	private String suggestion_title;
	private String suggestion_contents;
	private String suggestion_writedate;
	private int suggestion_like;
	private int suggestion_unlike;
	
	public FeedBackDTO() {}
	public FeedBackDTO(int suggestion_seq, String mem_id, String suggestion_title, String suggestion_contents,
			String suggestion_writedate, int suggestion_like, int suggestion_unlike) {
		super();
		this.suggestion_seq = suggestion_seq;
		this.mem_id = mem_id;
		this.suggestion_title = suggestion_title;
		this.suggestion_contents = suggestion_contents;
		this.suggestion_writedate = suggestion_writedate;
		this.suggestion_like = suggestion_like;
		this.suggestion_unlike = suggestion_unlike;
	}
	
	public int getSuggestion_seq() {
		return suggestion_seq;
	}
	public void setSuggestion_seq(int suggestion_seq) {
		this.suggestion_seq = suggestion_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getSuggestion_title() {
		return suggestion_title;
	}
	public void setSuggestion_title(String suggestion_title) {
		this.suggestion_title = suggestion_title;
	}
	public String getSuggestion_contents() {
		return suggestion_contents;
	}
	public void setSuggestion_contents(String suggestion_contents) {
		this.suggestion_contents = suggestion_contents;
	}
	public String getSuggestion_writedate() {
		return suggestion_writedate;
	}
	public void setSuggestion_writedate(String suggestion_writedate) {
		this.suggestion_writedate = suggestion_writedate;
	}
	public int getSuggestion_like() {
		return suggestion_like;
	}
	public void setSuggestion_like(int suggestion_like) {
		this.suggestion_like = suggestion_like;
	}
	public int getSuggestion_unlike() {
		return suggestion_unlike;
	}
	public void setSuggestion_unlike(int suggestion_unlike) {
		this.suggestion_unlike = suggestion_unlike;
	}
}
