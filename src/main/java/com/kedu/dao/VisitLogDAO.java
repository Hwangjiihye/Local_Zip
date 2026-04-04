package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class VisitLogDAO {

	@Autowired
	private JdbcTemplate jdbc;
	
	
	public int existsToday(String mem_id) { // 방문 이력 확인 select
		String sql = "select count(*) from visit_log where mem_id =?";
		return jdbc.queryForObject(sql, Integer.class, mem_id);
	}
	
	public int insertTodayVisit(String mem_id) { // 방문자 통계를 위한 insert
		String sql = "insert into visit_log(visit_seq, mem_id, post_category,"
				+ "mem_gender, mem_ssn, visit_date)"
				+ "select visit_log_seq.nextval, mem_id, 'login', mem_gender, mem_ssn, sysdate "
				+ "from members where mem_id=?";
		return jdbc.update(sql, mem_id);
	}
	
	public int getTodayVisitCount() { // 방문 수 id당 1번만 계산
		String sql = "select count(distinct mem_id) from visit_log where trunc(visit_date) = trunc(sysdate)";
        return jdbc.queryForObject(sql, Integer.class);
	}
}