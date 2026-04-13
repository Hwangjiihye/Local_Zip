package com.kedu.dto;

public class NoticeDTO {
	private int notice_seq;
	private String mem_id;
	private int mem_role;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	
	
	public NoticeDTO() {
		super();
	}
	public NoticeDTO(int notice_seq, String mem_id, int mem_role, String notice_title, String notice_content,
			String notice_date) {
		super();
		this.notice_seq = notice_seq;
		this.mem_id = mem_id;
		this.mem_role = mem_role;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}
	public int getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getMem_role() {
		return mem_role;
	}
	public void setMem_role(int mem_role) {
		this.mem_role = mem_role;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
}