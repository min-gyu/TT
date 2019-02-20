package com.kh.tt.myPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.common.PageInfo;
import com.kh.tt.common.Pagination;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.service.MyPageService;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;
import com.kh.tt.myPage.model.vo.PtClover;

@Controller
public class MyPageController {
	
	//의존성 주입용 필드선언
	@Autowired
	private MyPageService mps;

	
	//개인정보 수정페이지 - 비밀번호 확인 후 진행
	@RequestMapping("modifyMyPage.me")
	public String goModifyMyPage(Model model, HttpServletRequest request, HttpServletResponse response) {
	
		if(request.getParameter("mUno")=="") {
			
			
			return "redirect:loginView.me";
		}else {
			//접속중인 사용자의 회원번호
			int mUno = Integer.parseInt(request.getParameter("mUno"));
			System.out.println("mUno확인 : "+mUno);
			
			//접속중인 회원의 비밀번호 확인
			Member member1;
			
			try {
				member1 = mps.checkMember(mUno);
				
				System.out.println("컨트롤러 member : "+member1);
				
				model.addAttribute("member1", member1);
				
				
			} catch (MyPageException e) {
				e.printStackTrace();
			}
			
			return "myPage/checkPwd";
		}
		
	}
	
	@RequestMapping("modifyMyPage2.me")
	public String modify_myPage2(Model model, HttpServletRequest request, HttpServletResponse response) {
	
		int mUno = Integer.parseInt(request.getParameter("mUno"));
		System.out.println("mUno확인 : "+mUno);
		
		return "myPage/modifyMyPage";
	}
	
	
	/*클로버 충전하기 페이지*/
	//클로버 개수-충전금액 DB에서 가져와서 띄워주기
	@RequestMapping("chargeClover.me")
	public String goChageClover(Model model) {

		List<Clover> list;
		try {
			list = mps.selectClover();
			
			/* model에 담아서 jsp페이지로 넘겨주기 > jsp에서는 ${ list.get(0).getCloverCnt} 이런식으로 불러다 쓰기 */
			model.addAttribute("list", list);
			
			/*System.out.println(list.get(0).getCloverCnt());*/
			
			
		} catch (MyPageException e) {
			e.printStackTrace();
		} 
		
		return "myPage/chargeClover";
	}
	
	
	
	//클로버 충전내역 조회 페이지
	@RequestMapping("chargeClover2.me")
	public String goChageClover2() {
		
		//2개의 Object에 담아와야함
		//Payment - 결제날짜, 승인번호
		//Clover - 클로버 개수, 클로버 가격
		Map<Object, Object> hmap = new HashMap<Object, Object>();
		
		/*try {
			hmap = mps.selectChargeLog();
		} catch (MyPageException e) {
			e.printStackTrace();
		}*/
		
		
		return "myPage/chargeClover2";
	}
	
	
	
	
	/*클로버 선물한 내역*/
	//클로버 선물한 내역조회 - 페이징처리 (검색 전)
	@RequestMapping("presentClover.me")
	public String goPresentClover(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		//접속중인 사용자의 회원번호
		int ptUno = Integer.parseInt(request.getParameter("ptUno"));
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = mps.getAllGivePresent(ptUno);
			System.out.println("listCount" + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<PtClover> givePresentList = mps.selectGivePresentList(pi, ptUno);
			model.addAttribute("givePresentList", givePresentList);
			request.setAttribute("pi", pi);
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		return "myPage/presentClover";
	}
	
	//클로버 선물한 내역 조회 - 검색조회
	/*@RequestMapping("searchGiveClover.me")
	public String searchGiveClover(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		//접속중인 사용자의 회원번호
		int ptUno = Integer.parseInt(request.getParameter("ptUno"));
		System.out.println("pt타입 : "+ptUno);
		
		//검색할 날짜값
		String date1 = request.getParameter("date1");
		System.out.println("date1 : "+date1);

		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//검색결과 개수
			int listCount = mps.getSearchGiveCloverCount(ptUno,date1);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//검색결과 리스트
			List<PtClover> searchGiveCloverList = mps.searchAllGiveCloverList(date1,ptUno, pi);
			
			model.addAttribute("searchGiveCloverList", searchGiveCloverList);
			request.setAttribute("pi", pi);
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		return "myPage/presentClover";
	}*/
	
	
	
	
	
	/*클로버 선물받은 내역*/
	//클로버 선물받은내역 조회
	@RequestMapping("presentClover2.me")
	public String goPresentClover2(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		//접속중인 사용자의 회원번호
		int ptUno = Integer.parseInt(request.getParameter("ptUno"));
		
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//결과값 카운트
			int listCount = mps.getAllTakePresent(ptUno);
			System.out.println("listCount" + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//결과값 리스트
			List<PtClover> takePresentList = mps.selectTakePresentList(pi, ptUno);
			
			model.addAttribute("takePresentList", takePresentList);
			request.setAttribute("pi", pi);
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		return "myPage/presentClover2";
	}
	
	//비밀번호 확인 페이지
	@RequestMapping("checkPwd.me")
	public String gocheckPwd() {
		return "myPage/checkPwd";
	}
	
	//계좌인증 페이지 - 비밀번호 확인 후, 진행
	@RequestMapping("bankChk.me")
	public String gobankChk() {
		return "myPage/bankChk";
	}
	
	//계좌관리 페이지 - 비밀번호 확인 후, 진행
	@RequestMapping("bankChk2.me")
	public String gobankChk2() {
		return "myPage/bankChk2";
	}
	
	//환전신청 페이지
	@RequestMapping("exchangeClover.me")
	public String goexchange() {
		return "myPage/exchange";
	}
	
	
	
	//My문의 페이지
	@RequestMapping("question.me")
	public String goquestion(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		List<CQBoard> questionList;

		//접속중인 사용자 번호
		int cqUno = Integer.parseInt(request.getParameter("cqUno"));
		
		try {
			questionList = mps.selectQuestion(cqUno);
			
			/* model에 담아서 jsp페이지로 넘겨주기 > jsp에서는 ${ list.get(0).getCloverCnt} 이런식으로 불러다 쓰기 */
			model.addAttribute("questionList", questionList);
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		return "myPage/question";
	}
	
	
	//My문의 페이지 상세보기
		@RequestMapping("selectQuestionOne.me")
		public String selectQuestionOne(Model model, HttpServletRequest request, HttpServletResponse response) {
			
			int bid = Integer.parseInt(request.getParameter("bid"));
			
			try {
				CQBoard questionOne = mps.selectQuestionOne(bid);
				
				model.addAttribute("questionOne", questionOne);
				
			} catch (MyPageException e) {
				e.printStackTrace();
			}
			
			return "myPage/selectQuestionOne";
		}
	
	
	
	//My신고 페이지
	@RequestMapping("claim.me")
	public String goclaim(Model model,HttpServletRequest request, HttpServletResponse response) {
		
		List<CQBoard> claimList;
		
		int cqUno = Integer.parseInt(request.getParameter("cqUno"));
		
		try {
			claimList = mps.selectClaim(cqUno);
			
			/* model에 담아서 jsp페이지로 넘겨주기 > jsp에서는 ${ list.get(0).getCloverCnt} 이런식으로 불러다 쓰기 */
			model.addAttribute("claimList", claimList);
			
		} catch (MyPageException e) {
			e.printStackTrace();
		} 
		
		return "myPage/claim";
	}
	
	//My신고 페이지 상세보기
	@RequestMapping("selectClaimOne.me")
	public String selectClaimOne(Model model,HttpServletRequest request, HttpServletResponse response) {
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		try {
			CQBoard claimOne = mps.selectClaimOne(bid);
			
			model.addAttribute("claimOne", claimOne);
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		
		return "myPage/selectClaimOne";
	}
	
	
	
	//방송통계 페이지
	@RequestMapping("broadcastTotal.me")
	public String gobroadcastTotal() {
		return "myPage/broadcastTotal";
	}
	
	//쪽지함 페이지
	@RequestMapping("note.me")
	public String goNote() {
		return "myPage/note";
	}
	
	//쪽지보내기 페이지
	@RequestMapping("noteSend.me")
	public String notesend() {
		return "myPage/noteSend";
	}
	
	

	
	
	
	
}
