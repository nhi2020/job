package com.job.user.biz.login.service.impl;

import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.job.user.biz.login.service.BizLoginUserService;
import com.job.user.biz.login.service.BizLoginUserVO;

@Service("bizLoginUserService")
public class BizLoginUserServiceImpl implements BizLoginUserService {

	@Resource(name = "bizLoginUserDAO")
	private BizLoginUserDAO bizLoginUserDAO;

	/*기업 로그인*/
	@Override
	public BizLoginUserVO b_login(BizLoginUserVO vo) throws Exception {
		return bizLoginUserDAO.b_login(vo);
	}

	/*기업 로그인 체크*/
	@Override
	public int b_LoginCheck(BizLoginUserVO vo) throws Exception {
		int result=bizLoginUserDAO.b_LoginCheck(vo);		
		return result;
	}

	/*기업 사업자 번호 찾기*/
	@Override
	public String findBsmno(HttpServletResponse response, BizLoginUserVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String bsmno=bizLoginUserDAO.findBsmno(vo);
		System.out.println("bsmno: "+bsmno);
		if(bsmno==null) {
			out.println("<script>");
			out.println("alert('가입된 사업자 번호가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			return bsmno;
		}
	}

	/*기업 비밀번호 찾기 후 변경*/
	@Override
	public void bizPassChange(Map<String, Object> map, BizLoginUserVO vo) throws Exception {
		bizLoginUserDAO.bizPassChange(map, vo);
	}

	/*기업 비밀번호 변경을 위한 사업자 번호, 이메일 일치 여부*/
	@Override
	public int bizPassCheck(BizLoginUserVO vo) throws Exception {
		int result=bizLoginUserDAO.bizPassCheck(vo);
		return result;
	}

}
