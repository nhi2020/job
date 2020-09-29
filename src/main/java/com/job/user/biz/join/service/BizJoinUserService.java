package com.job.user.biz.join.service;

public interface BizJoinUserService {
	/*기업회원가입*/
	public void insertJoin(BizJoinUserVO vo) throws Exception;
	/*사업자 번호 중복체크*/
	public int bsm_no_check(BizJoinUserVO vo) throws Exception;
}
