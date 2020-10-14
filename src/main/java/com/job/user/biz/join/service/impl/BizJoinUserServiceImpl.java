package com.job.user.biz.join.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.biz.join.service.BizJoinUserService;
import com.job.user.biz.join.service.BizJoinUserVO;
import com.job.util.JobFileVO;

@Service("bizJoinUserService")
public class BizJoinUserServiceImpl implements BizJoinUserService {

	@Resource(name = "bizJoinUserDAO")
	private BizJoinUserDAO bizJoinUserDAO;

	/* 기업회원가입 */
	@Override
	public void insertJoin(BizJoinUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		bizJoinUserDAO.insertJoin(vo);
	}
	
	/*사업자번호 중복체크*/
	@Override
	public int bsm_no_check(BizJoinUserVO vo) throws Exception {
		int result=bizJoinUserDAO.bsm_no_check(vo);
		return result;
	}
	
	/*이메일 중복체크*/
	@Override
	public int bsm_no_e_check(BizJoinUserVO vo) throws Exception {
		int result=bizJoinUserDAO.bsm_no_e_check(vo);
		return result;
	}
	
	/*전화번호 중복체크*/
	@Override
	public int bsm_no_p_check(BizJoinUserVO vo) throws Exception {
		int result=bizJoinUserDAO.bsm_no_p_check(vo);
		return result;
	}

	/*기업 이미지 넣기*/
	@Override
	public int insertBizImage(JobFileVO vo) throws Exception {
		int result=bizJoinUserDAO.insertBizImage(vo);
		return result;
	}

	

	

}
