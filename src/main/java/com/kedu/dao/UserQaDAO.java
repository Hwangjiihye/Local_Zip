package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.QaDTO;

@Repository
public class UserQaDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	@Autowired
	private AdminQaDAO adao;
	
	public void insert(QaDTO dto) {
		String sql = "insert into qa values(qa_seq.nextval,?,?,?,?,sysdate,?)";
		jdbc.update(sql,dto.getMem_id(),dto.getQa_title(),dto.getQa_contents(),dto.getQa_category(),dto.getQa_status());
	}
}
