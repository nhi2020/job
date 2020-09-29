package com.job.user.review.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.user.review.service.Paging;
import com.job.user.review.service.ReviewUserService;
import com.job.user.review.service.ReviewUserVO;

@Controller
public class ReviewUserController {
	@Resource(name="reviewUserService")
	private ReviewUserService reviewUserService;
	
	@RequestMapping(value="reviewSelectList.do")
	public String reviewSelectList(ReviewUserVO reviewUserVO, String currentPage, Model model) {
		int total1 = reviewUserService.total1();	
		Paging pg1 = new Paging(total1, currentPage);
		reviewUserVO.setStart(pg1.getStart());   // 시작시 1
		reviewUserVO.setEnd(pg1.getEnd());     // 시작시 10 
		List<ReviewUserVO> reviewSelectList1 = reviewUserService.reviewSelectList1(reviewUserVO);
		model.addAttribute("list1", reviewSelectList1);
		model.addAttribute("pg1",pg1);
		
		int total2 = reviewUserService.total2();	
		Paging pg2 = new Paging(total2, currentPage);
		reviewUserVO.setStart(pg2.getStart());   // 시작시 1
		reviewUserVO.setEnd(pg2.getEnd());     // 시작시 10 
		List<ReviewUserVO> reviewSelectList2 = reviewUserService.reviewSelectList2(reviewUserVO);
		model.addAttribute("list2", reviewSelectList2);
		model.addAttribute("pg2",pg2);
		
		int total3 = reviewUserService.total3();	
		Paging pg3 = new Paging(total3, currentPage);
		reviewUserVO.setStart(pg3.getStart());   // 시작시 1
		reviewUserVO.setEnd(pg3.getEnd());     // 시작시 10 
		List<ReviewUserVO> reviewSelectList3 = reviewUserService.reviewSelectList3(reviewUserVO);
		model.addAttribute("list3", reviewSelectList3);
		model.addAttribute("pg3",pg3);
		return "user/review/reviewSelectList";
	}
	
/*	@RequestMapping(value="reviewInsertForm.do")
	public String reviewInsertForm(Model model) {
		System.out.println("ReviewUserController insertEmp Start...");
		reviewUserService.reviewInsertForm();
		return "user/review/reviewInsertForm";
	}

	@RequestMapping(value="reviewDetailForm.do")
	public String reviewDetailForm(HttpServletRequest request , int rnum, Model model) {
		ReviewUserVO reviewUserVO = reviewUserService.reviewDetailForm(rnum);
		model.addAttribute("reviewUserVO",reviewUserVO);
		return "user/review/reviewDetailForm";
	} */
	
}
