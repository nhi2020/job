package com.job.user.member.mypage.web;


import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job.user.member.login.service.MemLoginUserService;
import com.job.user.member.login.service.MemLoginUserVO;
import com.job.user.member.mypage.service.MemMyUserService;
import com.job.user.member.mypage.service.MemMyUserVO;

@Controller
public class MemMyUserController {
	private static final Logger logger = LoggerFactory.getLogger(MemMyUserController.class);
	
	@Resource(name = "memMyUserService")
	private MemMyUserService memMyUserService;
	
	@Resource(name = "memLoginUserService")
	private MemLoginUserService memLoginUserService;
	
	/* 회원 정보리스트*/
	@RequestMapping(value = "/user/member/mypage/memMyList.do")
	public String memMyList(Model model) {
		List<MemMyUserVO> memMyList = memMyUserService.memMyList();
		model.addAttribute("list", memMyList);
		return "user/mypage/member/memMyList";
	}

	/* 개인정보*/
	@RequestMapping(value = "/user/member/mypage/memMySelectList.do")
	public String memMySelectList(Model model) {
		/*HttpSession session=request.getSession();
		MemLoginUserVO loginUser=(MemLoginUserVO)session.getAttribute("user");
		vo.setId(loginUser.getId());
		MemMyUserVO user = memMyUserService.memMySelect(vo);
		// System.out.println(sora.getId());
		// System.out.println(sora.getGender());
		model.addAttribute("user", user);*/
		return "user/mypage/member/memMySelectList";
	}

	/*회원정보 수정 업데이트*/
	@RequestMapping(value = "/user/member/mypage/memMyUpdateForm.do")
	public String memmyUpdate(Model model) {
		/*MemMyUserVO user =memMyUserService.memMySelect(vo);
		model.addAttribute("user",user);*/
		return "user/mypage/member/memMyUpdateForm";
	}
	
	/*회원정보 수정*/
	@RequestMapping(value="/user/member/mypage/myUpdate.do")
	public String myupdate(MemMyUserVO vo, Model model, HttpSession session, MemLoginUserVO loginVO) {
		int result=memMyUserService.myUpdate(vo);
		if(result==1){
			try {
				session.removeAttribute("user");
				loginVO.setId(vo.getId());
				loginVO.setPass(vo.getPass());
				MemLoginUserVO user = memLoginUserService.user(loginVO);
				session.setAttribute("user", user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "forward:memMySelectList.do";
	}
	/*비밀번호 변경폼*/
	/*@RequestMapping(value="/user/member/mypage/memMyPassForm.do")
	public String passForm(MemMyUserVO vo, Model model ) {
		MemMyUserVO user =memMyUserService.memMySelect(vo);
		model.addAttribute("user",user);
		return"user/mypage/member/memMyPassForm";
	}*/
	
	/*비밀번호 변경*/ 
	/*@RequestMapping(value ="/user/member/mypage/passChange.do")
	public String passchange(MemMyUserVO vo, Model model) throws Exception{
		logger.info("비밀번호 변경 요청");
		//memMyUserService.passchange(vo);
		MemMyUserVO vo2= new MemMyUserVO();
		return"user/mypage/member/passChange";
	}*/
}
