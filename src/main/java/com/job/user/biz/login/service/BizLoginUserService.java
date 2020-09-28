package com.job.user.biz.login.service;

public interface BizLoginUserService {
	/*기업회원가입*/
	public void join(BizLoginUserVO vo) throws Exception;
	/*사업자 번호 중복체크*/
	public int bsm_no_check(BizLoginUserVO vo) throws Exception;
}
