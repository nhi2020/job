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
	public List<ReviewUserVO> reviewSelectList(ReviewUserVO reviewUserVO) {
		System.out.println("StartServiceImpl");
		return reviewUserDAO.reviewSelectList();
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return reviewUserDAO.total();
	}

	@Override
	public void reviewInsertForm() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ReviewUserVO reviewDetailForm(int rnum) {
		// TODO Auto-generated method stub
		return null;
	}




	

}
