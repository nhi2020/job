package com.job.mng.review.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.job.mng.main.service.Criteria;
import com.job.mng.main.service.PageDTO;
import com.job.mng.review.service.ReviewMngService;
import com.job.mng.review.service.ReviewMngVO;

@Controller
@RequestMapping("/mng/review/*")
public class ReviewMngController {

	@Resource(name="reviewMngService")
	private ReviewMngService rms;
	
	@RequestMapping(value="/reviewSelectList.do")
	public String reviewMngSelectList(@ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("init", cri);
		
		return "/mng/review/reviewSelectList";
	}
	
	@RequestMapping(value="/reviewView.do")
	public String reviewMngView(int rnum, int pageNum, Model model) {
		
		ReviewMngVO review = rms.reviewViewOne(rnum);
		model.addAttribute("review", review);
		model.addAttribute("pageNum", pageNum);
		
		return "/mng/review/reviewView";
	}
	
	// 게시글에서 목록으로 복귀
	@RequestMapping(value="/returnList.do")
	public String reviewReturnList(@RequestParam("rnum") int rnum, int pageNum, RedirectAttributes rttr) {
		
		ReviewMngVO review = rms.reviewViewOne(rnum);
		String rtab = "";
		if (review.getMreview() != null) {
			rtab = "m";
		} else if (review.getSal() != null) {
			rtab = "s";
		} else {
			rtab = "r";
		}
		rttr.addFlashAttribute("rtab", rtab);
		rttr.addFlashAttribute("pageNum", pageNum);
		
		return "redirect:/mng/review/reviewSelectList.do";
	}
	
	// 리뷰 글 관리자 권한으로 삭제(실제는 수정).
	@RequestMapping(value="/reviewMngRemove.do")
	public String reviewMngRemove(@RequestParam("rnum") int rnum, int pageNum, RedirectAttributes rttr) {
		
		if (rms.reviewMngRemove(rnum)==1) {
			rttr.addFlashAttribute("result", "success");
		} 
		ReviewMngVO review = rms.reviewViewOne(rnum);
		String rtab = "";
		if (review.getMreview() != null) {
			rtab = "m";
		} else if (review.getSal() != null) {
			rtab = "s";
		} else {
			rtab = "r";
		}
		rttr.addFlashAttribute("rtab", rtab);
		rttr.addFlashAttribute("pageNum", pageNum);
		
		return "redirect:/mng/review/reviewSelectList.do";
	}
	
}
