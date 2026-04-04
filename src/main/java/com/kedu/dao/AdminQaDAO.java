package com.kedu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.QaDTO;

@Repository
public class AdminQaDAO {
	
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public List<QaDTO> selectById() {
		String sql = "select * from qa order by qa_create_date";
		return jdbc.query(sql, new BeanPropertyRowMapper<QaDTO>(QaDTO.class));
	}
	
	public int updateReply(QaDTO dto, int seq) { // 댓글 작성 로직
		String sql = "update qa set admin_answer =?, admin_answer_date = sysdate, qa_status = 1, mem_admin_id=? where qa_seq =?";
		return jdbc.update(sql, dto.getAdmin_answer(), dto.getMem_admin_id(), seq);
	}
	
	public int answerResetBySeq(int qa_seq) {
		String sql = "update qa set admin_answer = null, qa_status = 0 where qa_seq = ? ";
		return jdbc.update(sql, qa_seq);
	}
	
	public int answerUpdateBySeq(String admin_answer, int qa_seq) {
		String sql = "update qa set admin_answer =? , admin_answer_date = sysdate where qa_seq = ?";
		return jdbc.update(sql, admin_answer, qa_seq);
	}
	
	public int qaAllCount() {
		String sql = "select count(*) from qa";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public int qaCount() {
		String sql = "select count(*) from qa where qa_status = 0";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public int qaDoneCount() {
		String sql = "select count(*) from qa where qa_status = 1";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public List<QaDTO> selectAll(){
		String sql = "select * from qa order by qa_create_date desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<QaDTO>(QaDTO.class));
	}
	
	public List<QaDTO> selectByStatus(int status){
		String sql = "select * from qa where qa_status = ? order by qa_create_date";
		return jdbc.query(sql, new BeanPropertyRowMapper<QaDTO>(QaDTO.class), status);
	}
	
	public int getAllCount() {
		String sql = "select count(*) from qa";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public int getCountByStatus(int status) {
		String sql = "select count(*) from qa where qa_status =?";
		return jdbc.queryForObject(sql, Integer.class, status);
	}
	
	public int activityMemberCount() {
		String sql = "select count(*) from members where mem_status = 0 and mem_role = 1";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public List<QaDTO> selectAllByPage(int cpage){
		int recordCountPerPage = 10;

		int start = cpage * recordCountPerPage - (recordCountPerPage - 1);
		int end = cpage * recordCountPerPage;

		String sql = "select * from ("
				+ "    select row_number() over(order by qa_seq desc) rnum, q.* "
				+ "    from qa q"
				+ ") where rnum between ? and ?";

		return jdbc.query(sql, new BeanPropertyRowMapper<>(QaDTO.class), start, end);
	}
	
	public List<QaDTO> selectByStatusByPage(int status, int cpage){
		int recordCountPerPage = 10;

		int start = cpage * recordCountPerPage - (recordCountPerPage - 1);
		int end = cpage * recordCountPerPage;

		String sql = "select * from ("
				+ "    select row_number() over(order by qa_seq desc) rnum, q.* "
				+ "    from qa q where qa_status = ?"
				+ ") where rnum between ? and ?";

		return jdbc.query(sql, new BeanPropertyRowMapper<>(QaDTO.class), status, start, end);
	}
	
	public Map<String, Object> getPageNaviAll(int cpage){

		int recordCountPerPage = 10;
		int naviCountPerPage = 10;

		int recordTotalCount = getAllCount();
		int pageTotalCount = 0;

		if(recordTotalCount % recordCountPerPage > 0){
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(cpage < 1) cpage = 1;
		if(cpage > pageTotalCount) cpage = pageTotalCount;

		int startNavi = ((cpage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);

		if(endNavi > pageTotalCount){
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1){
			needPrev = false;
		}
		if(endNavi == pageTotalCount){
			needNext = false;
		}

		Map<String, Object> map = new HashMap<>();
		map.put("cpage", cpage);
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);

		return map;
	}
	
	public Map<String, Object> getPageNaviByStatus(int status, int cpage){

		int recordCountPerPage = 10;
		int naviCountPerPage = 10;

		int recordTotalCount = getCountByStatus(status);
		int pageTotalCount = 0;

		if(recordTotalCount % recordCountPerPage > 0){
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(cpage < 1) cpage = 1;
		if(cpage > pageTotalCount) cpage = pageTotalCount;

		int startNavi = ((cpage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);

		if(endNavi > pageTotalCount){
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1){
			needPrev = false;
		}
		if(endNavi == pageTotalCount){
			needNext = false;
		}

		Map<String, Object> map = new HashMap<>();
		map.put("cpage", cpage);
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);

		return map;
	}
}
