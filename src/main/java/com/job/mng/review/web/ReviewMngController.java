package com.job.mng.review.web;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.mng.main.service.Criteria;
import com.job.mng.main.service.PageDTO;
import com.job.mng.review.service.ReviewMngService;

@Controller
@RequestMapping("/mng/review/*")
public class ReviewMngController {

	@Resource(name="reviewMngService")
	private ReviewMngService rms;
	
	@RequestMapping(value="/reviewSelectList.do")
	public String reviewSelectList(Criteria cri, Model model) {
		
		System.out.println("ReviewMngController .... reviewSelectList()");
		int saltotal = rms.getSalTotalCount(cri);
		System.out.println("reviewmngcontroller ... saltotal ==" + saltotal);
		int mrevtotal = rms.getMRevTotalCount(cri);
		System.out.println("reviewmngcontroller ... mrevtotal ==" + mrevtotal);
		int revtotal = rms.getRevTotalCount(cri);
		System.out.println("reviewmngcontroller ... revtotal ==" + revtotal);
		
		model.addAttribute("salList", rms.getSalList(cri));
		model.addAttribute("mrevList", rms.getMRevList(cri));
		model.addAttribute("revList", rms.getRevList(cri));

		model.addAttribute("salPageMaker", new PageDTO(cri, saltotal));
		model.addAttribute("mrevPageMaker", new PageDTO(cri, mrevtotal));
		model.addAttribute("revPageMaker", new PageDTO(cri, revtotal));
		
		return "/mng/review/reviewSelectList";
	}
	

	
	
}
