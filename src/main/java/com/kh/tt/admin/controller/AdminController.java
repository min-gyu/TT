package com.kh.tt.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	private final String memberP = "/admin/member/";
	
	/*
	private final String categP = "/admin/category/";
	private final String cloverP = "/admin/clover/";
	private final String ClaimP = "/admin/claim/";
	*/
	
	@RequestMapping("adminMain.ad")
	public String goAdminMain() {
		return memberP + "main";
	}
	
	@RequestMapping("memberList.ad")
	public String memberListView() {
		return memberP + "memberList";
	}
	
	@RequestMapping("banList.ad")
	public String BanListView() {
		return memberP + "banList";
	}
	
	@RequestMapping("leaveList.ad")
	public String LeaveListView() {
		return memberP + "leaveList";
	}
	
	
}
