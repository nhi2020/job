package com.job.user.main.service;

import java.util.List;

import com.job.user.biz.service.BizUserVO;

public interface MainUserService {
	public List<BizUserVO> selectRecommand()throws Exception;
}
