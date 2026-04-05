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
		
		String sql = "insert into meeting values(meeting_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		
		return jdbc.update(sql, dto.getMem_id(), dto.getMeet_title(), dto.getMeet_category(), dto.getMeet_introcontents(),
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
