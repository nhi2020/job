package com.job.user.member.mypage.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import com.job.user.member.mypage.service.MemMyUserService;
import com.job.user.member.mypage.service.MemMyUserVO;
import com.job.util.JobFileVO;

@Service("memMyUserService")
public class MemMyUserServiceImpl implements MemMyUserService {

	@Resource(name = "memMyUserDAO")
	private MemMyUserDAO memMyUserDAO;

	/* 개인회원 리스트 */
	@Override
	public List<MemMyUserVO> memMyList()throws Exception  {
		System.out.println("start service");
		return memMyUserDAO.memMyList();
	}

	/* 개인정보 */
	@Override
	public MemMyUserVO memMySelectList(MemMyUserVO vo)throws Exception  {
		return memMyUserDAO.memMySelectList(vo);
	}

	/* 개인정보 업데이트 */
	@Override
	public int memMyUpdate(MemMyUserVO vo) throws Exception {
		int result = memMyUserDAO.memMyUpdate(vo);
		return result;
	}

	/* 개인정보 업데이트1 */
	@Override
	public int myUpdate(MemMyUserVO vo)throws Exception  {
		return memMyUserDAO.myupdate(vo);
	}
	
	/*개인회원 탈퇴*/
	@Override
	public int memMyDelete(MemMyUserVO vo) throws Exception {
		return memMyUserDAO.memMyDelete(vo);
		
	}

	/*비밀번호 체크*/
	@Override
	public int myPassChk(MemMyUserVO vo) throws Exception {
		int result = memMyUserDAO.myPassChk(vo);
		return result;
	}
	
	/* 비밀번호 업데이트 */
	@Override
	public int myUpdatePassChng(MemMyUserVO vo)throws Exception  {
		int result = memMyUserDAO.myUpdatePassChng(vo);
		return result;
	}

	/*이미지 업데이트*/
	@Override
	public int myUpdateImage(JobFileVO jobVO) throws Exception {
		int result =memMyUserDAO.myUpdateImage(jobVO);
		return result;
	}

	@Override
	public List<MemMyUserVO> memMyReviewList1(MemMyUserVO memMyUserVO) {

		return memMyUserDAO.memMyReviewList1(memMyUserVO);
	}

	@Override
	public int memMyReviewCnt1(MemMyUserVO memMyUserVO) {
	
		return memMyUserDAO.memMyReviewCnt1(memMyUserVO);
	}

	@Override
	public List<MemMyUserVO> memMyReviewList2(MemMyUserVO memMyUserVO) {
	
		return memMyUserDAO.memMyReviewList2(memMyUserVO);
	}

	@Override
	public int memMyReviewCnt2(MemMyUserVO memMyUserVO) {
	
		return memMyUserDAO.memMyReviewCnt2(memMyUserVO);
	}

	@Override
	public List<MemMyUserVO> memMyReviewList3(MemMyUserVO memMyUserVO) {
	
		return memMyUserDAO.memMyReviewList3(memMyUserVO);
	}

	@Override
	public int memMyReviewCnt3(MemMyUserVO memMyUserVO) {
		
		return memMyUserDAO.memMyReviewCnt3(memMyUserVO);
	}
	

}
