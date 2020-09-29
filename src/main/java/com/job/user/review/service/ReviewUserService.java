package com.job.user.review.service;

import java.util.List;


public interface ReviewUserService {
	
	  public List<ReviewUserVO> reviewSelectList(ReviewUserVO reviewUserVO);
	  public int total();
	  public void reviewInsertForm();
	  public ReviewUserVO reviewDetailForm(int rnum);

		
}
