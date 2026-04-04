package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.ReplyDTO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public int insertReply(int post_seq,String mem_nickname,String reply_contents) {
		String sql = "insert into reply values(reply_seq.nextval,?,?,?,sysdate)";
		return jdbc.update(sql, post_seq, mem_nickname, reply_contents);
	};
	
	public List<ReplyDTO> selectAll() {
		String sql = "select * from reply";
		return jdbc.query(sql, new BeanPropertyRowMapper<ReplyDTO>(ReplyDTO.class));
	}
	
	public int deleteReply(int seq) {
		String sql = "delete from reply where seq = ?";
		return jdbc.update(sql, seq);
	}
	
	public int updateReply(int seq, String contents) {
		String sql = "update reply set contents = ? where seq = ?";
		return jdbc.update(sql, contents, seq);
	}
}
