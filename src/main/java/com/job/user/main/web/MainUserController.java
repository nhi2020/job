package com.job.user.main.web;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.user.biz.service.BizUserVO;
import com.job.user.main.service.MainUserService;

@Controller
public class MainUserController {
	
	@Resource(name="mainUserService")
	private MainUserService mainUserServie;
	
	/*메인페이지*/
	@RequestMapping(value="/user/main/main.do")
	public String main(Model model) throws Exception {
		List<BizUserVO> list=mainUserServie.selectRecommand();
		model.addAttribute("list",list);
		return  "user/main/main";
	}
	
}
