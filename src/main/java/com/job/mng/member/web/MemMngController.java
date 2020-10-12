package com.job.mng.member.web;

import javax.annotation.Resource;


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

@Controller
@RequestMapping("/mng/member/*")
public class MemMngController {

	@Resource(name = "memMngService")
	private MemMngService mms;
	
	@RequestMapping("/memSelectList.do")
	private String memSelectList(Criteria cri, Model model) {
		System.out.println("memMngController .... memSeletList()");
		model.addAttribute("list", mms.getList(cri));
		int total = mms.getTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/mng/member/memSelectList";
		
	}
	
	@RequestMapping(value="/memView.do")
	private String memMngView(int mnum, @ModelAttribute("cri") Criteria cri, Model model) {
		
		System.out.println("memMngController .... memMngView .." + mnum);
		model.addAttribute("member", mms.memView(mnum));
		
		return "/mng/member/memView";
		
	}
	
	@RequestMapping(value="/memMngUpdateForm.do")
	private String updateForm(int mnum, @ModelAttribute("cri") Criteria cri, Model model) {
		MemMngVO member = mms.memView(mnum);
		model.addAttribute("member", member);
		return "/mng/member/memUpdateForm";
	}
	
	
	@RequestMapping(value="/memMngUpdate.do", method=RequestMethod.POST)
	private String memMngUpdate(MemMngVO member, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if (mms.update(member)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
			
		return "redirect:/mng/member/memSelectList.do";
	}
	
	@RequestMapping(value="/memInsertForm.do")
	private void memInsertForm() {

	}
	
	@RequestMapping(value="/memMngInsert.do")
	private String memMngInsert(MemMngVO member, RedirectAttributes rttr) {
		
		System.out.println("insert : ");
		mms.insert(member);
		rttr.addFlashAttribute("result", member.getMnum());
		return "redirect:/mng/member/memSelectList.do";
	}
	
	@RequestMapping(value="/remove.do", method=RequestMethod.POST)
	public String remove(@RequestParam("mnum") int mnum, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		System.out.println("remove..." + mnum);
		if (mms.remove(mnum)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/mng/member/memSelectList.do";
	}
	
}
