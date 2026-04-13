package com.kedu.dto;

public class AttachmentDTO {
	private int attach_seq;
	private String parent_type;
	private int parent_seq;
	private String attach_oriname;
	private String attach_sysname;
	
	
	public AttachmentDTO() {
		super();
	}
	public AttachmentDTO(int attach_seq, String parent_type, int parent_seq, String attach_oriname,
			String attach_sysname) {
		super();
		this.attach_seq = attach_seq;
		this.parent_type = parent_type;
		this.parent_seq = parent_seq;
		this.attach_oriname = attach_oriname;
		this.attach_sysname = attach_sysname;
	}
	public int getAttach_seq() {
		return attach_seq;
	}
	public void setAttach_seq(int attach_seq) {
		this.attach_seq = attach_seq;
	}
	public String getParent_type() {
		return parent_type;
	}
	public void setParent_type(String parent_type) {
		this.parent_type = parent_type;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	public String getAttach_oriname() {
		return attach_oriname;
	}
	public void setAttach_oriname(String attach_oriname) {
		this.attach_oriname = attach_oriname;
	}
	public String getAttach_sysname() {
		return attach_sysname;
	}
	public void setAttach_sysname(String attach_sysname) {
		this.attach_sysname = attach_sysname;
	}
}