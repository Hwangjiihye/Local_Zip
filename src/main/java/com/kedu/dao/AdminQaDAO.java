package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminQaDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	@Autowired
	private UserQaDAO udao;
}
