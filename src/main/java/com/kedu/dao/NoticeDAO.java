package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.NoticeDTO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	
	//----------------관리자 영역-----------------------
	//DB에 공지사항 글 작성
	public void insertNotice(NoticeDTO dto) {
		String sql = "INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL,?,?,?,?,sysdate)";
		jdbc.update(sql,dto.getMem_id(),dto.getMem_role(),dto.getNotice_title(),dto.getNotice_content());
	}
	
}
