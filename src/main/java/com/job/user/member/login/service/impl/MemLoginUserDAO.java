package com.job.user.member.login.service.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.login.service.MemLoginUserVO;

@Repository("memLoginUserDAO")
public class MemLoginUserDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	/*개인회원가입*/
	public void join(MemLoginUserVO vo) {
		sessionTemplate.insert("sangah.MemJoinUser_SQL", vo);
	}
	
	/*아이디 중복체크*/
	public int m_check(MemLoginUserVO vo) throws Exception{
		int result= sessionTemplate.selectOne("sangah.m_check", vo);
		return result;
	}

}
