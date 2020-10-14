package com.job.user.member.join.service.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.join.service.MemJoinUserVO;
import com.job.util.JobFileVO;

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
	
	/*이메일 중복체크*/
	public int e_check(MemJoinUserVO vo) throws Exception{
		int result=sqlSessionTemplate.selectOne("memJoin.e_check", vo);
		return result;
	}
	
	/*전화번호 중복체크*/
	public int p_check(MemJoinUserVO vo)throws Exception{
		int result=sqlSessionTemplate.selectOne("memJoin.p_check", vo);
		return result;
	}
	
	/*개인 이미지 넣기*/
	public int insertMemImage(JobFileVO vo)throws Exception{
		int result=sqlSessionTemplate.insert("memJoin.insertMemImage", vo);
		return result;
	}

}
