package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.SafetyFacilityDTO;

@Repository
public class SafetyFacilityDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public int insert(SafetyFacilityDTO dto) {
		String sql = "insert into safety_facility values(safety_facility_seq.nextval,?,?,?,?,?,?,?,sysdate)";
	
		return jdbc.update(sql, dto.getFac_type(), dto.getFac_name(), dto.getFac_address(), dto.getFac_numaddress()
				,dto.getFac_gu(), dto.getFac_lat(), dto.getFac_lng());
	}
	
	public int deleteByType(String facType) {
		String sql = "delete from safety_facility where fac_type = ?";
		
		return jdbc.update(sql, facType);
	}
}
