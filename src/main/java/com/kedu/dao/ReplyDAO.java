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
	
	public int insertReply(int post_seq,String mem_id,String mem_nickname,String reply_contents) {
		String sql = "insert into reply values(reply_seq.nextval,?,?,?,?,sysdate)";
		return jdbc.update(sql, post_seq, mem_id, mem_nickname, reply_contents);
	};
	
	public List<ReplyDTO> selectByPostSeq(int post_seq) {
		String sql = "select * from reply where post_seq = ? order by reply_seq desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<ReplyDTO>(ReplyDTO.class), post_seq);
	}
	
	public int deleteReply(int reply_seq) {
		String sql = "delete from reply where reply_seq = ?";
		return jdbc.update(sql, reply_seq);
	}
	
	public int updateReply(int reply_seq, String reply_contents) {
		String sql = "update reply set reply_contents = ? where reply_seq = ?";
		return jdbc.update(sql, reply_contents, reply_seq);
	}
	
	// 댓글 수 출력하는 메서드 - post_seq를 기준으로, 해당게시글에 달린 댓글 수 조회
	public int commentCount(int post_seq) {
		String sql = "select count(*) from reply where post_seq = ?";
		return jdbc.queryForObject(sql, Integer.class, post_seq);
	};
	
	// 좋아요 눌렀을 때 +1 반영하기 위한 좋아요 누른 기록 저장용 메서드
	public int insertLike(int post_seq, String mem_id) {
		String sql = "insert into post_like values(like_seq.nextval,?,?,sysdate)";
		return jdbc.update(sql, post_seq, mem_id);
	};
	
	// 좋아요 버튼을 다시 눌러서 취소했을 때, 취소된 기록을 보여주기 위한 메서드
	public int deleteLike() {
		String sql = "";
		return jdbc.update(sql);
	};
	
}
