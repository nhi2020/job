package com.job.user.biz.login.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.job.user.biz.login.service.BizLoginUserService;
import com.job.user.biz.login.service.BizLoginUserVO;
import com.job.user.member.login.service.MemLoginUserVO;

@Controller
public class BizLoginUserController {
	
	@Resource(name="bizLoginUserService")
	private BizLoginUserService bizLoginUserService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	/*기업로그인*/
	@RequestMapping(value="/user/biz/login/bizLoginForm.do")
	public String bizLoginForm() {
		return "user/biz/login/bizLoginForm";
	}
	
	
	/*기업 로그인 & 체크*/
	@RequestMapping(value="/user/biz/login/bizLogin.do")
	public String bizLogin(HttpSession session, BizLoginUserVO vo,HttpServletResponse response) throws Exception{
		int result= bizLoginUserService.b_LoginCheck(vo);
		String url= "user/main/main";
		if(result==1) {
			BizLoginUserVO b_user=bizLoginUserService.b_login(vo);
			session.setAttribute("b_user", b_user);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('로그인되었습니다.');</script>");
			writer.flush();
			url= "user/main/main";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('사업자 번호 또는 비밀번호를 확인해주세요.');</script>");
			writer.flush();
			url= "user/biz/login/bizLoginForm";
		}
		return url;
	}
	
	/*기업 로그아웃*/
	@RequestMapping(value="/user/biz/login/bizLogout.do")
	public String bizLogout(HttpSession session,HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('로그아웃되었습니다.');</script>");
		writer.flush();
		session.invalidate();
		return "user/main/main";
	}
	
	/*기업 사업자 번호 찾기 폼*/
	@RequestMapping(value="/user/biz/login/bizFindBsmForm.do")
	public String bizFindBsmForm() throws Exception {
		return "/user/biz/login/bizFindBsmForm";
	}
	
	/*기업 사업자 번호 찾기*/ 
	@RequestMapping(value="/user/biz/login/bizFindBsm.do")
	public String bizFindBsm(HttpServletResponse response,Model model, BizLoginUserVO vo) throws Exception{
		model.addAttribute("bsmno",bizLoginUserService.findBsmno(response, vo));
		return "/user/biz/login/bizFindBsm";
	}
	/*기업 비밀번호 찾기 폼*/
	@RequestMapping(value="/user/biz/login/bizFindPassForm.do")
	public String bizFindPassForm()throws Exception{
		return "/user/biz/login/bizFindPassForm";
	}
	
	/*기업 비밀번호 찾기 - 메일 보내기*/
	@RequestMapping(value="/user/biz/login/bizFindPass.do")
	public String bizFindPass(@RequestParam(value="email")String email,HttpServletResponse response, Model model,BizLoginUserVO vo) throws Exception {
		int result=bizLoginUserService.bizPassCheck(vo);
		if(result==1) {
		System.out.println("biz mail sending..");
		String setfrom="tkddk0119@gmail.com";
		String title="<jobara> 비밀번호 찾기 인증 이메일입니다.";
		String tempPass=(int)(Math.random() * 999999) + 1 + "";
		System.out.println("인증번호 : "+tempPass);
		String content= System.getProperty("line.separator")+ System.getProperty("line.separator")+
                "안녕하세요 회원님 jobara를 찾아주셔서 감사합니다"
                +System.getProperty("line.separator")+System.getProperty("line.separator")+
                "비밀번호 찾기 인증번호는 " +tempPass+ " 입니다. "
                +System.getProperty("line.separator")+System.getProperty("line.separator")+
                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
		try {
			MimeMessage message=mailSender.createMimeMessage();
			MimeMessageHelper messageHelper=new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(email);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		model.addAttribute("tempPass",tempPass);
		model.addAttribute("email",email);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		writer.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		writer.flush();
		
		return "/user/biz/login/bizPassEmail";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('사업자 번호 또는 이메일을 확인해주세요.'); history.go(-1);</script>");
			writer.flush();
			return "/user/biz/login/bizFindPassForm";
		}
	}
	
	/*기업 비밀번호 찾기 - 인증번호 입력 후 확인버튼 누르면 실행*/ 
	@RequestMapping(value="/user/biz/login/bizPassEmailInjeung.do")
	public String bizPassEmailInjeung(@RequestParam(value="tempPass") String tempPass, @RequestParam(value="email") String email, @RequestParam(value="injeung") String injeung, HttpServletResponse response,Model model) throws Exception{
		System.out.println("마지막 injeung : "+injeung);
		System.out.println("마지막 tempPass : "+tempPass);
		String url="/user/biz/login/bizPassChange";
		model.addAttribute("email", email);
		
		if(injeung.equals(tempPass)) {
			url="user/biz/login/bizPassChange";
			model.addAttribute("email", email);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
			writer.flush();
			
		} else if(injeung!=tempPass) {
			url="user/biz/login/bizPassEmail";
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			writer.flush();
			
		}
		return url;
	}
	
	/*기업 비밀번호 찾기 - 변경할 비밀번호 입력 후 확인 시 */ 
	@RequestMapping(value="/user/biz/login/bizPassChange.do",method=RequestMethod.POST)
	public String bizPassChange(@RequestParam(value="email") String email, @RequestParam(value="pass") String pass, BizLoginUserVO vo, HttpServletResponse response)throws Exception{
		vo.setEmail(email);
		vo.setPass(pass);
		
		Map<String, Object> map=new HashMap<>();
		map.put("email", vo.getEmail());
		map.put("pass", vo.getPass());
		
		bizLoginUserService.bizPassChange(map, vo);
		return "/user/biz/login/bizPassChangeResult";
	}
	
	
	
}
