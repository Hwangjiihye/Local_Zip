package com.kedu.dto;

public class MeetingDTO {
	
	private int meet_seq;
	private String mem_id;
	private String mem_nickname;
	private String meet_title;
	private String meet_category;
	private String meet_introcontents;
	private String meet_detailcontents;
	private int meet_maxpeople;
	private int meet_currentpeople;
	private String mem_address1;
	private String meet_kakaolink;
	private String meet_kakaopw;
	private int meet_status;
	private String meet_date;
	
	public MeetingDTO() {}
	public MeetingDTO(int meet_seq, String mem_id, String mem_nickname, String meet_title, String meet_category,
			String meet_introcontents, String meet_detailcontents, int meet_maxpeople, int meet_currentpeople,
			String mem_address1, String meet_kakaolink, String meet_kakaopw, int meet_status, String meet_date) {
		super();
		this.meet_seq = meet_seq;
		this.mem_id = mem_id;
		this.mem_nickname = mem_nickname;
		this.meet_title = meet_title;
		this.meet_category = meet_category;
		this.meet_introcontents = meet_introcontents;
		this.meet_detailcontents = meet_detailcontents;
		this.meet_maxpeople = meet_maxpeople;
		this.meet_currentpeople = meet_currentpeople;
		this.mem_address1 = mem_address1;
		this.meet_kakaolink = meet_kakaolink;
		this.meet_kakaopw = meet_kakaopw;
		this.meet_status = meet_status;
		this.meet_date = meet_date;
	}
	public int getMeet_seq() {
		return meet_seq;
	}
	public void setMeet_seq(int meet_seq) {
		this.meet_seq = meet_seq;
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
	public String getMeet_title() {
		return meet_title;
	}
	public void setMeet_title(String meet_title) {
		this.meet_title = meet_title;
	}
	public String getMeet_category() {
		return meet_category;
	}
	public void setMeet_category(String meet_category) {
		this.meet_category = meet_category;
	}
	public String getMeet_introcontents() {
		return meet_introcontents;
	}
	public void setMeet_introcontents(String meet_introcontents) {
		this.meet_introcontents = meet_introcontents;
	}
	public String getMeet_detailcontents() {
		return meet_detailcontents;
	}
	public void setMeet_detailcontents(String meet_detailcontents) {
		this.meet_detailcontents = meet_detailcontents;
	}
	public int getMeet_maxpeople() {
		return meet_maxpeople;
	}
	public void setMeet_maxpeople(int meet_maxpeople) {
		this.meet_maxpeople = meet_maxpeople;
	}
	public int getMeet_currentpeople() {
		return meet_currentpeople;
	}
	public void setMeet_currentpeople(int meet_currentpeople) {
		this.meet_currentpeople = meet_currentpeople;
	}
	public String getMem_address1() {
		return mem_address1;
	}
	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}
	public String getMeet_kakaolink() {
		return meet_kakaolink;
	}
	public void setMeet_kakaolink(String meet_kakaolink) {
		this.meet_kakaolink = meet_kakaolink;
	}
	public String getMeet_kakaopw() {
		return meet_kakaopw;
	}
	public void setMeet_kakaopw(String meet_kakaopw) {
		this.meet_kakaopw = meet_kakaopw;
	}
	public int getMeet_status() {
		return meet_status;
	}
	public void setMeet_status(int meet_status) {
		this.meet_status = meet_status;
	}
	public String getMeet_date() {
		return meet_date;
	}
	public void setMeet_date(String meet_date) {
		this.meet_date = meet_date;
	}
	
	
}
