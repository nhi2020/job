package com.job.user.main.service.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.service.BizUserVO;
import com.job.user.main.service.MainUserVO;

@Repository("mainUserDAO")
public class MainUserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*기업추천*/
	public List<BizUserVO> selectRecommand()throws Exception{
		return sqlSessionTemplate.selectList("main.selectRecommand");
	}
	
	/*리뷰추천*/
	public List<MainUserVO> selectLatest()throws Exception{
		return sqlSessionTemplate.selectList("main.selectLatest");
	}
}
