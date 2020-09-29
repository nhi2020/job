package com.job.user.review.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.review.service.ReviewUserVO;

@Repository("reviewUserDAO")
public class ReviewUserDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public List<ReviewUserVO> reviewSelectList() {
		System.out.println("StartDAO");
		List<ReviewUserVO> reviewSelectList = sessionTemplate.selectList("reviewUser.reviewList");
		return reviewSelectList;
	}
	
	public int total() {
		int total = sessionTemplate.selectOne("reviewUser.total");
		return total;		
	}
	
}
