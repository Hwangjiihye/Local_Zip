package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.FeedBackDTO;

@Repository
public class FeedBackDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	// 건의사항 게시글 db에 넣기
	public int insert(FeedBackDTO dto) throws Exception {
		
		String sql = "insert into suggestion values(suggestion_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
		
		return jdbc.update(sql, dto.getMem_id(), dto.getSuggestion_title(), dto.getSuggestion_contents(),
				dto.getSuggestion_like(), dto.getSuggestion_unlike());
	}

}
