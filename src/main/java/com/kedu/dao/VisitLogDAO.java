package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.DailyVisitDTO;
import com.kedu.dto.GenderVisitDTO;

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
	
	public int getTodayVisitCount() { // 일별방문자수 id당 1번만 계산
		String sql = "select count(distinct mem_id) from visit_log where trunc(visit_date) = trunc(sysdate)";
        return jdbc.queryForObject(sql, Integer.class);
	}
	
	public List<DailyVisitDTO> getDailyVisitCount(){
		String sql = "select d.day as day,"
				+ "nvl(v.total_count, 0) as totalCount,"
				+ "nvl(m.new_count, 0) as newCount "
				+ "from (select lpad(level, 2, '0') as day "
				+ "from dual connect by level <= 31) d "
				+ "left join ( select to_char(visit_date, 'DD') as day,"
				+ "count(distinct mem_id) as total_count "
				+ "from visit_log "
				+ "where to_char(visit_date, 'YYYY-MM') = to_char(sysdate, 'YYYY-MM') "
				+ "group by to_char(visit_date, 'DD') "
				+ ") v on d.day = v.day "
				+ "left join ( select to_char(mem_join_date, 'DD') as day,"
				+ "count(*) as new_count "
				+ "from members "
				+ "where to_char(mem_join_date, 'YYYY-MM') = to_char(sysdate, 'YYYY-MM') "
				+ "group by to_char(mem_join_date, 'DD') "
				+ ") m on d.day = m.day order by d.day";
		
		return jdbc.query(sql, new BeanPropertyRowMapper<DailyVisitDTO>(DailyVisitDTO.class));
	}
	
	public List<GenderVisitDTO> getGenderCount(){
		String sql = "select mem_gender as gender,"
				+ "count(*) as count "
				+ "from members "
				+ "group by mem_gender";
		
		return jdbc.query(sql, new BeanPropertyRowMapper<GenderVisitDTO>(GenderVisitDTO.class));
	}
}























