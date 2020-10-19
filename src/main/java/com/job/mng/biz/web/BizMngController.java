package com.job.mng.biz.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.job.mng.biz.service.BizMngService;
import com.job.mng.biz.service.BizMngVO;
import com.job.mng.main.service.Criteria;
import com.job.mng.main.service.PageDTO;

@Controller
@RequestMapping("/mng/biz/*")
public class BizMngController {

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
		
		model.addAttribute("biz", bms.bizView(bnum));
		
		return "/mng/biz/bizView";
	}
	
	// 기업 회원 수정 폼
	@RequestMapping(value="/bizMngUpdateForm.do")
	private String updateForm(int bnum, @ModelAttribute("cri") Criteria cri, Model model) {
		
		BizMngVO biz = bms.bizView(bnum);
		model.addAttribute("biz", biz);
		return "/mng/biz/bizUpdateForm";
		
	}
	
	// 기업회원 수정 동작
	@RequestMapping(value="/bizMngUpdate.do", method=RequestMethod.POST)
	private String bizMngUpdate(BizMngVO biz, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if (bms.update(biz)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
	
		return "redirect:/mng/biz/bizSelectList.do";
	}
	
	// 기업회원 입력
	@RequestMapping(value="/bizInsertForm.do")
	private void bizInsertForm() {
		
	}
	
	
	//기업회원 정보 입력 동작
	@RequestMapping(value="/bizMngInsert.do")
	private String bizMngInsert(BizMngVO biz, RedirectAttributes rttr) {
		
		System.out.println("insert : ");
		bms.insert(biz);
		rttr.addFlashAttribute("result", biz.getBnum());
		return "redirect:/mng/biz/bizSelectList.do";
		
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
