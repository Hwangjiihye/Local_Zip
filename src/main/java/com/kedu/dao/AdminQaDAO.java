package com.kedu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.QaDTO;
import com.kedu.dto.ReportDTO;

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
	
	public List<ReportDTO> selectReportAll(){ // 신고 목록 출력 메서드
		String sql = "select * from reports";
		return jdbc.query(sql, new BeanPropertyRowMapper<ReportDTO>(ReportDTO.class));
	}
	
	public List<ReportDTO> selectReportContents(){ // 신고된 대상(게시글/댓글/목록) + 내용 출력 메서드 (전체)
		String sql = "select r.mem_id, r.target_id, r.reports_date, r.reports_type, r.reports_reason, r.target_seq, "
				+ "coalesce(p.post_contents, reply.reply_contents, m.meet_introcontents, '삭제되었거나 찾을 수 없는 내용(번호:' || r.target_seq || ')') as target_content, "
				+ "case "
				+ "when r.reports_type = 0 then '게시글' when r.reports_type = 1 then '댓글' else '모임' end as target_type_name "
				+ "from reports r "
				+ "left join post p on r.target_seq = p.post_seq and r.reports_type = 0 "
				+ "left join reply on r.target_seq = reply.reply_seq and r.reports_type = 1 "
				+ "left join meeting m on r.target_seq = m.meet_seq and r.reports_type = 2 "
				+ "order by r.reports_date desc ";
		return jdbc.query(sql, new BeanPropertyRowMapper<ReportDTO>(ReportDTO.class));
	}
	
	public List<ReportDTO> selectReportContentsByStatus(int status){ // 신고된 대상(게시글/댓글/목록) + 내용 출력 메서드 (미처리건들 출력)
		String sql = "select r.mem_id, r.target_id, r.reports_date, r.reports_type, r.reports_reason, r.target_seq, "
				+ "coalesce(p.post_contents, reply.reply_contents, m.meet_introcontents, '삭제되었거나 찾을 수 없는 내용(번호:' || r.target_seq || ')') as target_content, "
				+ "case "
				+ "when r.reports_type = 0 then '게시글' when r.reports_type = 1 then '댓글' else '모임' end as target_type_name "
				+ "from reports r "
				+ "left join post p on r.target_seq = p.post_seq and r.reports_type = 0 "
				+ "left join reply on r.target_seq = reply.reply_seq and r.reports_type = 1 "
				+ "left join meeting m on r.target_seq = m.meet_seq and r.reports_type = 2 "
				+ "where r.reports_type = ? "
				+ "order by r.reports_date desc ";
		return jdbc.query(sql, new BeanPropertyRowMapper<ReportDTO>(ReportDTO.class),status);
	}
	
	public List<ReportDTO> selectReportContentsByStatusHandle(int status){ // 신고된 대상(게시글/댓글/목록) + 내용 출력 메서드 (처리완료건들 출력)
		String sql = "select r.mem_id, r.target_id, r.reports_date, r.reports_type, r.reports_reason, r.target_seq, "
				+ "coalesce(p.post_contents, reply.reply_contents, m.meet_introcontents, '삭제되었거나 찾을 수 없는 내용(번호:' || r.target_seq || ')') as target_content, "
				+ "case "
				+ "when r.reports_type = 0 then '게시글' when r.reports_type = 1 then '댓글' else '모임' end as target_type_name "
				+ "from reports r "
				+ "left join post p on r.target_seq = p.post_seq and r.reports_type = 0 "
				+ "left join reply on r.target_seq = reply.reply_seq and r.reports_type = 1 "
				+ "left join meeting m on r.target_seq = m.meet_seq and r.reports_type = 2 "
				+ "where r.reports_type = ? "
				+ "order by r.reports_date desc ";
		return jdbc.query(sql, new BeanPropertyRowMapper<ReportDTO>(ReportDTO.class),status);
	}
	
	public int updateMemberStatus(int mem_status, String target_id) { // 블랙리스트 등록 (membersTable status 업데이트) 로직
		String sql = "update members set mem_status =? where mem_id =? ";
		return jdbc.update(sql, mem_status, target_id);
	}
	
	public int insertBlcakList(String targer_id, String black_option, int day) { // 블랙리스트 정지시작/종료일수 (blackList Table status 업데이트) 로직
		String sql = "insert into blackList (black_seq, mem_id, black_option, start_date, end_date) "
				+ "values(blackList_seq.nextval, ? , ? , sysdate, sysdate + ?)";
		return jdbc.update(sql, targer_id, black_option, day);
	}
	
	public int updateReportStatus(int reports_type, String targer_id, int target_seq) { // 블랙리스트 등록 시 reports 테이블 타입 업데이트
		String sql = "update reports set reports_type =? where target_id =? and target_seq = ?";
		return jdbc.update(sql, reports_type, targer_id, target_seq);
	}
	
	public int deleteMembersStatus(int mem_status, String target_id) { // 블랙리스트 해제 (membersTable status 업데이트) 로직
		String sql = "update members set mem_status = ? where mem_id =? ";
		return jdbc.update(sql, mem_status, target_id);
	}
	
	public int deleteBlackList(String target_id) { // 블랙리스트 정지시작/종료일수 비우기 (blackList Table) 로직
		String sql = "delete from blackList where mem_id = ? ";
		return jdbc.update(sql, target_id);
	}
}
