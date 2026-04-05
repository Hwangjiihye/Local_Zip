package com.kedu.dto;


public class VisitLogDTO {
	private int visit_seq;
	private String mem_id;
	private String post_category;
	private int mem_gender;
	private String mem_ssn;
	private String visit_date;
	
	public VisitLogDTO() {}
	
	public VisitLogDTO(int visit_seq, String mem_id, String post_category, int mem_gender, String mem_ssn,
			String visit_date) {
		this.visit_seq = visit_seq;
		this.mem_id = mem_id;
		this.post_category = post_category;
		this.mem_gender = mem_gender;
		this.mem_ssn = mem_ssn;
		this.visit_date = visit_date;
	}
	
	public int getVisit_seq() {
		return visit_seq;
	}
	public void setVisit_seq(int visit_seq) {
		this.visit_seq = visit_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPost_category() {
		return post_category;
	}
	public void setPost_category(String post_category) {
		this.post_category = post_category;
	}
	public int getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(int mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_ssn() {
		return mem_ssn;
	}
	public void setMem_ssn(String mem_ssn) {
		this.mem_ssn = mem_ssn;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
}