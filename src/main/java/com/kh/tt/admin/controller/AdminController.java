package com.kh.tt.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("adminMain.ad")
	public String goAdminMain() {
		return "admin/member/main";
	}
	
	@RequestMapping("memberList.ad")
	public String memberListView() {
		return "admin/member/memberList";
	}
	
	@RequestMapping("banList.ad")
	public String BanListView() {
		return "admin/member/banList";
	}
	
	@RequestMapping("leaveList.ad")
	public String LeaveListView() {
		return "admin/member/leaveList";
	}
	
	
}
