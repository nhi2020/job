package com.job.user.biz.login.service.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.job.user.biz.login.service.BizLoginUserVO;

@Repository("bizLoginUserDAO")
public class BizLoginUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*기업 로그인*/
	public BizLoginUserVO b_login(BizLoginUserVO vo)throws Exception{
		return sqlSessionTemplate.selectOne("bizLogin.b_Login", vo);
	}
	
	/*기업 로그인 체크*/
	public int b_LoginCheck(BizLoginUserVO vo)throws Exception{
		int result=(Integer)sqlSessionTemplate.selectOne("bizLogin.b_LoginCheck", vo);
		System.out.println("b_LoginCheck result : "+result);
		return result;
	}
	
	/*기업 사업자 번호 찾기*/
	public String findBsmno(BizLoginUserVO vo)throws Exception{
		return sqlSessionTemplate.selectOne("bizLogin.findBsmno", vo);
	}
	
	/*기업 비밀번호 찾기 후 변경*/
	public void bizPassChange(Map<String, Object> map, BizLoginUserVO vo) throws Exception{
		map.get("pass");
		map.get("email");
		
		sqlSessionTemplate.update("bizLogin.bizPassChange", vo);
	}
	
}
