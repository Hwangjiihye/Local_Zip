package com.kedu.dto;

public class QaDTO {
	private int qa_seq;
	private String mem_id;
	private String qa_title;
	private String qa_contents;
	private int qa_category;
	private String qa_create_date;
	private int qa_status;
	private String mem_admin_id;
	private String admin_answer;
	private String admin_answer_date;
	
	public QaDTO() {}
	
	public QaDTO(int qa_seq, String mem_id, String qa_title, String qa_contents, int qa_category, String qa_create_date,
			int qa_status, String mem_admin_id, String admin_answer, String admin_answer_date) {
		this.qa_seq = qa_seq;
		this.mem_id = mem_id;
		this.qa_title = qa_title;
		this.qa_contents = qa_contents;
		this.qa_category = qa_category;
		this.qa_create_date = qa_create_date;
		this.qa_status = qa_status;
		this.mem_admin_id = mem_admin_id;
		this.admin_answer = admin_answer;
		this.admin_answer_date = admin_answer_date;
	}
	
	public int getQa_seq() {
		return qa_seq;
	}
	public void setQa_seq(int qa_seq) {
		this.qa_seq = qa_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getQa_contents() {
		return qa_contents;
	}
	public void setQa_contents(String qa_contents) {
		this.qa_contents = qa_contents;
	}
	public int getQa_category() {
		return qa_category;
	}
	public void setQa_category(int qa_category) {
		this.qa_category = qa_category;
	}
	public String getQa_create_date() {
		return qa_create_date;
	}
	public void setQa_create_date(String qa_create_date) {
		this.qa_create_date = qa_create_date;
	}
	public int getQa_status() {
		return qa_status;
	}
	public void setQa_status(int qa_status) {
		this.qa_status = qa_status;
	}
	public String getMem_admin_id() {
		return mem_admin_id;
	}
	public void setMem_admin_id(String mem_admin_id) {
		this.mem_admin_id = mem_admin_id;
	}
	public String getAdmin_answer() {
		return admin_answer;
	}
	public void setAdmin_answer(String admin_answer) {
		this.admin_answer = admin_answer;
	}
	public String getAdmin_answer_date() {
		return admin_answer_date;
	}
	public void setAdmin_answer_date(String admin_answer_date) {
		this.admin_answer_date = admin_answer_date;
	}
}