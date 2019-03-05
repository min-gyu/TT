package com.kh.tt.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.admin.model.service.AdminService;
import com.kh.tt.admin.model.vo.AdClover;
import com.kh.tt.admin.model.vo.Category;
import com.kh.tt.admin.model.vo.VodLog;
import com.kh.tt.common.PageInfo;
import com.kh.tt.common.Pagination;
import com.kh.tt.member.model.vo.CQAndAttach;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Exchange;
import com.kh.tt.myPage.model.vo.Payment;
import com.kh.tt.myPage.model.vo.PtClover;
import com.kh.tt.subscribe.model.vo.Subscribe;

@Controller
@RequestMapping("*.ad")
public class AdminController {

	private final String memberPath 	= "/admin/member/";
	private final String categPath 		= "/admin/category/";
	private final String cloverPath 	= "/admin/clover/";
	private final String cqPath 		= "/admin/cq/";
	private final String vodPath 		= "/admin/vod/";
	
	
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
	public String goCloverCharge(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//리스트 카운트
			int listCount = as.getChargeClover();
			System.out.println("listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//충전내역 - 리스트
			List<Payment> chargeList = as.selectChargeCloverList(pi);
			
			model.addAttribute("chargeList", chargeList);
			System.out.println("가져온리스트! "+chargeList);
			
			request.setAttribute("pi", pi);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		
		return cloverPath + "chargeClover";
	}
	
	//클로버 환전내역 - 환전신청내역
	@RequestMapping("exchangeClover")
	public String goCloverExchange(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//리스트 카운트
			int listCount = as.getExchangeClover();
			System.out.println("listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//환전신청내역 - 리스트
			List<Exchange> exchangeList = as.selectExchangeCloverList(pi);
			
			model.addAttribute("exchangeList", exchangeList);
			System.out.println("가져온리스트! "+exchangeList);
			
			request.setAttribute("pi", pi);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		
		
		return cloverPath + "exchangeClover";
	}

	
	//환전 수락
	@RequestMapping("/okayExchange")
	public String okayExchange(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String[] ar=request.getParameterValues("arr1[]"); 
		System.out.println("String배열 크기 : "+ ar.length);
		
		int[] arr = new int[ar.length]; //정수배열 초기화
		
		for(int i=0;i<ar.length;i++) {
			//int형으로 변환 후 배열에 담기
			arr[i] = Integer.parseInt(ar[i]);
		}
		
		for(int i=0;i<ar.length;i++) {
			System.out.println("arr["+i+"] : "+arr[i]);
		}
		
		//환전수락
		int result;
		try {
			result = as.updateExchangeStatus(arr);
			
			if(result!=0) {
				response.getWriter().print("성공");
			}else {
				response.getWriter().print("실패");
			}
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		
		return cloverPath + "exchangeClover";
	}
	
	//클로버 환전내역 - 환전완료내역
	@RequestMapping("/exchangeClover2")
	public String exchangeClover2(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//리스트 카운트
			int listCount = as.getExchange2Clover();
			System.out.println("listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//환전완료내역 - 리스트
			List<Exchange> exchange2List = as.selectExchange2CloverList(pi);
			
			model.addAttribute("exchange2List", exchange2List);
			System.out.println("환전완료 가져온리스트! "+exchange2List);
			
			request.setAttribute("pi", pi);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		
		return cloverPath + "exchangeClover2";
	}
	
	
	@RequestMapping("adminStatistics")
	public String Statistics() {
		return "admin/statistics/statisticsday";
	}
	
	//VOD 다중삭제 메소드-관리자
	@RequestMapping("deleteAvod.ad")
		public String deleteAvod(Model model, HttpServletRequest request, HttpServletResponse response) {
		String[] ar=request.getParameterValues("arr1[]");
		System.out.println("String배열 크기 : "+ ar.length);
		
		int[] arr = new int[ar.length]; //정수배열 초기화-게시판 번호 목록임
		
		for(int i=0;i<ar.length;i++) {
			//int형으로 변환 후 배열에 담기
			arr[i] = Integer.parseInt(ar[i]);
		}
		
		for(int i=0;i<ar.length;i++) {
			System.out.println("arr["+i+"] : "+arr[i]);
		}
		
		
		int result;
		result=as.deleteAvod(arr);
		System.out.println("결과 확인 : "+result);
		try {
		if(result!=0) {
			response.getWriter().print("성공");
		}else {
			response.getWriter().print("실패");
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vodPath+"vod"; 
	}
	
	//VOD 전체 VOD 출력 메소드
	@RequestMapping("/adminVod")
	public String Vod(Model model, HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//리스트 카운트
			int listCount = as.getAVod();
			System.out.println("listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//충전내역 - 리스트
			List<com.kh.tt.channel.model.vo.Board> list;
			list=as.totalVod(pi);
			model.addAttribute("list", list);
			
			request.setAttribute("pi", pi);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/vod/vod";
	}
	
	@RequestMapping("adminDeleteVod")
	public String adminDeleteVod(Model model, HttpServletRequest request, HttpServletResponse response) {
int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//리스트 카운트
			int listCount = as.getadminDVod();//관리자가 삭제한 vod이력
			System.out.println("listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//vod - 리스트
			List<VodLog> list;
			list=as.totalAdminD(pi);
			System.out.println("삭제 리스트 : "+list);
			model.addAttribute("list", list);
			
			request.setAttribute("pi", pi);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/vod/vod2";
	}
	
	
	@RequestMapping("/adminBoard")
	public String Board() {
		return "admin/board/board";
	}
	
	
	// category
	@RequestMapping("/adminCateg")
	public String category(Model model) {
		try {
			List<Category> cList = as.selectCategList();
			model.addAttribute("cList", cList);
			//System.out.println(cList);
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return categPath + "category";
	}
	
	// 모달 세부 카테고리
	@RequestMapping("/detailCateg")
	public @ResponseBody List<Category> detailCateg(Model model, HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		List<Category> dcList = as.detailCateg(num);
		model.addAttribute("dcList", dcList);
		
		System.out.println("list > " + dcList);
		System.out.println(" 조회 결과 리스트사이즈 > " + dcList.size());
		
		return dcList;
	}
	
	
	// claim & inquire
	@RequestMapping("/claimList")
	public String claimList(Model model, HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		try {
			int listCount = as.getClaimCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<CQAndAttach> cList = as.selectClaimList(pi);
			
			model.addAttribute("cList", cList);
			request.setAttribute("pi", pi);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		return cqPath + "claimList";
	}
		
	
	@RequestMapping("/questionList")
	public String questionList(Model model, HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		try {
			int listCount = as.getQCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<CQAndAttach> qList = as.selectQuestionList(pi);
			
			model.addAttribute("qList", qList);
			request.setAttribute("pi", pi);
			
		} catch (AdminException e) {
			e.printStackTrace();
		}
		
		return cqPath + "questionList";
	}
		
	// 신고 상세보기
	@RequestMapping("/claimOne")
	public String claimOne(Model model, HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("no > "  +no);
		
		CQAndAttach ca = as.claimOne(no);
		model.addAttribute("ca", ca);
		
		return cqPath + "claimDetail";
	}
	
	// 유효한 신고 로직
	@RequestMapping("/correctClaim")
	public String correctClaim(@RequestParam int cno, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(cno);
		
		as.targetBanCount(cno);		// 경고 +1
		as.claimReward(cno);			// 보상 +10
		as.updateTotalClover(cno);	// 총 클로버 +10
		
		return "redirect:/claimList.ad";
	}
	
	// 문의 상세보기
	@RequestMapping("/questionOne")
	public String questionOne(Model model, HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("no > "  +no);
		
		CQAndAttach ca = as.questionOne(no);
		model.addAttribute("ca", ca);
		
		return cqPath + "questionDetail";
	}
	
	// 댓글 작성
	@RequestMapping("questionReply")
	public ModelAndView questionReply(Model model, HttpServletRequest request, HttpServletResponse response) {
		int qno = Integer.parseInt(request.getParameter("qno"));
		String content = request.getParameter("content");
		
		System.out.println("qno >" + qno );
		System.out.println("content >" + content );
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qno", qno);
		map.put("content", content);
		
		as.questionReply(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/cq/questionDetail");
		
		return mav;
	}
	
	// 댓글 리스트
	@RequestMapping("qReplyList")
	public @ResponseBody List<CQAndAttach> qReplyList(Model model, HttpServletRequest request, HttpServletResponse response) {
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		List<CQAndAttach> rList = as.qReplyList(qno);
		
		System.out.println("rList > " + rList);
		System.out.println(" 조회 결과 리스트사이즈 > " + rList.size());
		
		return rList;
	}
	
}