package com.job.user.biz.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.user.biz.service.BizUserService;
import com.job.user.biz.service.BizUserVO;

@Controller
public class BizUserController {
	
	@Resource(name="bizUserService")
	private BizUserService bizUserService;
	
	@RequestMapping(value="/user/biz/info/bizInfo.do")
	public String bizInfo(Model model, BizUserVO vo) throws Exception {
		BizUserVO bizInfo=bizUserService.b_info(vo);
		model.addAttribute("bizInfo", bizInfo);
		return "user/biz/info/bizInfo";
	}
}
