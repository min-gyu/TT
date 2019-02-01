package com.kh.tt.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("goMain.me")
	public String goMain() {
		return "main/main";
	}
	
	@RequestMapping("loginView.me")
	public String showLoignView() {
		return "member/login";
	}
	
	@RequestMapping("joinView.me")
	public String showJoinView() {
		return "member/join";
	}
}
