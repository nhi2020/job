package com.job.user.member.mypage.web;

import java.util.List;

import javax.annotation.Resource;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.job.user.member.login.service.MemLoginUserService;
import com.job.user.member.login.service.MemLoginUserVO;
import com.job.user.member.mypage.service.MemMyUserService;
import com.job.user.member.mypage.service.MemMyUserVO;

@Controller
public class MemMyUserController {

	@Resource(name = "memMyUserService")
	private MemMyUserService memMyUserService;

	@Resource(name = "memLoginUserService")
	private MemLoginUserService memLoginUserService;

	/* 개인회원 리스트 */
	@RequestMapping(value = "/user/mypage/member/memMyList.do")
	public String memMyList(Model model) {
		List<MemMyUserVO> memMyList = memMyUserService.memMyList();
		model.addAttribute("list", memMyList);
		return "user/mypage/member/memMyList";
	}

	/* 개인정보 */
	@RequestMapping(value = "/user/mypage/member/memMySelectList.do")
	public String memMySelectList(Model model) {
		/*
		 * HttpSession session=request.getSession(); MemLoginUserVO
		 * loginUser=(MemLoginUserVO)session.getAttribute("user");
		 * vo.setId(loginUser.getId()); MemMyUserVO user =
		 * memMyUserService.memMySelect(vo); model.addAttribute("user", user);
		 */
		return "user/mypage/member/memMySelectList";
	}

	/* 개인정보 업데이트 */
	@RequestMapping(value = "/user/mypage/member/memMyUpdateForm.do")
	public String memmyUpdate(Model model) {
		/*
		 * MemMyUserVO user =memMyUserService.memMySelect(vo);
		 * model.addAttribute("user",user);
		 */
		return "user/mypage/member/memMyUpdateForm";
	}

	/* 개인정보 업데이트1 */
	@RequestMapping(value = "/user/mypage/member/myUpdate.do")
	public String myupdate(MemMyUserVO vo, Model model, HttpSession session, MemLoginUserVO loginVO) {
		int result = memMyUserService.myUpdate(vo);
		if (result == 1) {
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

	/* 개입회원 탈퇴화면 */
	@RequestMapping(value = "/user/mypage/member/memMyDeleteForm.do", method = RequestMethod.GET)
	public String memMyDeleteForm() throws Exception {
		return "user/mypage/member/memMyDeleteForm";
	}

	/* 개인회원 탈퇴 */
	@RequestMapping(value = "/user/mypage/member/memMyDelete.do", method = RequestMethod.POST)
	public String memMyDelete(MemMyUserVO vo, HttpSession session, MemLoginUserVO loginVO, RedirectAttributes rttr)
			throws Exception {
		MemLoginUserVO user = (MemLoginUserVO) session.getAttribute("user");
		String sessionMyPass = user.getPass();
		String voPass = vo.getPass();
		if (!(sessionMyPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:memMyDeleteForm.do";

		}
		int result = memMyUserService.memMyDelete(vo);
		if(result ==1 ) {
			session.invalidate();
		}
				
		return "user/member/login/memLoginForm";
	}

	/* 패스워드 체크 */
	@ResponseBody
	@RequestMapping(value = "/user/mypage/member/myPassChk.do")
	public int myPassChk(MemMyUserVO vo) throws Exception {
		int result = memMyUserService.myPassChk(vo);
		return result;
	}
		
	/* 패스워드 변경화면 */
	@RequestMapping(value = "/user/mypage/member/memMyPassForm.do")
	public String memMyPassForm(Model model) {
		/*
		 * MemMyUserVO user =memMyUserService.memMySelect(vo);
		 * model.addAttribute("user",user);
		 */
		return "user/mypage/member/memMyPassForm";
	}

	
	/* 패스워드 변경 */
	@ResponseBody
	@RequestMapping(value = "/user/mypage/member/myUpdatePassChng.do")
	public int myUpdatePassChng(MemMyUserVO vo, Model model, HttpSession session, MemLoginUserVO loginVO) {
		System.out.println(vo.getPchange());
		int result = memMyUserService.myUpdatePassChng(vo);
		return result;
		
		
	}
	
	
	
}
