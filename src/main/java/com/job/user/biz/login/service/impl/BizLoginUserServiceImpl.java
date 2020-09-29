package com.job.user.biz.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.biz.join.service.BizJoinUserService;
import com.job.user.biz.join.service.BizJoinUserVO;
import com.job.user.biz.login.service.BizLoginUserService;
import com.job.user.biz.login.service.BizLoginUserVO;

@Service("bizLoginUserService")
public class BizLoginUserServiceImpl implements BizLoginUserService {

	@Resource(name = "bizLoginUserDAO")
	private BizLoginUserDAO bizLoginUserDAO;

	/*기업 로그인*/
	@Override
	public BizLoginUserVO b_login(BizLoginUserVO vo) throws Exception {
		return bizLoginUserDAO.b_login(vo);
	}

}
