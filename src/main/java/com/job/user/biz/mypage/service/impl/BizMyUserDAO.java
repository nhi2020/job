package com.job.user.biz.mypage.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.mypage.service.BizMyUserVO;

@Repository("bizMyUserDAO")
public class BizMyUserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/* 기업개인정보 */
	public BizMyUserVO bizMySelectList(BizMyUserVO vo) throws Exception {
		BizMyUserVO b_user = sqlSessionTemplate.selectOne("BizMyUser.bizMySelectList", vo);
		return b_user;
	}
}
