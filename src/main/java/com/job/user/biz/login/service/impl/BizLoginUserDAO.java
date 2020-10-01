package com.job.user.biz.login.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.login.service.BizLoginUserVO;

@Repository("bizLoginUserDAO")
public class BizLoginUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*기업 로그인*/
	public BizLoginUserVO b_login(BizLoginUserVO vo)throws Exception{
		return sqlSessionTemplate.selectOne("bizLogin.b_Login", vo);
	}
	
	/*기업 로그인 체크*/
	public int b_LoginCheck(BizLoginUserVO vo)throws Exception{
		return sqlSessionTemplate.selectOne("bizLogin.b_LoginCheck", vo);
	}
}
