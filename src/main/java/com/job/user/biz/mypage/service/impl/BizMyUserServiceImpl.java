package com.job.user.biz.mypage.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.biz.mypage.service.BizMyUserService;
import com.job.user.biz.mypage.service.BizMyUserVO;

@Service("bizMyUserServuice")
public class BizMyUserServiceImpl implements BizMyUserService {
	
	@Resource(name = "bizMyUserDAO")
	private BizMyUserDAO bizMyUserDAO;

	/*기업개인정보*/
	@Override
	public BizMyUserVO bizMySelectList(BizMyUserVO vo) throws Exception {
		return bizMyUserDAO.bizMySelectList(vo);
	}

}
