package com.job.user.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BizLoginInterCeptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		
		System.out.println("biz preHandle start .....");
		
		HttpSession session=request.getSession();
		
		Object obj=session.getAttribute("b_user");
		if(obj==null){
			response.sendRedirect("/user/biz/login/bizLoginForm.do");
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		super.postHandle(request, response, handler, modelAndView);
		System.out.println("biz postHandle start .....");
	}
}
