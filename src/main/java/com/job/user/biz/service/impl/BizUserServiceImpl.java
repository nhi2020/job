package com.job.user.biz.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.biz.service.BizUserService;
import com.job.user.biz.service.BizUserVO;

@Service("bizUserService")
public class BizUserServiceImpl implements BizUserService{

	@Resource(name="bizUserDAO")
	private BizUserDAO bizUserDAO;
	
	
	@Override
	public BizUserVO b_info(BizUserVO vo) throws Exception {
		
		return bizUserDAO.b_info(vo);
	}

}
