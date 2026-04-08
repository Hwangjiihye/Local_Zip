package com.kedu.dto;

public class ReportDTO {
	
	private int reports_seq;
	private String mem_id;
	private String target_id;
	private int target_seq;
	private String reports_date;
	private int reports_type;
	private String reports_reason;
	private String target_content;
	private String target_type_name;
	private int reports_status;
	
	public ReportDTO() {}
	
	public ReportDTO(int reports_seq, String mem_id, String target_id, int target_seq, String reports_date,
			int reports_type, String reports_reason, int reports_status) {
		this.reports_seq = reports_seq;
		this.mem_id = mem_id;
		this.target_id = target_id;
		this.target_seq = target_seq;
		this.reports_date = reports_date;
		this.reports_type = reports_type;
		this.reports_reason = reports_reason;
		this.reports_status = reports_status;
	}
	
	public int getReports_seq() {
		return reports_seq;
	}
	public void setReports_seq(int reports_seq) {
		this.reports_seq = reports_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getTarget_id() {
		return target_id;
	}
	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}
	public int getTarget_seq() {
		return target_seq;
	}
	public void setTarget_seq(int target_seq) {
		this.target_seq = target_seq;
	}
	public String getReports_date() {
		return reports_date;
	}
	public void setReports_date(String reports_date) {
		this.reports_date = reports_date;
	}
	public int getReports_type() {
		return reports_type;
	}
	public void setReports_type(int reports_type) {
		this.reports_type = reports_type;
	}
	public String getReports_reason() {
		return reports_reason;
	}
	public void setReports_reason(String reports_reason) {
		this.reports_reason = reports_reason;
	}
	public String getTarget_content() {
		return target_content;
	}
	public void setTarget_content(String target_content) {
		this.target_content = target_content;
	}
	public String getTarget_type_name() {
		return target_type_name;
	}
	public void setTarget_type_name(String target_type_name) {
		this.target_type_name = target_type_name;
	}
	public int getReports_status() {
		return reports_status;
	}
	public void setReports_status(int reports_status) {
		this.reports_status = reports_status;
	}
}