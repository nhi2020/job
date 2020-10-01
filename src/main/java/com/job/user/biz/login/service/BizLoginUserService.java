package com.job.user.biz.login.service;

public interface BizLoginUserService {
	/*기업 로그인*/
	public BizLoginUserVO b_login(BizLoginUserVO vo)throws Exception;
	
	/*기업 로그인 체크*/
	public int b_LoginCheck(BizLoginUserVO vo)throws Exception;
}
