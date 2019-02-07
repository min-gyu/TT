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
	
	@RequestMapping("adminInquiry.ad")
	public String InquiryView() {
		return "admin/inquiry/inquiry";
	}
	
	@RequestMapping("adminStatistics.ad")
	public String Statistics() {
		return "admin/statistics/statisticsday";
	}
	
	@RequestMapping("adminVod.ad")
	public String Vod() {
		return "admin/vod/vod";
	}
	
	@RequestMapping("adminBoard.ad")
	public String Board() {
		return "admin/board/board";
	}
	
	
}
