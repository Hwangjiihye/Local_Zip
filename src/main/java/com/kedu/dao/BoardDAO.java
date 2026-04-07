package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.BoardDTO;
import com.kedu.dto.CategoryVisitDTO;

@Repository
public class BoardDAO {

	@Autowired
	private JdbcTemplate jdbc;
	
	
	//db에 게시글 등록
	public int insert(BoardDTO dto, String mem_id, String mem_nickname, String mem_dong) throws Exception{
		String sql = "insert into post values(post_seq.nextval,?,?,?,?,?,?,?,?,sysdate)";
		return jdbc.update(sql, dto.getPost_category(), mem_id, mem_nickname, mem_dong, 
				dto.getPost_hit(),dto.getPost_title(), dto.getPost_contents(), dto.getPost_like());
	}
	
	// 카테고리 별 최신순, 인기순 정렬 후 > 리스트 출력 메서드 ------------------------------
	
	//홈(=전체) 리스트 출력(최신순)
	public List<BoardDTO> list_home_latest() throws Exception{
		String sql = "select * from post order by post_seq desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}
	
	//홈(=전체) 리스트 출력(인기순)
	public List<BoardDTO> list_home_like() throws Exception{
		String sql = "select * from post order by post_like desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}
	
//	//db에 생활정보 리스트 출력(최신순)
//	public List<BoardDTO> list_lifeInfo() throws Exception{
//		String sql = "select * from post where post_category = 'lifeInfo' order by post_seq desc";
//		return jdbc.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
//	}
	
	//생활정보 리스트 출력(최신순)
	public List<BoardDTO> list_lifeInfo_latest() throws Exception{
		String sql = "select * from post where post_category = 'lifeInfo' order by post_seq desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}
	
	//생활정보 리스트 출력(인기순)
	public List<BoardDTO> list_lifeInfo_like() throws Exception{
		String sql = "select * from post where post_category = 'lifeInfo' order by post_like desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}
	
	//고민/이야기 리스트 출력(최신순)
	public List<BoardDTO> list_concern_latest() throws Exception{
		String sql = "select * from post where post_category = 'talk' order by post_seq desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}
	
	//고민/이야기 리스트 출력(인기순)
	public List<BoardDTO> list_concern_like() throws Exception{
		String sql = "select * from post where post_category = 'talk' order by post_like desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}
	
	// 좋아요 수, 댓글 수 출력하는 메서드----------------------------------------------
	
	// **주의: post_hit 컬럼은 현재 댓글 수를 저장하는 용도로 사용 중
	
	// replyDAO에서 count로 뽑아낸 댓글 수를 board 테이블(post_hit)에 반영
	public int setCommentCount(int count, int post_seq) { 
		String sql = "update post set post_hit = ? where post_seq = ?";
		return jdbc.update(sql, count, post_seq);
	}
		
	// 좋아요 누른 기록 저장용 메서드(총 합계)
	public int updateLikeCount(int count, int post_seq) {
		String sql = "update post set post_like = ? where post_seq = ?";
		return jdbc.update(sql, count, post_seq);
	};
	
	//----------------------------------------------------------------------
	
	//게시글 상세 내용 출력
	public BoardDTO selectByPost_seq(int post_seq) throws Exception{
		String sql = "select * from post where post_seq = ?";
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class),post_seq);
	}
	
	//게시글 삭제
	public int deletePost(int post_seq) {
		String sql = "delete from post where post_seq = ?";
		return jdbc.update(sql, post_seq);
	}
	
	//게시글 수정
	public int updatePost(int post_seq, String post_title, String post_contents) {
		String sql = "update post set post_title = ?, post_contents = ? where post_seq = ?";
		return jdbc.update(sql, post_title, post_contents, post_seq);
	}
	
	public List<CategoryVisitDTO> getCategoryCount(){
		String sql = "select p.post_category as postCategory, "
				+ "p.post_count as count, "
				+ "nvl(v.visit_count, 0) as visitCount "
				+ "from ( "
				+ "select post_category, count(*) as post_count "
				+ "from post "
				+ "group by post_category "
				+ ") p "
				+ "left join ( "
				+ "select post_category, count(distinct mem_id) as visit_count "
				+ "from visit_log "
				+ "where post_category <> 'LOGIN' "
				+ "group by post_category "
				+ ") v "
				+ "on p.post_category = v.post_category";
		
		return jdbc.query(sql, new BeanPropertyRowMapper<CategoryVisitDTO>(CategoryVisitDTO.class));
	}
	
	public String getCategoryBySeq(int seq) {
		String sql = "select post_category from post where post_seq = ?";
		return jdbc.queryForObject(sql, String.class, seq);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int getNextval() {
		String sql = "SELECT POST_SEQ.NEXTVAL FROM DUAL";
		return jdbc.queryForObject(sql, Integer.class);
	}
}
