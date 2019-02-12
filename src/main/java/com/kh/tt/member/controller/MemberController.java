package com.kh.tt.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.tt.common.LoginLoggin;
import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.service.MemberService;
import com.kh.tt.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(LoginLoggin.class);
	
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
		
	
	@RequestMapping(value = "/idCheck.me", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> idCheck(@RequestBody Map<String, Object> requestBody){
		Map<String, Object> reqMap = (Map)requestBody.get("params");
		String userId = (String) reqMap.get("userId");
		logger.info("userId : " + userId);
		return ms.idCheck(userId);
	}
	
	/*@RequestMapping(value="/nickNameCheck.me", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> nickNameCheck(@RequestParam("nickName") String nickName){
		System.out.println("nickNameCheck!");
		return null;
	}*/
}
