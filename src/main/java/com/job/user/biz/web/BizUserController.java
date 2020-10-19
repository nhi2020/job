package com.job.user.biz.web;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job.user.biz.service.BizUserService;
import com.job.user.biz.service.BizUserVO;
import com.job.user.review.service.Paging;
import com.job.user.review.service.ReviewUserVO;

import org.json.simple.JSONArray;

@Controller
public class BizUserController {
	
	@Resource(name="bizUserService")
	private BizUserService bizUserService;
	
	@RequestMapping(value="/user/biz/info/bizInfo.do")
	public String bizInfo(Model model, BizUserVO vo, String currentPage) throws Exception {
		int total = bizUserService.total();
		System.out.println("total : "+total+" , currentPage : "+currentPage);
		Paging pg1 = new Paging(total, currentPage);
		vo.setStart(pg1.getStart());   // 시작시 1
		vo.setEnd(pg1.getEnd());     // 시작시 10 
		List<BizUserVO> bizInfo=bizUserService.b_info(vo);
		model.addAttribute("bizInfo", bizInfo);
		model.addAttribute("total", total);
		model.addAttribute("pg1",pg1);
		return "user/biz/info/bizInfo";
	}
	
	@ResponseBody
	@RequestMapping(value="/autocomplete.do")
	public void autocomplete(HttpServletRequest request,HttpServletResponse response,BizUserVO vo)throws Exception{
		  request.setCharacterEncoding("UTF-8");
	      response.setCharacterEncoding("UTF-8");
		try {
			List<BizUserVO> autocomplete=bizUserService.autocomplete(vo);
			if(autocomplete!=null) {
			JSONArray ja=new JSONArray();
			for(int i=0;i<autocomplete.size();i++) {
				ja.add(autocomplete.get(i).getCompany());
			}
			PrintWriter out=response.getWriter();
			out.print(ja.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
