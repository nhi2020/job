package com.job.user.review.service;

import java.util.List;


public interface ReviewUserService {
	
	  public List<ReviewUserVO> reviewSelectList1(ReviewUserVO reviewUserVO);
	  public int total1();
	  
	  public List<ReviewUserVO> reviewSelectList2(ReviewUserVO reviewUserVO);
	  public int total2();
	  
	  public List<ReviewUserVO> reviewSelectList3(ReviewUserVO reviewUserVO);
	  public int total3();

		
}
