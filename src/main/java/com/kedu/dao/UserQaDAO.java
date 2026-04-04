package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.QaDTO;

@Repository
public class UserQaDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	@Autowired
	private AdminQaDAO adao;
	
	//db에 저장
	public void insert(QaDTO dto) {
		String sql = "insert into qa (qa_seq, mem_id, qa_title, qa_contents, qa_category, qa_create_date, qa_status) " +
	             "values (qa_seq.nextval, ?, ?, ?, ?, sysdate, ?)";
		jdbc.update(sql,dto.getMem_id(),dto.getQa_title(),dto.getQa_contents(),dto.getQa_category(),dto.getQa_status());
	}
	
	// qa게시글 리스트 뽑기
	public List<QaDTO> getPostList(){
		String sql = "select * from qa order by qa_create_date desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<QaDTO>(QaDTO.class));
	}
}
