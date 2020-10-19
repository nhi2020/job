package com.job.user.biz.service;

import java.util.List;

public interface BizUserService {
	
	public List<BizUserVO> b_info(BizUserVO vo)throws Exception;
	
	/*검색자동완성*/
	public List<BizUserVO> autocomplete(BizUserVO vo)throws Exception;
}
