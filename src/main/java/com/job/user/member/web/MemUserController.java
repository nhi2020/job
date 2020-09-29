package com.job.user.member.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.user.member.service.MemUserService;
import com.job.user.member.service.MemUserVO;

@Controller
public class MemUserController {

	@Resource(name = "memUserService")
	private MemUserService memUserService;

	@RequestMapping("/memSelectList.do")
	public String memSelectList(Model model) throws Exception {
		List<MemUserVO> list = memUserService.list();
		model.addAttribute("list", list);
		return "user/member/memSelectList";
	}
	
	
	
}
