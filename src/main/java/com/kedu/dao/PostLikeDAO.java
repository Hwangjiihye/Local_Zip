package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class PostLikeDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	// 좋아요 여부 확인용 메서드
	// return 값이 1이면 count상승 취소 / 0이면 삽입 실행
	public int likeCheck(int post_seq, String mem_id) {
		String sql = "select count(*) from post_like where post_seq = ? and mem_id = ?";
		return jdbc.queryForObject(sql, Integer.class, post_seq, mem_id);
	};
	
	// 좋아요 수 출력 메서드
	public int likeCount(int post_seq) {
		String sql = "select count(*) from post_like where post_seq = ?";
		return jdbc.queryForObject(sql, Integer.class, post_seq);
	};

}
