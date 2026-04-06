package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.MeetingDTO;

@Repository
public class MeetingDAO {
	
	@Autowired
	private JdbcTemplate jdbc;

	// 모임 생성 폼 db에 넣기
	public int insert(MeetingDTO dto) throws Exception {
		
		String sql = "insert into meeting values(meeting_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		
		return jdbc.update(sql, dto.getMem_id(), dto.getMem_nickname() , dto.getMeet_title(), dto.getMeet_category(), dto.getMeet_introcontents(),
				dto.getMeet_detailcontents(), dto.getMeet_maxpeople(), dto.getMeet_currentpeople(), dto.getMem_address1(),
				dto.getMeet_kakaolink(), dto.getMeet_kakaopw(), dto.getMeet_status());
	}
	
	// 모임 생성 폼 조회
	public List<MeetingDTO> selectAll() throws Exception {
		
		String sql = "select meeting.*, (select nvl(count(*), 0) from meeting_member "
				+ "where meeting_member.meet_seq = meeting.meet_seq) as meet_currentpeople "
				+ "from meeting order by meeting.meet_seq desc";
		
		return jdbc.query(sql, new BeanPropertyRowMapper<MeetingDTO>(MeetingDTO.class));
	}
	
	public List<MeetingDTO> selectBySeq(int seq) throws Exception {
		
		String sql = "select * from meeting where meet_seq=?";
		
		return jdbc.query(sql, new BeanPropertyRowMapper<MeetingDTO>(MeetingDTO.class), seq);
	}
	
	public int getAllCount() {
		String sql = "select count(*) from meeting";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public List<MeetingDTO> selectAllByPage(int start, int end) {
		String sql = "select * from (select row_number() over(order by meet_seq desc) rn, "
				+ "meeting.* from meeting) where rn between ? and ?";
		return jdbc.query(sql, new BeanPropertyRowMapper<>(MeetingDTO.class), start, end);
	}
	
	public List<MeetingDTO> selectByPage(String category, int start, int end){
		String sql = "select * from (select row_number() "
				+ "over(order by meet_seq desc) rn, "
				+ "meeting.* from meeting where meet_category =? ) where rn between ? and ? ";
		return jdbc.query(sql, new BeanPropertyRowMapper<MeetingDTO>(MeetingDTO.class), category, start, end);
	}
	
	public int getCategoryCount(String category) {
		String sql = "select count(*) from meeting where meet_category = ?";
		return jdbc.queryForObject(sql, Integer.class, category);
	}
	
	public int countMeetingByWriter(String loginId) {
		String sql = "select count(*) from meeting where mem_id = ?";
		return jdbc.queryForObject(sql, Integer.class, loginId);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 참여중인 모임 리스트 뽑기
	public List<MeetingDTO> selectMyAllMeeting(String loginId) {

	    String sql =
	        "select distinct " +
	        " m.meet_seq, " +
	        " m.mem_id, " +
	        " m.meet_title, " +
	        " m.meet_category, " +
	        " m.meet_introcontents, " +
	        " m.mem_address1, " +
	        " m.meet_maxpeople " +
	        "from meeting m " +
	        "left join meeting_member mm " +
	        "on m.meet_seq = mm.meet_seq " +
	        "where (mm.mem_id = ? and mm.meetmem_status = 1 and m.meet_status in (0,1)) " +
	        "or (m.mem_id = ? and m.meet_status in (0,1))";

	    return jdbc.query(sql,new BeanPropertyRowMapper<MeetingDTO>(MeetingDTO.class),loginId, loginId);
	}
	
	// 참여중인 모임 탭에서 모임 삭제 버튼 클릭 시
	public int deleteMeeting(int meet_seq, int status) {

	    String sql = "update meeting set meet_status = ? where meet_seq = ?";

	    return jdbc.update(sql, status, meet_seq);
	}
}
