package com.job.user.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.biz.service.BizUserVO;
import com.job.user.main.service.MainUserService;

@Service("mainUserService")
public class MainUserServiceImpl implements MainUserService {

	@Resource(name="mainUserDAO")
	private MainUserDAO mainUserDAO;
	
	@Override
	public List<BizUserVO> selectRecommand() throws Exception {
		return mainUserDAO.selectRecommand();
	}


}
