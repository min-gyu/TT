package com.kh.tt.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

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

	
}

