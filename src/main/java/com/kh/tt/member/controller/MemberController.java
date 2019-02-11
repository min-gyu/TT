package com.kh.tt.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.service.MemberService;
import com.kh.tt.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	private final String jspPath = "/member/";

	@RequestMapping("goMain.me")
	public String goMain() {
		return "main/mainPage";
	}

	@RequestMapping("loginView.me")
	public String showLoignView() {
		return jspPath + "login";
	}

	@RequestMapping("joinView.me")
	public String showJoinView() {
		return jspPath + "join";
	}

	@RequestMapping("reportView.me")
	public String showReportView() {
		return jspPath + "report";
	}

	@RequestMapping("inquireView.me")
	public String showInquireView() {
		return jspPath + "inquire";
	}

	@RequestMapping("login.me")
	public String loginCheck(Member m, Model model) {
		try {
			Member loginUser = ms.loginMember(m);
			model.addAttribute("loginUser", loginUser);
			return "redirect:goMain.me";
			
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		// 세션의 상태를 확정지어주는 메소드
		status.setComplete();
		
		return "redirect:goMain.me";
	}
	
	@RequestMapping("insertMember.me")
	public String insertMember(Member m, Model model) {
		
		System.out.println("member > " + m);
		
		String encPassword = passwordEncoder.encode(m.getUserPwd());
		
		System.out.println("변경 후 암호 > " + encPassword);
		
		m.setUserPwd(encPassword);
		
		int result = ms.insertMember(m);
		
		if (result > 0) {
			return "redirect:goMain.me";
		} else {
			model.addAttribute("msg", "회원가입 실패 8ㅁ8");
			return "common/errorPage";
		}
	}
	
	// 회원 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck.me", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
	 
	 String userId = req.getParameter("userId");
	 Member idCheck = ms.idCheck(userId);
	 
	 int result = 0;
	 
	 if(idCheck != null) {
		 result = 1;
	 } 
	 
	 return result;
	}
	
	
	

}
