package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.MeetingDTO;

@Repository
public class MeetingDAO {
	
	@Autowired
	private JdbcTemplate jdbc;

	// 모임 추가하기
	public int insert(MeetingDTO dto) throws Exception {
		
		String sql = "insert into meeting values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		
		return jdbc.update(sql, dto.getMeet_seq(), dto.getMem_id(), dto.getMeet_title(), dto.getMeet_category(), dto.getMeet_introcontents(),
				dto.getMeet_detailcontents(), dto.getMeet_maxpeople(), dto.getMeet_currentpeople(), dto.getMem_address1(),
				dto.getMeet_kakaolink(), dto.getMeet_kakaopw(), dto.getMeet_status());
	}
}
