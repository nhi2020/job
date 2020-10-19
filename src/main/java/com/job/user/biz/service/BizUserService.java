package com.job.user.biz.service;

import java.util.List;

public interface BizUserService {
	
	public List<BizUserVO> b_info(BizUserVO vo)throws Exception;
	
	/*검색자동완성*/
	public List<BizUserVO> autocomplete(BizUserVO vo)throws Exception;
	// 페이징 처리 게시글 조회
	public List<BizUserVO> selectBiz(BizUserVO vo);
	public int total();
	
}
