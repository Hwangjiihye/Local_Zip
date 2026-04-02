package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.BoardDTO;

@Repository
public class BoardDAO {

	@Autowired
	private JdbcTemplate jdbc;
	
	
	//db에 게시글 등록
	public int insert(BoardDTO dto, String mem_id) throws Exception{
		String sql = "insert into post values(post_seq.nextval,?,?,?,?,?,?,sysdate)";
		return jdbc.update(sql, dto.getPost_category(), mem_id, dto.getPost_hit(),
				dto.getPost_title(), dto.getPost_contents(), dto.getPost_like());
	}
	
	//db에 생활정보 리스트 출력(최신순)
	public List<BoardDTO> list_lifeInfo() throws Exception{
		String sql = "select * from post where post_category = 'lifeInfo' order by post_seq desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}
	
}
