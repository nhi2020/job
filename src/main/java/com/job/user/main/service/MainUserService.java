package com.job.user.main.service;

import java.util.List;

import com.job.user.biz.service.BizUserVO;

public interface MainUserService {
	/*기업추천*/
	public List<BizUserVO> selectRecommand()throws Exception;
	
	/*리뷰추천*/
	public List<MainUserVO> selectLatest()throws Exception;
}
