package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.commons.EncryptionUtils;
import com.kedu.dto.MembersDTO;

@Repository
public class MembersDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	// 회원가입
	public int insert(MembersDTO dto) {
		String sql = "insert into members values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?)";
		return jdbc.update(sql, dto.getMem_id(),EncryptionUtils.getSha512(dto.getMem_password()),dto.getMem_nickname(),
				dto.getMem_name(), dto.getMem_ssn(), dto.getMem_gender(), dto.getMem_phone(), dto.getMem_email(),
				dto.getMem_zip_code(), dto.getMem_address1(), dto.getMem_address2(), 1, 0);
	}
	
	// 아이디 중복체크
	public int duplCheck(String mem_id) {
		String sql = "select count(*) from members where mem_id = ?";
		return jdbc.queryForObject(sql, Integer.class, mem_id);
	}
	
	// 회원 정보 모두 출력
	public MembersDTO selectAll(String mem_id) {
		String sql = "select * from members where mem_id = ?";
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<MembersDTO>(MembersDTO.class),mem_id);
	}
}
