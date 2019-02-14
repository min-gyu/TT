package com.kh.tt.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.admin.model.service.AdminService;
import com.kh.tt.member.model.vo.Member;

@Controller
@RequestMapping("*.ad")
public class AdminController {

	private final String memberPath = "/admin/member/";
	private final String categPath = "/admin/category/";
	private final String cloverPath = "/admin/clover/";
	private final String inquiryPath = "/admin/inquiry/";
	private final String vodPath = "/admin/vod/";
	
	@Autowired
	private AdminService as;
	
	// ADMIN - MEMBER
	@RequestMapping("adminMain")
	public String goAdminMain() {
		return memberPath + "main";
	}
	
	// 전체 회원 조회 
	@RequestMapping("memberList")
	public String memberList(Model model) {
		try {
			List<Member> mList = as.selectMemberList();
			model.addAttribute("mList", mList);
			System.out.println(mList);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return memberPath + "memberList";
	}
		
	@RequestMapping("banList")
	public String BanList(Model model) {
		try {
			List<Member> bList = as.selectBanList();
			model.addAttribute("bList", bList);
			System.out.println(bList);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return memberPath + "banList";
	}
	
	@RequestMapping("leaveList")
	public String LeaveList(Model model) {
		try {
			List<Member> lList = as.selectLeaveList();
			model.addAttribute("lList", lList);
			System.out.println(lList);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return memberPath + "leaveList";
	}
	
	
	// ADMIN - CLOVER
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
