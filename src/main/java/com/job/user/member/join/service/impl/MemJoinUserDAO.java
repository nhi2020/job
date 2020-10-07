package com.job.user.member.join.service.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.join.service.MemJoinUserVO;

@Repository("memJoinUserDAO")
public class MemJoinUserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/*개인회원가입*/
	public void insertJoin(MemJoinUserVO vo) {
		sqlSessionTemplate.insert("memJoin.insertMemJoin", vo);
	}
	
	/*아이디 중복체크*/
	public int m_check(MemJoinUserVO vo) throws Exception{
		int result= sqlSessionTemplate.selectOne("memJoin.m_check", vo);
		return result;
	}

}