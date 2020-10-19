package com.job.user.member.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.job.user.review.service.ReviewUserVO;
import com.job.util.JobFileVO;

public interface MemMyUserService {

	/* 개인회원 리스트 */
	public List<MemMyUserVO> memMyList() throws Exception;

	/* 개인정보 */
	public MemMyUserVO memMySelectList(MemMyUserVO vo) throws Exception;

	/* 개인정보 업데이트 */
	public int memMyUpdate(MemMyUserVO vo) throws Exception;

	/* 개인정보 업데이트1 */
	public int myUpdate(MemMyUserVO vo) throws Exception;

	/* 개인회원 탈퇴 */
	public int memMyDelete(MemMyUserVO vo) throws Exception;

	/* 비밀번호 체크 */
	public int myPassChk(MemMyUserVO vo) throws Exception;

	/* 비밀번호 업데이트 */
	public int myUpdatePassChng(MemMyUserVO vo) throws Exception;

	/* 이미지 업데이트 */
	public int myUpdateImage(JobFileVO jobVO) throws Exception;

	/*기업리뷰*/
	public List<MemMyUserVO> memMyReviewList1(MemMyUserVO memMyUserVO);
	public int memMyReviewCnt1(MemMyUserVO memMyUserVO);
	/*기업연봉*/  
	public List<MemMyUserVO> memMyReviewList2(MemMyUserVO memMyUserVO);
	public int memMyReviewCnt2(MemMyUserVO memMyUserVO );
	/*면접후기*/  
	public List<MemMyUserVO> memMyReviewList3(MemMyUserVO memMyUserVO);
	public int memMyReviewCnt3(MemMyUserVO memMyUserVO);

}
