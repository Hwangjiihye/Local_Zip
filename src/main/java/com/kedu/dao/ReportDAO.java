package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.ReportDTO;

@Repository
public class ReportDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public int reportInsert(ReportDTO dto) {
		String sql = "insert into reports values(reports_seq.nextval,?,?,?,sysdate,?,?)";
		return jdbc.update(
				sql, dto.getMem_id(),
				dto.getTarget_id(), dto.getTarget_seq(),
				dto.getReports_type(), dto.getReports_reason());
	}
	
	public int isReport(String mem_id, int target_seq, int reports_type) {
		String sql = "select count(*) from reports where mem_id = ? "
				+ "and target_seq = ? "
				+ "and reports_type =? ";
		return jdbc.queryForObject(sql, Integer.class, mem_id, target_seq, reports_type);
	}
}
