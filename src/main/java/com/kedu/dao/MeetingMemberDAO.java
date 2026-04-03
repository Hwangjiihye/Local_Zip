package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.MeetingMemberDTO;

@Repository
public class MeetingMemberDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	// 신청자 정보 db에 넣기
	public int insert(MeetingMemberDTO dto) throws Exception {
		
		String sql = "insert into meeting_member values(meeting_member_seq.nextval, ?, ?, ?, ?, sysdate)";
		
		return jdbc.update(sql, dto.getMem_id(), dto.getMeet_seq(), dto.getMeetmem_contents(), dto.getMeetmem_status());
	}
}
