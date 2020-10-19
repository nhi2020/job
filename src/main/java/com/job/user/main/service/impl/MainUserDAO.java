package com.job.user.main.service.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.service.BizUserVO;

@Repository("mainUserDAO")
public class MainUserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BizUserVO> selectRecommand()throws Exception{
		return sqlSessionTemplate.selectList("main.selectRecommand");
	}
}
