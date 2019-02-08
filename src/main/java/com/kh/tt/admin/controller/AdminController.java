package com.kh.tt.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("*.ad")
public class AdminController {

	private final String memberPath = "/admin/member/";
	private final String categPath = "/admin/category/";
	private final String cloverPath = "/admin/clover/";
	private final String inquiryPath = "/admin/inquiry/";
	private final String vodPath = "/admin/vod/";
	
	// member
	@RequestMapping("adminMain")
	public String goAdminMain() {
		return memberPath + "main";
	}
	
	@RequestMapping("memberList")
	public String memberListView() {
		return memberPath + "memberList";
	}
	
	@RequestMapping("banList")
	public String BanListView() {
		return memberPath + "banList";
	}
	
	@RequestMapping("leaveList")
	public String LeaveListView() {
		return memberPath + "leaveList";
	}
	
	
	// clover
	//클로버 충전내역
	@RequestMapping("chargeClover")
	public String goCloverCharge() {
		return cloverPath + "chargeClover";
	}
	
	//클로버 환전내역
	@RequestMapping("exchangeClover")
	public String goCloverExchange() {
		return cloverPath + "exchangeClover";
	}
	
	
	// claim & inquire
	@RequestMapping("adminInquiry")
	public String InquiryView() {
		return inquiryPath + "inquiry";
	}
	
	// category

	
	

	
	@RequestMapping("adminStatistics")
	public String Statistics() {
		return "admin/statistics/statisticsday";
	}
	
	@RequestMapping("adminVod")
	public String Vod() {
		return "admin/vod/vod";
	}
	
	@RequestMapping("adminBoard")
	public String Board() {
		return "admin/board/board";
	}

	
	

	
	
}
