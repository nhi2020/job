package com.job.user.biz.mypage.service;

import com.job.util.JobFileVO;

public interface BizMyUserService {
	/* 기업개인정보 */
	public BizMyUserVO bizMySelectList(BizMyUserVO vo) throws Exception;

	/* 기업정보 업데이트 */
	public int bizMyUpdateForm(BizMyUserVO vo) throws Exception;

	/* 기업정보 업데이트1 */
	public int bizMyUpdate(BizMyUserVO vo) throws Exception;

	/* 기업회원 탈퇴 */
	public int bizMyDelete(BizMyUserVO vo) throws Exception;

	/* 비밀번호 체크 */
	public int bizPassChk(BizMyUserVO vo) throws Exception;

	/* 기업회원 비밀번호 업데이트 */
	public int bizMyUpdatePassChng(BizMyUserVO vo) throws Exception;

	/*기업 이미지 업데이트 */
	public int bizMyUpdateImage(JobFileVO jobVO) throws Exception;
}
