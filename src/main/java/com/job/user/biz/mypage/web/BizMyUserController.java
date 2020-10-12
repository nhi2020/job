package com.job.user.biz.mypage.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.user.biz.login.service.BizLoginUserService;
import com.job.user.biz.mypage.service.BizMyUserService;
import com.job.util.JobFileUtils;

@Controller
public class BizMyUserController {

	@Resource(name = "bizMyUserServuice")
	private BizMyUserService bizMyUserServuice;

	@Resource(name = "bizLoginUserService")
	private BizLoginUserService bizLoginUserService;

	@Resource(name = "jobFileUtils")
	private JobFileUtils jobFileUtils;

	/* 기업개인정보 */
	@RequestMapping(value = "/user/mypage/biz/bizMySelectList.do")
	public String bizMySelectList(Model model) {
		return "user/mypage/biz/bizMySelectList";
	}
}
