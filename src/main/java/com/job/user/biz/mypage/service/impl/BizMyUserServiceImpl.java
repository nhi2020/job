package com.job.user.biz.mypage.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.biz.mypage.service.BizMyUserService;
import com.job.user.biz.mypage.service.BizMyUserVO;
import com.job.util.JobFileVO;

@Service("bizMyUserServuice")
public class BizMyUserServiceImpl implements BizMyUserService {

	@Resource(name = "bizMyUserDAO")
	private BizMyUserDAO bizMyUserDAO;

	/* 기업개인정보 */
	@Override
	public BizMyUserVO bizMySelectList(BizMyUserVO vo) throws Exception {
		return bizMyUserDAO.bizMySelectList(vo);
	}

	/* 기업정보 업데이트 */
	@Override
	public int bizMyUpdateForm(BizMyUserVO vo) throws Exception {
		int result = bizMyUserDAO.bizMyUpdateForm(vo);
		return result;
	}

	/* 기업정보 업데이트1 */
	@Override
	public int bizMyUpdate(BizMyUserVO vo) throws Exception {
		return bizMyUserDAO.bizMyUpdate(vo);
	}

	/* 기업회원 탈퇴 */
	@Override
	public int bizMyDelete(BizMyUserVO vo) throws Exception {
		return bizMyUserDAO.bizMyDelete(vo);
	}

	/* 비밀번호 체크 */
	@Override
	public int bizPassChk(BizMyUserVO vo) throws Exception {
		int result =bizMyUserDAO.bizPassChk(vo);
		return result;
	}

	/* 기업회원 비밀번호 업데이트 */
	@Override
	public int bizMyUpdatePassChng(BizMyUserVO vo) throws Exception {
		int result =bizMyUserDAO.bizMyUpdatePassChng(vo);
		return result;
	}

	/* 기업 이미지 업데이트 */
	@Override
	public int bizMyUpdateImage(JobFileVO jobVO) throws Exception {
		int result = bizMyUserDAO.bizMyUpdateImage(jobVO);
		return result;
	}

}
