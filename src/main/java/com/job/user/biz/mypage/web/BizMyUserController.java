package com.job.user.biz.mypage.web;

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

import com.job.user.biz.login.service.BizLoginUserService;
import com.job.user.biz.login.service.BizLoginUserVO;
import com.job.user.biz.mypage.service.BizMyUserService;
import com.job.user.biz.mypage.service.BizMyUserVO;

import com.job.util.JobFileUtils;
import com.job.util.JobFileVO;

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

	/* 기업정보 업데이트 폼 */
	@RequestMapping(value = "/user/mypage/biz/bizMyUpdateForm.do")
	public String bizMyUpdateForm() throws Exception {
		return "user/mypage/biz/bizMyUpdateForm";
	}

	/* 기업정보 업데이트, 이미지 업데이트 */
	@RequestMapping(value = "/user/mypage/biz/bizMyUpdate.do")
	public String bizMyUpdate(BizMyUserVO vo, JobFileVO jobVO, BizLoginUserVO loginVO, Model model, HttpSession session,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		session = request.getSession();
		int result = bizMyUserServuice.bizMyUpdate(vo);
		String path = "job\\src\\main\\webapp\\resources\\images\\upload\\biz\\";
		List<JobFileVO> list = jobFileUtils.parseInsertFileInfo(request, path);
		if (result == 1) {
			try {
				session.removeAttribute("b_user");
				loginVO.setBsmno(vo.getBsmno());
				loginVO.setPass(vo.getPass());
				BizLoginUserVO b_user = bizLoginUserService.b_login(loginVO);
				jobVO.setAttachid(b_user.getAttachid());
				System.out.println("list.size() : " + list.size());
				if (list.size() > 0) {
					jobVO.setOriginalfilename(list.get(0).getOriginalfilename());
					jobVO.setFilesize(list.get(0).getFilesize());
					jobVO.setStoredfilename(list.get(0).getStoredfilename());
					bizMyUserServuice.bizMyUpdateImage(jobVO);
					b_user.setOriginalfilename(list.get(0).getOriginalfilename());
					b_user.setStoredfilename(list.get(0).getStoredfilename());
					b_user.setFilesize(list.get(0).getFilesize());
				}
				session.setAttribute("b_user", b_user);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('수정되었습니다.');</script>");
		writer.flush();
		return "user/mypage/biz/bizMySelectList";
	}

	/* 이미지 삭제 */
	@RequestMapping(value = "/user/mypage/biz/myImageDel.do")
	public String bizImageDel(JobFileVO vo, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String path = "job/src/main/webapp/resources/images/upload/biz/";
		int result = jobFileUtils.myDeleteImage(vo, path, response);
		if (result == 1) {
			// 파일 디비 삭제(NULL값 받기)
			HttpSession session = request.getSession();
			BizLoginUserVO b_user = (BizLoginUserVO) session.getAttribute("b_user");
			session.removeAttribute("b_user");
			b_user.setOriginalfilename("");
			b_user.setStoredfilename("");
			b_user.setFilesize(0);
			session.setAttribute("b_user", b_user);
			vo.setFilesize(0);
			vo.setOriginalfilename("");
			vo.setStoredfilename("");
			vo.setAttachid(b_user.getAttachid());
			bizMyUserServuice.bizMyUpdateImage(vo);

		}
		return "user/mypage/biz/bizMyUpdateForm";
	}

	/* 기업회원 탈퇴화면 */
	@RequestMapping(value = "/user/mypage/biz/bizMyDeleteForm.do", method = RequestMethod.GET)
	public String bizMyDeleteForm() throws Exception {
		return "user/mypage/biz/bizMyDeleteForm";
	}

	/* 기업회원 탈퇴 */
	@RequestMapping(value = "/user/mypage/biz/bizMyDelete.do", method = RequestMethod.POST)
	public void bizMyDelete(BizMyUserVO vo, HttpSession session, BizLoginUserVO loginVO, HttpServletResponse response)
			throws Exception {
		BizLoginUserVO b_user = (BizLoginUserVO) session.getAttribute("b_user");
		String sessionMyPass = b_user.getPass();
		String voPass = vo.getPass();
		if (!(sessionMyPass.equals(voPass))) {
			response.sendRedirect("/user/mypage/biz/bizMyDeleteForm.do");

		} else {
			int result = bizMyUserServuice.bizMyDelete(vo);
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
	@RequestMapping(value = "/user/mypage/biz/bizPassChk.do")
	public int bizPassChk(BizMyUserVO vo) throws Exception {
		int result = bizMyUserServuice.bizPassChk(vo);
		return result;
	}

	/* 비밀번호 변경화면 */
	@RequestMapping(value = "/user/mypage/biz/bizMyPassForm.do")
	public String bizMyPassForm(Model model) throws Exception {
		return "user/mypage/biz/bizMyPassForm";
	}

	/* 비밀번호 업데이트 */
	@RequestMapping(value = "/user/mypage/biz/bizMyUpdatePassChng.do")
	public void bizMyUpdatePassChng(BizMyUserVO vo, Model model, HttpSession session, BizLoginUserVO loginVO,
			HttpServletResponse response) throws Exception {

		int result = 0;
		int passCheck = bizMyUserServuice.bizPassChk(vo);

		if (passCheck == 1) {
			result = bizMyUserServuice.bizMyUpdatePassChng(vo);
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
