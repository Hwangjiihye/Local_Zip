package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.FeedBackDTO;
import com.kedu.dto.FeedBack_reactionDTO;

@Repository
public class FeedBackDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	// 건의사항 게시글 db에 넣기
	public int insert(FeedBackDTO dto) throws Exception {
		
		String sql = "insert into suggestion values(?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		
		return jdbc.update(sql,dto.getSuggestion_seq() ,dto.getMem_id(), dto.getMem_nickname(), dto.getMem_dong(), dto.getSuggestion_title(), dto.getSuggestion_contents(),
				dto.getSuggestion_like(), dto.getSuggestion_unlike());
	}
	
	//-------------------file--------------------------------
	
	
	public int getNextval() {
		String sql = "SELECT SUGGESTION_seq.NEXTVAL FROM DUAL";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	// 좋아요 db에 넣기
	public int plusLike(int suggestion_seq) {
	    String sql = "update suggestion set suggestion_like = suggestion_like + 1 where suggestion_seq = ?";
	    
	    return jdbc.update(sql, suggestion_seq);
	}
	
	// 싫어요 db에 넣기
	public int plusUnLike(int suggestion_seq) {
		String sql = "update suggestion set suggestion_unlike = suggestion_unlike + 1 where suggestion_seq = ?";
		return jdbc.update(sql, suggestion_seq);
	}
	
	// 좋아요 취소
	public int minusLike(int suggestion_seq) {
		String sql = "update suggestion set suggestion_like = suggestion_like -1 where suggestion_seq = ? and suggestion_like > 0";
		return jdbc.update(sql, suggestion_seq);
	}
	
	// 싫어요 취소
	public int minusUnlike(int suggestion_seq) {
		String sql = "update suggestion set suggestion_unlike = suggestion_unlike -1 where suggestion_seq = ? and suggestion_unlike > 0";
		return jdbc.update(sql, suggestion_seq);
	}
	
	
	// 신고
	public String getWriterBySeq(int suggestion_seq) {
	    String sql = "select mem_id from suggestion where suggestion_seq = ?";
	    return jdbc.queryForObject(sql, String.class, suggestion_seq);
	}
	
	// 게시글 삭제 1 (글 주인 확인용)
	public FeedBackDTO selectBySeq(int suggestion_seq) { 
		String sql = "select * from suggestion where suggestion_seq = ?";
		
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<FeedBackDTO>(FeedBackDTO.class), suggestion_seq);
	}
	
	// 게시글 삭제 2 (진짜 삭제)
	public int delete(int suggestion_seq) {
		String sql = "delete from suggestion where suggestion_seq = ?";
		return jdbc.update(sql, suggestion_seq);
	}
	
	// 게시글 수정 1 (글 목록 불러오기)
	public List<FeedBackDTO> list() {
		String sql = "select * from suggestion order by suggestion_seq desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<FeedBackDTO>(FeedBackDTO.class));
	}	
	
	// 게시글 수정 2 (글 수정)
	public int udpate(FeedBackDTO dto) {
		String sql = "update suggestion set suggestion_title = ? , suggestion_contents = ? where suggestion_seq = ?";
		return jdbc.update(sql, dto.getSuggestion_title(), dto.getSuggestion_contents(), dto.getSuggestion_seq());
	}
	
	// 네비게이션 바
	public int getRecordTotalCount() {
		String sql = "select count(*) from suggestion";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	// 네비게이션 바
	public List<FeedBackDTO> list(String loginId, int start, int end) throws Exception {
		
		String sql = "select * from ("
	            + " select row_number() over(order by s.suggestion_seq desc) rn, "
	            + "s.suggestion_seq, s.mem_id, "
				+ "m.mem_nickname, m.mem_dong, "
				+ "s.suggestion_title, s.suggestion_contents, s.suggestion_writedate, "
				+ "s.suggestion_like, s.suggestion_unlike, r.reaction_type "
				+ "from suggestion s "
				+ "left join members m on s.mem_id = m.mem_id "
				+ "left join suggestion_reaction r "
				+ "on s.suggestion_seq = r.suggestion_seq and r.mem_id = ? "
	            + ") where rn between ? and ?";
		
		return jdbc.query(sql, new BeanPropertyRowMapper<FeedBackDTO>(FeedBackDTO.class), loginId, start, end);
	}
}
