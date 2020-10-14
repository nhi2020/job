package com.job.user.biz.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.service.BizUserVO;

@Repository("bizUserDAO")
public class BizUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public BizUserVO b_info(BizUserVO vo)throws Exception {
		return sqlSessionTemplate.selectOne("bizInfo.b_Info", vo);
		
		
	}
}
