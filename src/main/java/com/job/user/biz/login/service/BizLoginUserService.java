package com.job.user.biz.login.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface BizLoginUserService {
	/*기업 로그인*/
	public BizLoginUserVO b_login(BizLoginUserVO vo)throws Exception;
	
	/*기업 로그인 체크*/
	public int b_LoginCheck(BizLoginUserVO vo)throws Exception;
	
	/*기업 사업자 번호 찾기*/
	public String findBsmno(HttpServletResponse response, BizLoginUserVO vo) throws Exception;

	/*기업 비밀번호 찾기 후 변경*/
	public void bizPassChange(Map<String, Object> map,BizLoginUserVO vo)throws Exception;
}
