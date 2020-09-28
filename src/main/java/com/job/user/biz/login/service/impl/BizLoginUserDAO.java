package com.job.user.biz.login.service.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.login.service.BizLoginUserVO;

@Repository("bizLoginUserDAO")
public class BizLoginUserDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	/* 기업 회원가입 */
	public void join(BizLoginUserVO vo) throws Exception {
		sessionTemplate.insert("sangah.BizJoinUser_SQL",vo);
	}
	
	/*사업자번호 중복체크*/
	public int bsm_no_check(BizLoginUserVO vo)throws Exception {
		int result=sessionTemplate.selectOne("sangah.bsm_no_check", vo);
		return result;
	}
	
}
