package com.kedu.dto;

public class BlackListDTO {
	
	private int black_seq;
	private String mem_id;
	private String black_option;
	private String start_date;
	private String end_date;
	
	public BlackListDTO() {}
	
	public BlackListDTO(int black_seq, String mem_id, String black_option, String start_date, String end_date) {
		this.black_seq = black_seq;
		this.mem_id = mem_id;
		this.black_option = black_option;
		this.start_date = start_date;
		this.end_date = end_date;
	}
	
	public int getBlack_seq() {
		return black_seq;
	}
	public void setBlack_seq(int black_seq) {
		this.black_seq = black_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBlack_option() {
		return black_option;
	}
	public void setBlack_option(String black_option) {
		this.black_option = black_option;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
}