package com.job.mng.biz.web;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.job.mng.biz.service.BizMngService;
import com.job.mng.biz.service.BizMngVO;
import com.job.mng.main.service.Criteria;
import com.job.mng.main.service.PageDTO;
import com.job.user.biz.join.service.BizJoinUserService;
import com.job.user.biz.join.service.BizJoinUserVO;
import com.job.user.biz.mypage.service.BizMyUserService;
import com.job.user.biz.mypage.service.BizMyUserVO;
import com.job.util.JobFileUtils;
import com.job.util.JobFileVO;

@Controller
@RequestMapping("/mng/biz/*")
public class BizMngController {

	@Resource(name = "bizJoinUserService")
	private BizJoinUserService bizJoinUserService;
	
	@Resource(name = "bizMyUserServuice")
	private BizMyUserService bizMyUserService;
	
	@Resource(name="jobFileUtils")
	private JobFileUtils jobFileUtils;

	@Resource(name="bizMngService")
	private BizMngService bms;
	
	
	// 기업 회원 목록
	@RequestMapping("/bizSelectList.do")
	private String bizSelectList(Criteria cri, Model model) {
		model.addAttribute("list", bms.getList(cri));
		int total = bms.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/mng/biz/bizSelectList";
		
	}
	
	// 기업 회원 세부 내역 페이지
	@RequestMapping(value="/bizView.do")
	private String bizMngView(int bnum, @ModelAttribute("cri") Criteria cri, Model model) {
		
		BizMngVO biz = bms.bizView(bnum);
		JobFileVO image = bms.picView(biz.getAttachid());
		model.addAttribute("biz", biz);
		model.addAttribute("image", image);
		
		return "/mng/biz/bizView";
	}
	
	// 기업 회원 수정 폼
	@RequestMapping(value="/bizMngUpdateForm.do")
	private String updateForm(int bnum, @ModelAttribute("cri") Criteria cri, Model model) {
		
		BizMngVO biz = bms.bizView(bnum);
		JobFileVO image = bms.picView(biz.getAttachid());
		model.addAttribute("biz", biz);
		model.addAttribute("image", image);
		return "/mng/biz/bizUpdateForm";
		
	}
	
	// 기업회원 입력
	@RequestMapping(value="/bizInsertForm.do")
	private String bizInsertForm() {
		
		return "/mng/biz/bizInsertForm";
	}
	
	/* 기업회원가입 post*/
	@RequestMapping(value="/bizMngInsert.do")
	public String bizMngInsert(BizJoinUserVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		int result=bizJoinUserService.bsm_no_check(vo);
		String path="job\\src\\main\\webapp\\resources\\images\\upload\\biz\\";
		List<JobFileVO> list=jobFileUtils.parseInsertFileInfo(request, path);
		vo.setPass("abcd1234!");
		try {
			if(result==1) {
				return "/mng/biz/bizInsertForm";
			} else if(result==0) {
				System.out.println("11111111111111111111");
				bizJoinUserService.insertBizImage(list.get(0));
				System.out.println("222222222222222222");
				bizJoinUserService.insertJoin(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		System.out.println("BIZMNGINSERT start...");
		rttr.addFlashAttribute("result", vo.getBnum());
		return "redirect:/mng/biz/bizSelectList.do";

	}
	
	/* 기업정보 업데이트, 이미지 업데이트 */
	@RequestMapping(value = "/bizMngUpdate.do")
	public String bizMngUpdate(BizMyUserVO vo, JobFileVO jobVO, @ModelAttribute("cri") Criteria cri, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String path = "job\\src\\main\\webapp\\resources\\images\\upload\\biz\\";
		
		List<JobFileVO> list = jobFileUtils.parseInsertFileInfo(request, path);
			try {
				System.out.println("list.size() : " + list.size());
				System.out.println("biz attachid : " + vo.getAttachid());
				if (list.size() > 0) {
					jobVO.setOriginalfilename(list.get(0).getOriginalfilename());
					jobVO.setFilesize(list.get(0).getFilesize());
					jobVO.setStoredfilename(list.get(0).getStoredfilename());
					jobVO.setAttachid(vo.getAttachid());
					bizMyUserService.bizMyUpdateImage(jobVO);
				} 
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		if (bizMyUserService.bizMyUpdate(vo) == 1) {
			rttr.addFlashAttribute("result", "success");
		}
			
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/mng/biz/bizSelectList.do";
		
	}

	/* 이미지 삭제 */
	@RequestMapping(value = "/mng/biz/ImageDel.do")
	public String bizImageDel(JobFileVO vo, HttpServletRequest request, @ModelAttribute("cri") Criteria cri, HttpServletResponse response, Model model)
			throws Exception {
		String path = "job/src/main/webapp/resources/images/upload/biz/";
		int result = jobFileUtils.myDeleteImage(vo, path, response);
		if (result == 1) {
			// 파일 디비 삭제(NULL값 받기)
			vo.setFilesize(0);
			vo.setOriginalfilename("");
			vo.setStoredfilename("");
			vo.setAttachid(vo.getAttachid());
			bizMyUserService.bizMyUpdateImage(vo);
		}
		
		BizMngVO biz = bms.bizViewbyAttachId(vo.getAttachid());
		JobFileVO image = bms.picView(biz.getAttachid());
		model.addAttribute("biz", biz);
		model.addAttribute("image", image);
		
		return "/mng/biz/bizUpdateForm";
	}
	
	/*사업자번호 중복체크*/
	@ResponseBody
	@RequestMapping(value="/bsm_no_check.do")
	public int bsm_no_check(BizJoinUserVO vo)throws Exception {
		int result=bizJoinUserService.bsm_no_check(vo);
		System.out.println("사업자번호 중복체크");
		return result;
	}
	
	
	//기업회원 삭제
	@RequestMapping(value="/remove.do", method=RequestMethod.POST)
	public String remove(@RequestParam("bnum") int bnum, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		System.out.println("remove .... " + bnum);
		if (bms.remove(bnum)) {
			rttr.addFlashAttribute("result", "success");
		} 
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/mng/biz/bizSelectList.do";
		
	}
}
