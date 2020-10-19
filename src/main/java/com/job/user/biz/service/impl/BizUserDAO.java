package com.job.user.biz.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.service.BizUserVO;
import com.job.user.review.service.ReviewUserVO;

@Repository("bizUserDAO")
public class BizUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<BizUserVO> b_info(BizUserVO vo)throws Exception {
		return sqlSessionTemplate.selectList("bizInfo.b_Info", vo);
		
		
	}

	public List<BizUserVO> selectBiz(BizUserVO vo) {
		List<BizUserVO> selectBiz = sqlSessionTemplate.selectList("bizInfo.bizList", vo);
		return selectBiz;
	}

	public int total() {
		int total = (Integer)sqlSessionTemplate.selectOne("bizInfo.total");
		return total;
	}
}
