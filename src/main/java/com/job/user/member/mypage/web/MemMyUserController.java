package com.job.user.member.mypage.web;


import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job.user.member.mypage.service.MemMyUserService;
import com.job.user.member.mypage.service.MemMyUserVO;

@Controller
public class MemMyUserController {
	private static final Logger logger = LoggerFactory.getLogger(MemMyUserController.class);
	
	@Resource(name = "memMyUserService")
	private MemMyUserService memMyUserService;

	/* 회원 정보리스트*/
	@RequestMapping(value = "/memmlist.do")
	public String memmylist(Model model) {
		System.out.println("startmem");
		List<MemMyUserVO> memmylist = memMyUserService.memmylist();
		model.addAttribute("list", memmylist);
		return "user/mypage/member/memmylist";
	}

	/* 개인정보*/
	@RequestMapping(value = "/memmySelectList.do")
	public String memmySelect(Model model, HttpServletRequest request, String id) {
		System.out.println("test");
		MemMyUserVO ss = memMyUserService.memmySelect(id);
		// System.out.println(sora.getId());
		// System.out.println(sora.getGender());
		model.addAttribute("ss", ss);
		return "user/mypage/member/memmySelectList";
	}

	/*회원정보 수정 업데이트*/
	@RequestMapping(value = "/memmyUpdateForm.do")
	public String memmyUpdate(String id , Model model) {
		MemMyUserVO vo =memMyUserService.memmySelect(id);
		model.addAttribute("vo",vo);
		return "user/mypage/member/memmyUpdateForm";
	}
	
	/*회원정보 수정*/
	@RequestMapping(value="/myupdate.do", method = RequestMethod.POST)
	public String myupdate(MemMyUserVO vo, Model model) {
		System.out.println("33333333333");
		int k =memMyUserService.myupdate(vo);
		model.addAttribute("k",k);
		model.addAttribute("kk3","Message Test");
		return "forward:memmySelectList.do";
	}
	/*비밀번호 변경폼*/
	@RequestMapping(value="memmypassForm.do")
	public String passForm(String id, Model model ) {
		MemMyUserVO vo =memMyUserService.memmySelect(id);
		model.addAttribute("vo",vo);
		return"user/mypage/member/memmypassForm";
	}
	
	/*비밀번호 변경*/ 
	@RequestMapping(value ="/passchange.do")
	public String passchange(MemMyUserVO vo, Model model) throws Exception{
		logger.info("비밀번호 변경 요청");
		//memMyUserService.passchange(vo);
		MemMyUserVO vo2= new MemMyUserVO();
		
		
		return"changeSuccess";
	}
}
