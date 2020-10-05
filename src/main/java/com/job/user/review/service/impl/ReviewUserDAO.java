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
	
	public List<ReviewUserVO> reviewSelectList1(ReviewUserVO reviewUserVO) {
		System.out.println("StartDAO1");
		List<ReviewUserVO> reviewSelectList = sessionTemplate.selectList("reviewUser.reviewList1", reviewUserVO);
		return reviewSelectList;
	}
	
	public int total1() {
		int total = (Integer)sessionTemplate.selectOne("reviewUser.total1");
		return total;		
	}
	
	public List<ReviewUserVO> reviewSelectList2(ReviewUserVO reviewUserVO) {
		System.out.println("StartDAO2");
		List<ReviewUserVO> reviewSelectList = sessionTemplate.selectList("reviewUser.reviewList2", reviewUserVO);
		return reviewSelectList;
	}
	
	public int total2() {
		int total = (Integer)sessionTemplate.selectOne("reviewUser.total2");
		return total;		
	}
	
	public List<ReviewUserVO> reviewSelectList3(ReviewUserVO reviewUserVO) {
		System.out.println("StartDAO3");
		List<ReviewUserVO> reviewSelectList = sessionTemplate.selectList("reviewUser.reviewList3", reviewUserVO);
		return reviewSelectList;
	}
	
	public int total3() {
		int total = (Integer)sessionTemplate.selectOne("reviewUser.total3");
		return total;		
	}
	
	public int reviewWriteForm(ReviewUserVO reviewUserVO) {
		return 0;
	}
	
}
