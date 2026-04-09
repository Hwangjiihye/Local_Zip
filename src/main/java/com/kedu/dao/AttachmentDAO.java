package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.AttachmentDTO;

@Repository
public class AttachmentDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	//file db에 저장
	public int insert(AttachmentDTO dto) {
		String sql = "INSERT INTO ATTACHMENT VALUES(ATTACHMENT_SEQ.NEXTVAL,?,?,?,?)";
		return jdbc.update(sql,dto.getParent_type(),dto.getParent_seq(),dto.getAttach_oriname(),dto.getAttach_sysname());
	}
	
	//list 받기
	public List<AttachmentDTO> getAttachment(int seq){
		String sql = "SELECT * FROM ATTACHMENT WHERE PARENT_SEQ=?";
		return jdbc.query(sql, new BeanPropertyRowMapper<AttachmentDTO>(AttachmentDTO.class),seq);
	}
}
