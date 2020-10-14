package com.job.user.member.mypage.web;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.job.util.JobFileUtils;
import com.job.util.JobFileVO;

@Controller
public class MemMyUserController {

	@Resource(name = "memMyUserService")
	private MemMyUserService memMyUserService;

	@Resource(name = "memLoginUserService")
	private MemLoginUserService memLoginUserService;

	@Resource(name = "jobFileUtils")
	private JobFileUtils jobFileUtils;

	/* 개인회원 리스트 */
	@RequestMapping(value = "/user/mypage/member/memMyList.do")
	public String memMyList(Model model) throws Exception {
		List<MemMyUserVO> memMyList = memMyUserService.memMyList();
		model.addAttribute("list", memMyList);
		return "user/mypage/member/memMyList";
	}

	/* 개인정보 */
	@RequestMapping(value = "/user/mypage/member/memMySelectList.do")
	public String memMySelectList(Model model) throws Exception {
		/*
		 * HttpSession session=request.getSession(); MemLoginUserVO
		 * loginUser=(MemLoginUserVO)session.getAttribute("user");
		 * vo.setId(loginUser.getId()); MemMyUserVO user =
		 * memMyUserService.memMySelect(vo); model.addAttribute("user", user);
		 */
		return "user/mypage/member/memMySelectList";
	}

	/* 개인정보 업데이트 폼 */
	@RequestMapping(value = "/user/mypage/member/memMyUpdateForm.do")
	public String memmyUpdate(Model model) throws Exception {
		/*
		 * MemMyUserVO user =memMyUserService.memMySelect(vo);
		 * model.addAttribute("user",user);
		 */
		return "user/mypage/member/memMyUpdateForm";
	}

	/* 개인정보 업데이트,이미지 업데이트 */
	@RequestMapping(value = "/user/mypage/member/myUpdate.do")
	public String myupdate(MemMyUserVO vo, JobFileVO jobVO, MemLoginUserVO loginVO, Model model, HttpSession session,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		session = request.getSession();
		int result = memMyUserService.myUpdate(vo);
		String path = "job\\src\\main\\webapp\\resources\\images\\upload\\member\\";
		List<JobFileVO> list = jobFileUtils.parseInsertFileInfo(request, path);
		if (result == 1) {
			try {
				session.removeAttribute("user");
				loginVO.setId(vo.getId());
				loginVO.setPass(vo.getPass());
				MemLoginUserVO user = memLoginUserService.user(loginVO);
				jobVO.setAttachid(user.getAttachid());
				if(list.size() > 0) {
					jobVO.setOriginalfilename(list.get(0).getOriginalfilename());
					jobVO.setFilesize(list.get(0).getFilesize());
					jobVO.setStoredfilename(list.get(0).getStoredfilename());
					memMyUserService.myUpdateImage(jobVO);
					user.setOriginalfilename(list.get(0).getOriginalfilename());
					user.setStoredfilename(list.get(0).getStoredfilename());
					user.setFilesize(list.get(0).getFilesize());
				}
				session.setAttribute("user", user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('수정되었습니다.');</script>");
		writer.flush();
		return "forward:memMySelectList.do";
	}

	/* 이미지 삭제 */
	@RequestMapping(value = "/user/mypage/member/myImageDel.do")
	public String myImageDel(JobFileVO vo, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String path = "job/src/main/webapp/resources/images/upload/member/";
		int result = jobFileUtils.myDeleteImage(vo, path, response);
		if (result == 1) {
			// 파일 디비 삭제(NULL값 받기)
			HttpSession session = request.getSession();
			MemLoginUserVO user = (MemLoginUserVO) session.getAttribute("user");
			session.removeAttribute("user");
			user.setOriginalfilename("");
			user.setStoredfilename("");
			user.setFilesize(0);
			session.setAttribute("user", user);
			vo.setFilesize(0);
			vo.setOriginalfilename("");
			vo.setStoredfilename("");
			vo.setAttachid(user.getAttachid());
			memMyUserService.myUpdateImage(vo);

		}
		return "user/mypage/member/memMyUpdateForm";
	}

	/* 개입회원 탈퇴화면 */
	@RequestMapping(value = "/user/mypage/member/memMyDeleteForm.do", method = RequestMethod.GET)
	public String memMyDeleteForm() throws Exception {
		return "user/mypage/member/memMyDeleteForm";
	}

	/* 개인회원 탈퇴 */
	@RequestMapping(value = "/user/mypage/member/memMyDelete.do", method = RequestMethod.POST)
	public void memMyDelete(MemMyUserVO vo, HttpSession session, MemLoginUserVO loginVO, HttpServletResponse response)
			throws Exception {
		MemLoginUserVO user = (MemLoginUserVO) session.getAttribute("user");
		String sessionMyPass = user.getPass();
		String voPass = vo.getPass();
		if (!(sessionMyPass.equals(voPass))) {
			/* rttr.addFlashAttribute("msg", false); */
			response.sendRedirect("/user/mypage/member/memMyDeleteForm.do");

		} else {
			int result = memMyUserService.memMyDelete(vo);
			if (result == 1) {
				session.invalidate();
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('탈퇴되었습니다.');</script>");
				writer.println("<script>location.href='/user/main/main.do';</script>");
				writer.flush();
			}
		}

	}

	/* 비밀번호 체크 */
	@ResponseBody
	@RequestMapping(value = "/user/mypage/member/myPassChk.do")
	public int myPassChk(MemMyUserVO vo) throws Exception {
		int result = memMyUserService.myPassChk(vo);
		return result;
	}

	/* 비밀번호 변경화면 */
	@RequestMapping(value = "/user/mypage/member/memMyPassForm.do")
	public String memMyPassForm(Model model) throws Exception {
		/*
		 * MemMyUserVO user =memMyUserService.memMySelect(vo);
		 * model.addAttribute("user",user);
		 */
		return "user/mypage/member/memMyPassForm";
	}

	/* 비밀번호 업데이트 */
	@RequestMapping(value = "/user/mypage/member/myUpdatePassChng.do")
	public void myUpdatePassChng(MemMyUserVO vo, Model model, HttpSession session, MemLoginUserVO loginVO,
			HttpServletResponse response) throws Exception {

		int result = 0;
		int passCheck = memMyUserService.myPassChk(vo);

		if (passCheck == 1) {
			result = memMyUserService.myUpdatePassChng(vo);
			if (result == 0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('비밀번호 변경이 실패 했습니다.');  history.back();</script>");
				writer.flush();
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('비밀번호 변경 되었습니다.');</script>");
				writer.println("<script>location.href='/user/main/main.do';</script>");
				writer.flush();
			}
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('비밀번호가 일치하지 않습니다.');  history.back();</script>");
			writer.flush();
		}

	}

}
