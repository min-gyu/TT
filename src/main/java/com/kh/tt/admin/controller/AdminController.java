package com.kh.tt.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.admin.model.service.AdminService;
import com.kh.tt.admin.model.vo.Category;
import com.kh.tt.common.PageInfo;
import com.kh.tt.common.Pagination;
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
	
	/**
	 * @author jy
	 * @category 관리자 - 회원
	 * */
	
	@RequestMapping("adminMain")
	public String goAdminMain() {
		return memberPath + "category";
	}
	
	// 1. 전체 회원 조회 
	@RequestMapping("memberList")
	public String memberList(Model model, HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = as.getAllCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Member> mList = as.selectMemberList(pi);
			model.addAttribute("mList", mList);
			request.setAttribute("pi", pi);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return memberPath + "memberList";
	}
	
	// 1. 전체 회원 - 검색
	@RequestMapping("searchAll")
	public String searchAllMember(Model model, HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("searchValue");

		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = as.getSearchAllCount(sid);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Member> mList = as.searchAllMemberList(sid, pi);
			model.addAttribute("mList", mList);
			request.setAttribute("pi", pi);
			//System.out.println(mList);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return memberPath + "memberList";
	}
	
	// 2. 정지 회원 조회
	@RequestMapping("banList")
	public String BanList(Model model, HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = as.getBanCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Member> bList = as.selectBanList(pi);
			model.addAttribute("bList", bList);
			request.setAttribute("pi", pi);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return memberPath + "banList";
	}
	
	// 2. 정지 회원 - 검색
	@RequestMapping("searchBan")
	public String searchBanMember(Model model, HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("searchValue");

		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = as.getSearchBanCount(sid);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Member> bList = as.searchBanMemberList(sid, pi);
			model.addAttribute("bList", bList);
			request.setAttribute("pi", pi);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return memberPath + "banList";
	}
	
	// 3. 탈퇴 회원 조회
	@RequestMapping("leaveList")
	public String LeaveList(Model model, HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = as.getLeaveCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Member> lList = as.selectLeaveList(pi);
			model.addAttribute("lList", lList);
			request.setAttribute("pi", pi);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return memberPath + "leaveList";
	}
	
	// 3. 탈퇴 회원 - 검색
	@RequestMapping("searchLeave")
	public String searchLeaveMember(Model model, HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("searchValue");

		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = as.getSearchLeaveCount(sid);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Member> lList = as.searchLeaveList(sid, pi);
			model.addAttribute("lList", lList);
			request.setAttribute("pi", pi);
			
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
	
	// category
	@RequestMapping("/adminCateg.ad")
	public String category(Model model) {
		try {
			List<Category> cList = as.selectCategList();
			model.addAttribute("cList", cList);
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return categPath + "category";
	}
	
}
