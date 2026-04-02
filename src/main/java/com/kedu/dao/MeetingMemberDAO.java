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
		
		String sql = "insert into meeting_member values(meetmem_seq.nextval, ?, meet_seq.nextval, ?, ?, sysdate";
		
		return jdbc.update(sql, Integer.class, dto.getMem_id(), dto.getMeetmem_contents(), dto.getMeetmem_status());
	}
}
