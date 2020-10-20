package com.job.user.main.web;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.user.biz.service.BizUserVO;
import com.job.user.main.service.MainUserService;
import com.job.user.main.service.MainUserVO;

@Controller
public class MainUserController {
	
	@Resource(name="mainUserService")
	private MainUserService mainUserServie;
	
	/*메인페이지*/
	@RequestMapping(value="/user/main/main.do")
	public String main(Model model) throws Exception {
		List<BizUserVO> list=mainUserServie.selectRecommand();
		List<MainUserVO> list2=mainUserServie.selectLatest();
		model.addAttribute("list",list);
		model.addAttribute("list2", list2);
		return  "user/main/main";
	}
	
}
