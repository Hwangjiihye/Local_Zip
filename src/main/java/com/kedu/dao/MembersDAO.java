package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.commons.EncryptionUtils;
import com.kedu.dto.MembersDTO;

@Repository
public class MembersDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	// 회원가입
	public int insert(MembersDTO dto) {
		String sql = "insert into members values(?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?)";
		return jdbc.update(sql, dto.getMem_id(),EncryptionUtils.getSha512(dto.getMem_password()),dto.getMem_nickname(),
				dto.getMem_name(), dto.getMem_ssn(), dto.getMem_gender(), dto.getMem_phone(), dto.getMem_email(),
				dto.getMem_zip_code(), dto.getMem_address1(), dto.getMem_address2(),dto.getMem_dong(), 1, 0);
	}
	
	// 아이디 중복체크
	public int duplCheck(String mem_id) {
		String sql = "select count(*) from members where mem_id = ?";
		return jdbc.queryForObject(sql, Integer.class, mem_id);
	}
	
	// 회원 정보 모두 출력
	public MembersDTO selectAll(String mem_id) {
		String sql = "select * from members where mem_id = ?";
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<MembersDTO>(MembersDTO.class),mem_id);
	}
	
	// 로그인, 닉네임 출력, 로그인 alert 기능 구현
	public int login(String mem_id, String mem_password) {
		
		String id = "select count(*) from members where mem_id = ?";
		Integer idCount = jdbc.queryForObject(id, Integer.class, mem_id); // Integer(객체)로 써야 null 값도 확인 가능
		
		if(idCount == 0 ) {
			return -1; // id가 db에 있는지 확인(없으면 -1 반환)
		}
		
		String pw = "select count(*) from members where mem_id = ? and mem_password = ?";
		Integer pwCount = jdbc.queryForObject(pw, Integer.class, mem_id, EncryptionUtils.getSha512(mem_password));
		
		if(pwCount > 0) {
			return 1; // id, pw 있음(로그인 성공)
		} else {
			return 0; // id는 있고, pw 없음
		}
	}
	
	// 홈 화면에서 닉네임 조회 후 띄우기
	public String nickname(String mem_id) { // DB에서 mem_id 기준으로 조회
		String sql = "select mem_nickname from members where mem_id = ?";
		return jdbc.queryForObject(sql, String.class, mem_id);
	}
	
	public String address(String mem_id) { // DB에서 mem_id를 기준으로 주소 조회
		String sql ="select mem_dong from members where mem_id = ?";
		return jdbc.queryForObject(sql, String.class, mem_id);
	}
	
	public int updateById(MembersDTO dto, String mem_id) {
		String sql = "update members set mem_nickname =?, mem_phone =?, mem_zip_code=?, mem_address1=?, mem_address2=? where mem_id=?";
		return jdbc.update(sql, dto.getMem_nickname(), dto.getMem_phone(), dto.getMem_zip_code(), dto.getMem_address1(), dto.getMem_address2(), mem_id);
	}
	
	public int deleteById(String mem_id) {
		String sql = "delete from members where mem_id=?";
		return jdbc.update(sql, mem_id);
	}
}
