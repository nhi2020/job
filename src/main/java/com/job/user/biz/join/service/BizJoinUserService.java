package com.job.user.biz.join.service;

import com.job.util.JobFileVO;

public interface BizJoinUserService {
	/*기업회원가입*/
	public void insertJoin(BizJoinUserVO vo) throws Exception;
	/*사업자 번호 중복체크*/
	public int bsm_no_check(BizJoinUserVO vo) throws Exception;
	/*이메일 중복체크*/
	public int bsm_no_e_check(BizJoinUserVO vo) throws Exception;
	
	/*기업 이미지 넣기*/
	public int insertBizImage(JobFileVO vo) throws Exception;
}
