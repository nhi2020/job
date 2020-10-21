package com.job.mng.member.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.job.mng.main.service.Criteria;
import com.job.mng.main.service.PageDTO;
import com.job.mng.member.service.MemMngService;
import com.job.mng.member.service.MemMngVO;
import com.job.user.member.join.service.MemJoinUserService;
import com.job.user.member.join.service.MemJoinUserVO;
import com.job.user.member.mypage.service.MemMyUserService;
import com.job.user.member.mypage.service.MemMyUserVO;
import com.job.util.JobFileUtils;
import com.job.util.JobFileVO;

@Controller
@RequestMapping("/mng/member/*")
public class MemMngController {

	@Resource(name = "memMngService")
	private MemMngService mms;
	
	@Resource(name="memJoinUserService")
	MemJoinUserService memJoinUserService;
	
	@Resource(name = "memMyUserService")
	private MemMyUserService memMyUserService;
	
	@Resource(name="jobFileUtils")
	private JobFileUtils jobFileUtils;
	
	// 개인 회원 목록
	@RequestMapping("/memSelectList.do")
	private String memMngList(Criteria cri, Model model) {
		System.out.println("memMngController .... memSeletList()");
		model.addAttribute("list", mms.getList(cri));
		int total = mms.getTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/mng/member/memSelectList";
		
	}
	
	
	//개인 회원 세부 내역
	@RequestMapping(value="/memView.do")
	private String memMngView(int mnum, @ModelAttribute("cri") Criteria cri, Model model) {
		
		System.out.println("memMngController .... memMngView .." + mnum);
		MemMngVO member = mms.memView(mnum);
		JobFileVO image = mms.picView(member.getAttachid());
		model.addAttribute("member", member);
		model.addAttribute("image", image);
		System.out.println(image.getStoredfilename());
		
		return "/mng/member/memView";
		
	}
	
	// 개인 회원 수정 폼
	@RequestMapping(value="/memMngUpdateForm.do")
	private String memMngUpdateForm(int mnum, @ModelAttribute("cri") Criteria cri, Model model) {
		MemMngVO member = mms.memView(mnum);
		JobFileVO image = mms.picView(member.getAttachid());
		model.addAttribute("member", member);
		model.addAttribute("image", image);
		return "/mng/member/memUpdateForm";
	}
	
	
	//개인 회원 수정 동작
	@RequestMapping(value="/memMngUpdate.do", method=RequestMethod.POST)
	public String memMngUpdate(MemMyUserVO vo, JobFileVO jobVO, @ModelAttribute("cri") Criteria cri, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String path = "job\\src\\main\\webapp\\resources\\images\\upload\\member\\";
		MemMngVO member = mms.memView(vo.getMnum());
		List<JobFileVO> list = jobFileUtils.parseInsertFileInfo(request, path);
			try {
				if (list.size() > 0) {
					jobVO.setOriginalfilename(list.get(0).getOriginalfilename());
					jobVO.setFilesize(list.get(0).getFilesize());
					jobVO.setStoredfilename(list.get(0).getStoredfilename());
					jobVO.setAttachid(vo.getAttachid());
					memMyUserService.myUpdateImage(jobVO);
				} 
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		System.out.println("vo.getCareer() : " + vo.getCareer());
		if (vo.getCareer().equals("")) {
			vo.setCareer(member.getCareer());
		}
			
		if (memMyUserService.myUpdate(vo) == 1) {
			rttr.addFlashAttribute("result", "success");
		}
			
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/mng/member/memSelectList.do";
	}
	
	/* 이미지 삭제 */
	@RequestMapping(value = "/ImageDel.do")
	public String memImageDel(JobFileVO vo, HttpServletRequest request, @ModelAttribute("cri") Criteria cri, HttpServletResponse response, Model model)
			throws Exception {
		String path = "job/src/main/webapp/resources/images/upload/member/";
		int result = jobFileUtils.myDeleteImage(vo, path, response);
		if (result == 1) {
			// 파일 디비 삭제(NULL값 받기)
			vo.setFilesize(0);
			vo.setOriginalfilename("");
			vo.setStoredfilename("");
			vo.setAttachid(vo.getAttachid());
			memMyUserService.myUpdateImage(vo);
		}
		
		MemMngVO mem = mms.memViewbyAttachId(vo.getAttachid());
		JobFileVO image = mms.picView(mem.getAttachid());
		model.addAttribute("member", mem);
		model.addAttribute("image", image);
		
		return "/mng/member/memUpdateForm";
	}
	
	//개인 회원 관리자 입력 화면
	@RequestMapping(value="/memInsertForm.do")
	private String memMngInsertForm() {

		return "/mng/member/memInsertForm";
		
	}
	
	// 관리자로 개인 회원 임의 입력
	@RequestMapping(value="/memMngInsert.do")
	public String memMngInsert(HttpServletRequest request, MemJoinUserVO vo, RedirectAttributes rttr)throws Exception{
		String path="job\\src\\main\\webapp\\resources\\images\\upload\\member\\";
		vo.setPass("abcd1234!");
		List<JobFileVO> list= jobFileUtils.parseInsertFileInfo(request, path);
		try {
			memJoinUserService.insertMemImage(list.get(0));
			memJoinUserService.insertJoin(vo);
		} catch (Exception e) {
			throw new RuntimeException();
		}
		rttr.addFlashAttribute("result", vo.getMnum());
		return "redirect:/mng/member/memSelectList.do";
	}
	
	// 개인 회원 관리자 삭제
	@RequestMapping(value="/remove.do", method=RequestMethod.POST)
	public String memMngRemove(@RequestParam("mnum") int mnum, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		System.out.println("remove..." + mnum);
		if (mms.remove(mnum)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/mng/member/memSelectList.do";
	}
	
}
