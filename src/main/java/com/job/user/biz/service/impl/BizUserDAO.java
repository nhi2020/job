package com.job.user.biz.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.service.BizUserVO;

@Repository("bizUserDAO")
public class BizUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<BizUserVO> b_info(BizUserVO vo)throws Exception {
		return sqlSessionTemplate.selectList("bizInfo.b_Info", vo);
		
	}
	
	/*검색자동완성*/
	public List<BizUserVO> autocomplete(BizUserVO vo)throws Exception{
		return sqlSessionTemplate.selectList("bizInfo.autocomplete", vo);
	}
	
}
