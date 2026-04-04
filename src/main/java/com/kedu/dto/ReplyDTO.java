package com.kedu.dto;

public class ReplyDTO {
	
	private int reply_seq;
	private int post_seq;
	private String mem_id;
	private String mem_nickname;
	private String reply_contents;
	private String reply_date;
	
	public ReplyDTO() {}
	public ReplyDTO(int reply_seq, int post_seq, String mem_id, String mem_nickname, String reply_contents,
			String reply_date) {
		this.reply_seq = reply_seq;
		this.post_seq = post_seq;
		this.mem_id = mem_id;
		this.mem_nickname = mem_nickname;
		this.reply_contents = reply_contents;
		this.reply_date = reply_date;
	}
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
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
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getReply_contents() {
		return reply_contents;
	}
	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
}
