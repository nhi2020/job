package com.job.user.review.service;

import java.util.List;


public interface ReviewUserService {
	/*리뷰리스트*/
	/*-기업리뷰*/
	public List<ReviewUserVO> reviewSelectList1(ReviewUserVO reviewUserVO);
	public int total1();
	/*-기업연봉*/  
	public List<ReviewUserVO> reviewSelectList2(ReviewUserVO reviewUserVO);
	public int total2();
	/*-면접후기*/  
	public List<ReviewUserVO> reviewSelectList3(ReviewUserVO reviewUserVO);
	public int total3();
	
	/*글작성*/
	public int Write(ReviewUserVO reviewUserVO);	
	public int mWrite(ReviewUserVO reviewUserVO);
	public int sWrite(ReviewUserVO reviewUserVO);
	
	/*리뷰상세보기*/
	public ReviewUserVO reviewDetailForm(int rnum);	  
	public ReviewUserVO mreviewDetailForm(int rnum);
	public ReviewUserVO salDetailForm(int rnum);

	/*조회수+1*/
	public int plusBcnt(int rnum);
	
	/*리뷰 수정*/
	public int reviewUpdate(ReviewUserVO reviewUserVO);
	public int salUpdate(ReviewUserVO reviewUserVO);
	public int mreviewUpdate(ReviewUserVO reviewUserVO);

	/*리뷰 삭제*/
	public int Delete(int rnum);
	

	
		
}
