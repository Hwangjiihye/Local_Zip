package com.kedu.dto;

public class SafetyFacilityDTO {
	
	private int fac_seq;
	private String fac_type;
	private String fac_name;
	private String fac_address;
	private String fac_numaddress;
	private String fac_gu;
	private double fac_lat;
	private double fac_lng;
	private String fac_regdate;
	
	public SafetyFacilityDTO() {}
	
	public SafetyFacilityDTO(int fac_seq, String fac_type, String fac_name, String fac_address, String fac_numaddress,
			String fac_gu, double fac_lat, double fac_lng, String fac_regdate) {
		this.fac_seq = fac_seq;
		this.fac_type = fac_type;
		this.fac_name = fac_name;
		this.fac_address = fac_address;
		this.fac_numaddress = fac_numaddress;
		this.fac_gu = fac_gu;
		this.fac_lat = fac_lat;
		this.fac_lng = fac_lng;
		this.fac_regdate = fac_regdate;
	}
	public int getFac_seq() {
		return fac_seq;
	}
	public void setFac_seq(int fac_seq) {
		this.fac_seq = fac_seq;
	}
	public String getFac_type() {
		return fac_type;
	}
	public void setFac_type(String fac_type) {
		this.fac_type = fac_type;
	}
	public String getFac_name() {
		return fac_name;
	}
	public void setFac_name(String fac_name) {
		this.fac_name = fac_name;
	}
	public String getFac_address() {
		return fac_address;
	}
	public void setFac_address(String fac_address) {
		this.fac_address = fac_address;
	}
	public String getFac_numaddress() {
		return fac_numaddress;
	}
	public void setFac_numaddress(String fac_numaddress) {
		this.fac_numaddress = fac_numaddress;
	}
	public String getFac_gu() {
		return fac_gu;
	}
	public void setFac_gu(String fac_gu) {
		this.fac_gu = fac_gu;
	}
	public double getFac_lat() {
		return fac_lat;
	}
	public void setFac_lat(double fac_lat) {
		this.fac_lat = fac_lat;
	}
	public double getFac_lng() {
		return fac_lng;
	}
	public void setFac_lng(double fac_lng) {
		this.fac_lng = fac_lng;
	}
	public String getFac_regdate() {
		return fac_regdate;
	}
	public void setFac_regdate(String fac_regdate) {
		this.fac_regdate = fac_regdate;
	}
}