package com.kedu.dto;

public class ManageMeetingDTO {
	private int meet_seq;
	private String meet_title;
	private int meetmem_seq;
	private String mem_id;
	private String mem_nickname;
	private String meetmem_contents;
	private int meetmem_status;
	public int getMeet_seq() {
		return meet_seq;
	}
	public void setMeet_seq(int meet_seq) {
		this.meet_seq = meet_seq;
	}
	public String getMeet_title() {
		return meet_title;
	}
	public void setMeet_title(String meet_title) {
		this.meet_title = meet_title;
	}
	public int getMeetmem_seq() {
		return meetmem_seq;
	}
	public void setMeetmem_seq(int meetmem_seq) {
		this.meetmem_seq = meetmem_seq;
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
	public String getMeetmem_contents() {
		return meetmem_contents;
	}
	public void setMeetmem_contents(String meetmem_contents) {
		this.meetmem_contents = meetmem_contents;
	}
	public int getMeetmem_status() {
		return meetmem_status;
	}
	public void setMeetmem_status(int meetmem_status) {
		this.meetmem_status = meetmem_status;
	}
	
	
	
	
    
}
