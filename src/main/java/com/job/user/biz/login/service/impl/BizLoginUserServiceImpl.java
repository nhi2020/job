package com.job.user.biz.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.biz.login.service.BizLoginUserService;
import com.job.user.biz.login.service.BizLoginUserVO;

@Service("bizLoginUserService")
public class BizLoginUserServiceImpl implements BizLoginUserService {

	@Resource(name = "bizLoginUserDAO")
	private BizLoginUserDAO bizLoginUserDAO;

	/* 기업회원가입 */
	@Override
	public void join(BizLoginUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		bizLoginUserDAO.join(vo);
	}
	
	/*사업자번호 중복체크*/
	@Override
	public int bsm_no_check(BizLoginUserVO vo) throws Exception {
		int result=bizLoginUserDAO.bsm_no_check(vo);
		return result;
	}

}
