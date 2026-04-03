package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.QaDTO;

@Repository
public class AdminQaDAO {
	
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public List<QaDTO> selectById() {
		String sql = "select * from qa order by qa_create_date";
		return jdbc.query(sql, new BeanPropertyRowMapper<QaDTO>(QaDTO.class));
	}
	
	public int updateReply(QaDTO dto, int seq) {
		String sql = "update qa set admin_answer =?, admin_answer_date = sysdate, qa_status = 1, mem_admin_id=? where qa_seq =?";
		return jdbc.update(sql, dto.getAdmin_answer(), dto.getMem_admin_id(), seq);
	}
	
	public int qaCount() {
		String sql = "select count(*) from qa where qa_status = 0";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public int activityMemberCount() {
		String sql = "select count(*) from members where mem_status = 0 and mem_role = 1";
		return jdbc.queryForObject(sql, Integer.class);
	}
}
