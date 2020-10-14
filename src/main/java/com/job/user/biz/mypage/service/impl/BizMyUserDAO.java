package com.job.user.biz.mypage.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.mypage.service.BizMyUserVO;
import com.job.util.JobFileVO;

@Repository("bizMyUserDAO")
public class BizMyUserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/* 기업개인정보 */
	public BizMyUserVO bizMySelectList(BizMyUserVO vo) throws Exception {
		BizMyUserVO b_user = sqlSessionTemplate.selectOne("BizMyUser.bizMySelectList", vo);
		return b_user;
	}

	/* 기업정보 업데이트 */
	public int bizMyUpdateForm(BizMyUserVO vo) throws Exception {
		int result = (Integer) sqlSessionTemplate.update("BizMyUser.bizMyUpdateForm", vo);
		return result;
	}

	/* 기업정보 업데이트1 */
	public int bizMyUpdate(BizMyUserVO vo) throws Exception {
		int result = (Integer) sqlSessionTemplate.update("BizMyUser.bizMyUpdate", vo);
		return result;
	}

	/* 기업회원 탈퇴 */
	public int bizMyDelete(BizMyUserVO vo) throws Exception {
		int result = sqlSessionTemplate.update("BizMyUser.bizMyDelete", vo);
		return result;
	}

	/* 비밀번호 체크 */
	public int bizPassChk(BizMyUserVO vo) throws Exception {
		int result = sqlSessionTemplate.selectOne("BizMyUser.bizPassChk", vo);
		return result;
	}

	/* 기업회원 비밀번호 업데이트 */
	public int bizMyUpdatePassChng(BizMyUserVO vo) throws Exception {
		int result = (Integer) sqlSessionTemplate.update("BizMyUser.bizMyUpdatePassChng", vo);
		return result;
	}

	/* 기업 이미지 업데이트 */
	public int bizMyUpdateImage(JobFileVO jobVO) throws Exception {
		int result = sqlSessionTemplate.update("BizMyUser.bizMyUpdateImage", jobVO);
		return result;
	}

}
