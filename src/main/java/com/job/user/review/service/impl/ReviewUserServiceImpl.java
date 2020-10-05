package com.job.user.review.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.review.service.ReviewUserService;
import com.job.user.review.service.ReviewUserVO;

@Service("reviewUserService")
public class ReviewUserServiceImpl implements ReviewUserService {
	
	@Resource(name="reviewUserDAO")
	private ReviewUserDAO reviewUserDAO;
	
	@Override
	public List<ReviewUserVO> reviewSelectList1(ReviewUserVO reviewUserVO) {
		System.out.println("StartServiceImpl");
		return reviewUserDAO.reviewSelectList1(reviewUserVO);
	}

	@Override
	public int total1() {
		// TODO Auto-generated method stub
		return reviewUserDAO.total1();
	}

	@Override
	public List<ReviewUserVO> reviewSelectList2(ReviewUserVO reviewUserVO) {
		System.out.println("StartServiceImpl");
		return reviewUserDAO.reviewSelectList2(reviewUserVO);
	}

	@Override
	public int total2() {
		// TODO Auto-generated method stub
		return reviewUserDAO.total2();
	}

	@Override
	public List<ReviewUserVO> reviewSelectList3(ReviewUserVO reviewUserVO) {
		System.out.println("StartServiceImpl");
		return reviewUserDAO.reviewSelectList3(reviewUserVO);
	}

	@Override
	public int total3() {
		// TODO Auto-generated method stub
		return reviewUserDAO.total3();
	}

}
