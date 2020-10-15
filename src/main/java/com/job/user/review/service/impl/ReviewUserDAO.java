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
	/*리뷰리스트*/
	/*-기업리뷰*/
	public List<ReviewUserVO> reviewSelectList1(ReviewUserVO reviewUserVO) {
		System.out.println("StartDAO1");
		List<ReviewUserVO> reviewSelectList = sessionTemplate.selectList("reviewUser.reviewList1", reviewUserVO);
		return reviewSelectList;
	}	
	public int total1() {
		int total = (Integer)sessionTemplate.selectOne("reviewUser.total1");
		return total;		
	}
	
	/*-기업연봉*/ 
	public List<ReviewUserVO> reviewSelectList2(ReviewUserVO reviewUserVO) {
		System.out.println("StartDAO2");
		List<ReviewUserVO> reviewSelectList = sessionTemplate.selectList("reviewUser.reviewList2", reviewUserVO);
		return reviewSelectList;
	}	
	public int total2() {
		int total = (Integer)sessionTemplate.selectOne("reviewUser.total2");
		return total;		
	}
	
	/*-면접후기*/ 
	public List<ReviewUserVO> reviewSelectList3(ReviewUserVO reviewUserVO) {
		System.out.println("StartDAO3");
		List<ReviewUserVO> reviewSelectList = sessionTemplate.selectList("reviewUser.reviewList3", reviewUserVO);
		return reviewSelectList;
	}
	public int total3() {
		System.out.println("reviewUserServiceDAO total3");
		int total = (Integer)sessionTemplate.selectOne("reviewUser.total3");
		return total;		
	}
	
	/*글작성*/
	public int Write(ReviewUserVO reviewUserVO) {
		return sessionTemplate.insert("reviewUser.reviewWrite", reviewUserVO);
	}
	public int mWrite(ReviewUserVO reviewUserVO) {
		return sessionTemplate.insert("reviewUser.mreviewWrite", reviewUserVO);
	}	
	public int sWrite(ReviewUserVO reviewUserVO) {
		return sessionTemplate.insert("reviewUser.salWrite", reviewUserVO);
	}
		
	/*리뷰상세보기*/
	public ReviewUserVO reviewDetailForm(int rnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("reviewUser.reviewDetail", rnum);
	}
	public ReviewUserVO mreviewDetailForm(int rnum) {
		return sessionTemplate.selectOne("reviewUser.reviewDetail", rnum);
	}
	public ReviewUserVO salDetailForm(int rnum) {
		return sessionTemplate.selectOne("reviewUser.reviewDetail", rnum);
	}

	/*조회수+1*/
	public int plusBcnt(int rnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("reviewUser.plusBcnt", rnum);
	}
	
	/*리뷰 삭제*/
	public int Delete(int rnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("reviewUser.reviewDelete", rnum);
	}
	
	/*리뷰 수정*/
	public int Update(ReviewUserVO reviewUserVO) {
		System.out.println("vo : update review : " + reviewUserVO.getReview());
		System.out.println("vo : update mreview : " + reviewUserVO.getMreview());
		return sessionTemplate.update("reviewUser.reviewUpdate", reviewUserVO);		
	}
	public int sUpdate(ReviewUserVO reviewUserVO) {
		System.out.println("vo : update sal : " + reviewUserVO.getSal());
		return sessionTemplate.update("reviewUser.salUpdate", reviewUserVO);		
	}
	public int mUpdate(ReviewUserVO reviewUserVO) {
		System.out.println("vo : update review : " + reviewUserVO.getReview());
		System.out.println("vo : update mreview : " + reviewUserVO.getMreview());
		return sessionTemplate.update("reviewUser.mreviewUpdate", reviewUserVO);		
	}
}
