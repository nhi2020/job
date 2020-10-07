package com.job.user.biz.join.service.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.join.service.BizJoinUserVO;
import com.job.util.JobFileVO;

@Repository("bizJoinUserDAO")
public class BizJoinUserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/* 기업 회원가입 */
	public void insertJoin(BizJoinUserVO vo) throws Exception {
		sqlSessionTemplate.insert("bizJoin.insertBizJoin",vo);
	}
	
	/*사업자번호 중복체크*/
	public int bsm_no_check(BizJoinUserVO vo)throws Exception {
		int result=sqlSessionTemplate.selectOne("bizJoin.bsm_no_check", vo);
		return result;
	}
	
	/*기업 이미지 넣기*/
	public int insertBizImage(JobFileVO vo)throws Exception{
		int result=sqlSessionTemplate.insert("bizJoin.insertBizImage", vo);
		return result;
	}
	
}
