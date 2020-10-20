package com.job.user.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.job.user.biz.service.BizUserVO;
import com.job.user.main.service.MainUserService;
import com.job.user.main.service.MainUserVO;

@Service("mainUserService")
public class MainUserServiceImpl implements MainUserService {

	@Resource(name="mainUserDAO")
	private MainUserDAO mainUserDAO;
	
	/*기업추천*/
	@Override
	public List<BizUserVO> selectRecommand() throws Exception {
		return mainUserDAO.selectRecommand();
	}

	/*리뷰추천*/
	@Override
	public List<MainUserVO> selectLatest() throws Exception {
		return mainUserDAO.selectLatest();
	}


}
