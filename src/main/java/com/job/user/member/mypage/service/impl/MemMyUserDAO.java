package com.job.user.member.mypage.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.member.mypage.service.MemMyUserVO;
import com.job.user.review.service.ReviewUserVO;
import com.job.util.JobFileVO;

@Repository("memMyUserDAO")
public class MemMyUserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/* 개인회원 리스트 */
	public List<MemMyUserVO> memMyList() throws Exception {
		List<MemMyUserVO> memMylist = sqlSessionTemplate.selectList("MemMyUser.memMyList");
		return memMylist;

	}

	/* 개인정보 */
	public MemMyUserVO memMySelectList(MemMyUserVO vo) throws Exception {
		MemMyUserVO user = sqlSessionTemplate.selectOne("MemMyUser.memMySelectList", vo);
		return user;
	}

	/* 개인정보 업데이트 */
	public int memMyUpdate(MemMyUserVO vo) throws Exception {
		int result = (Integer) sqlSessionTemplate.update("MemMyUser.memMyUpdate", vo);
		return result;
	}

	/* 개인정보 업데이트1 */
	public int myupdate(MemMyUserVO vo) throws Exception {
		int result = (Integer) sqlSessionTemplate.update("MemMyUser.myUpdate", vo);
		return result;
	}

	/* 개인회원 탈퇴 */
	public int memMyDelete(MemMyUserVO vo) throws Exception {
		int result = sqlSessionTemplate.update("MemMyUser.memMyDelete", vo);
		return result;
	}

	/* 비밀번호 체크 */
	public int myPassChk(MemMyUserVO vo) throws Exception {
		int result = sqlSessionTemplate.selectOne("MemMyUser.myPassChk", vo);
		return result;

	}

	/* 비밀번호 업데이트 */
	public int myUpdatePassChng(MemMyUserVO vo) throws Exception {
		int result = (Integer) sqlSessionTemplate.update("MemMyUser.myUpdatePassChng", vo);
		return result;
	}

	/* 이미지 업데이트 */
	public int myUpdateImage(JobFileVO jobVO) throws Exception {
		int result = sqlSessionTemplate.update("MemMyUser.myUpdateImage", jobVO);
		return result;
	}

	/* 기업리뷰 */
	public List<MemMyUserVO> memMyReviewList1(MemMyUserVO memMyUserVO) {
		List<MemMyUserVO> memMyReviewList1 = sqlSessionTemplate.selectList("MemMyUser.memMyReviewList1", memMyUserVO);
		return memMyReviewList1;
	}

	public int memMyReviewCnt1(MemMyUserVO memMyUserVO) {
		int total1 = (Integer) sqlSessionTemplate.selectOne("MemMyUser.memMyReviewCnt1",memMyUserVO);
		return total1;
	}

	/* 기업연봉 */
	public List<MemMyUserVO> memMyReviewList2(MemMyUserVO memMyUserVO) {
		List<MemMyUserVO> memMyReviewList2 = sqlSessionTemplate.selectList("MemMyUser.memMyReviewList2", memMyUserVO);
		return memMyReviewList2;
	}

	public int memMyReviewCnt2(MemMyUserVO memMyUserVO) {
		int tota2 = (Integer) sqlSessionTemplate.selectOne("MemMyUser.memMyReviewCnt2",memMyUserVO);
		return tota2;
	}

	/* 면접후기 */
	public List<MemMyUserVO> memMyReviewList3(MemMyUserVO memMyUserVO) {
		List<MemMyUserVO> memMyReviewList3 = sqlSessionTemplate.selectList("MemMyUser.memMyReviewList3", memMyUserVO);
		return memMyReviewList3;
	}

	public int memMyReviewCnt3(MemMyUserVO memMyUserVO) {
		int tota3 = (Integer) sqlSessionTemplate.selectOne("MemMyUser.memMyReviewCnt3",memMyUserVO);
		return tota3;
	}
}
