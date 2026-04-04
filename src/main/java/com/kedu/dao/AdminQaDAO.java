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
	
	public int qaAllCount() {
		String sql = "select count(*) from qa";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public int qaCount() {
		String sql = "select count(*) from qa where qa_status = 0";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public int qaDoneCount() {
		String sql = "select count(*) from qa where qa_status = 1";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
//	public List<QaDTO> selectByStatus(int status, int start, int end){
//		String sql = "select * from (select row_number() over(order by qa_create_date "
//				+ "desc as rn, q.* from qa q where qa_status =?) where rn between ? and ?";
//	
//		return jdbc.query(sql, new BeanPropertyRowMapper<QaDTO>(QaDTO.class), start, end);
//	}
	
	public List<QaDTO> selectAll(){
		String sql = "select * from qa order by qa_create_date desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<QaDTO>(QaDTO.class));
	}
	
	public List<QaDTO> selectByStatus(int status){
		String sql = "select * from qa where qa_status = ? order by qa_create_date desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<QaDTO>(QaDTO.class), status);
	}
	
	public int getAllCount() {
		String sql = "select count(*) from qa";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public int getCountByStatus(int status) {
		String sql = "select count(*) from qa where qa_status =?";
		return jdbc.queryForObject(sql, Integer.class, status);
	}
	
	public int activityMemberCount() {
		String sql = "select count(*) from members where mem_status = 0 and mem_role = 1";
		return jdbc.queryForObject(sql, Integer.class);
	}
}
