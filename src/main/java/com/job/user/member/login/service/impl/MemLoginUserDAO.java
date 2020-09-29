package com.job.user.member.login.service.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.login.service.MemLoginUserVO;

@Repository("memLoginUserDAO")
public class MemLoginUserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/*개인 로그인*/
	public MemLoginUserVO user(MemLoginUserVO vo) throws Exception{
		return sqlSessionTemplate.selectOne("memLogin.user", vo);
	}
	
	/*개인 로그인 체크*/
	public int loginCheck(MemLoginUserVO vo) throws Exception{
		int result=(Integer)sqlSessionTemplate.selectOne("memLogin.loginCheck", vo);
		System.out.println("result : "+result);
		return  result;
	}

}
