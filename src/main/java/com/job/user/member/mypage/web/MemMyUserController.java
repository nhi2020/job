package com.job.user.member.mypage.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job.user.member.mypage.service.MemMyUserService;
import com.job.user.member.mypage.service.MemMyUserVO;

@Controller
public class MemMyUserController {
	
	@Resource(name="memMyUserService")
	private MemMyUserService memMyUserService;
	
	//회원 목록
	@RequestMapping(value ="memmlist.do")
	public String memmylist(Model model) {
		System.out.println("startmem");
		List<MemMyUserVO> memmylist = memMyUserService.memmylist();
		model.addAttribute("list", memmylist);
		return "user/mypage/member/memmlist";
	}
	
	@RequestMapping(value="memmySelectList.do")
	public String memmySelect(Model model, HttpServletRequest request) {
		System.out.println("test");
		MemMyUserVO ss = memMyUserService.memmySelect(request);
		//System.out.println(sora.getId());
		//System.out.println(sora.getGender());
		model.addAttribute("ss", ss);
		return "user/mypage/member/memmySelectList";
	}

}
