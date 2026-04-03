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
}
