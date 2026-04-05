package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.ManageMeetingDTO;
import com.kedu.dto.MeetingMemberDTO;

@Repository
public class MeetingMemberDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	// 신청자 정보 db에 넣기
	public int insert(MeetingMemberDTO dto) throws Exception {
		
		String sql = "insert into meeting_member values(meeting_member_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
		
		return jdbc.update(sql, dto.getMem_id(), dto.getMem_nickname() , dto.getMeet_seq(), dto.getMeetmem_contents(), dto.getMeetmem_status());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<ManageMeetingDTO> selectApplyList(String loginId) {

	    String sql =
	        "select " +
	        " m.meet_seq, " +
	        " m.meet_title, " +
	        " mm.meetmem_seq, " +
	        " mm.mem_id, " +
	        " mm.meetmem_contents, " +
	        " mm.meetmem_status " +
	        "from meeting m " +
	        "join meeting_member mm " +
	        "on m.meet_seq = mm.meet_seq " +
	        "where m.mem_id = ? and mm.meetmem_status = 0";

	    return jdbc.query(sql,new BeanPropertyRowMapper<ManageMeetingDTO>(ManageMeetingDTO.class),loginId);
	}
	
	public int updateStatus(int meetmem_seq, int status) {

	    String sql = "update meeting_member set meetmem_status = ? where meetmem_seq = ?";

	    return jdbc.update(sql, status, meetmem_seq);
	}
}
