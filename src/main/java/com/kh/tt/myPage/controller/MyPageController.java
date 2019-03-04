package com.kh.tt.myPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.common.CommonUtils;
import com.kh.tt.common.MailUtils;
import com.kh.tt.common.PageInfo;
import com.kh.tt.common.Pagination;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.service.MyPageService;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Exchange;
import com.kh.tt.myPage.model.vo.MyBroadCast;
import com.kh.tt.myPage.model.vo.Payment;
import com.kh.tt.myPage.model.vo.PtClover;

@Controller
public class MyPageController {
	
	//의존성 주입용 필드선언
	@Autowired
	private MyPageService mps;
	

	@Autowired
	private MailUtils mailUtils;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	private CommonUtils commonUtils = new CommonUtils();

	
	//개인정보 수정페이지 - 비밀번호 확인 후 진행
	@RequestMapping("modifyMyPage.me")
	public String goModifyMyPage(Model model, HttpServletRequest request, HttpServletResponse response) {
	
		if(request.getParameter("mUno")=="") {
			
			return "redirect:loginView.me";
			
		}else {
			//접속중인 사용자의 회원번호
			int mUno = Integer.parseInt(request.getParameter("mUno"));
			
			//접속중인 회원의 비밀번호 확인
			Member member1;
			
			try {
				member1 = mps.checkMember(mUno);
				
				model.addAttribute("member1", member1);
				
				
			} catch (MyPageException e) {
				e.printStackTrace();
			}
			
			return "myPage/checkPwd";
		}
		
	}
	
	//비밀번호 확인 후 개인정보수정 페이지로 이동
	@RequestMapping("modifyMyPage2.me")
	public String modify_myPage2(Model model, HttpServletRequest request, HttpServletResponse response) {
	
		int mUno = Integer.parseInt(request.getParameter("mUno"));
		System.out.println("mUno확인 : "+mUno);
		
		//접속중인 회원의 비밀번호 확인
		Member member2;
		
		try {
			member2 = mps.checkMember(mUno);
			
			model.addAttribute("member2", member2);
			
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		return "myPage/modifyMyPage";
	}
	
	
	//개인정보 수정정보 (닉네임, 비밀번호 변경)
	@RequestMapping("modifyMyPage3.me")
	public String modifyMyPage3(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int mUno = Integer.parseInt(request.getParameter("mUno"));
		String nickName = request.getParameter("nickName");
		String userPwd = request.getParameter("userPwd");
		
		//비밀번호, 닉네임 변경
		try {
			
			String encPassword = passwordEncoder.encode(userPwd);
			System.out.println("변경 후 암호 > " + encPassword);
			
			int result = mps.updateModify(encPassword, nickName,mUno);
			
			if(result ==0) {
				System.out.println("변경 실패!");
			}
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		
		return "redirect:goMain.me";
	}
	
	//계좌 삭제하기
	@RequestMapping("deleteBank.me")
	public String deleteBank(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int mUno = Integer.parseInt(request.getParameter("mUno"));
		
		Member m ;
		
		try {
			m = mps.checkMember(mUno);
			
			model.addAttribute("m", m);
			System.out.println("컨트롤러에서 받은 m : "+m);
			
			int result = mps.deleteBank(mUno);
			
			if(result==0) {
				System.out.println("계좌 삭제 실패");
			}
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		
		return "myPage/bankChk";
	}
	
	//회원탈퇴하기
	@RequestMapping("out.me")
	public String out(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int mUno = Integer.parseInt(request.getParameter("mUno"));
		String reason = request.getParameter("reason");
		
		System.out.println("Controller에서 받은 mUno : "+mUno);
		System.out.println("Controller에서 받은 reason : "+reason);
		
		//회원번호, 탈퇴사유 update
		try {
			int result = mps.modifyOutStatus(mUno, reason);
			
			if(result==0) {
				System.out.println("탈퇴처리 실패!");
			}
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		return "redirect:goMain.me";
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
	public String goChageClover2(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		//2개의 Object에 담아와야함
		//Payment - 결제날짜, 승인번호
		//Clover - 클로버 개수, 클로버 가격
		//접속중인 사용자의 회원번호
		int ptUno = Integer.parseInt(request.getParameter("ptUno"));
		int currentPage = 1;
		
		Member m;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			
			m = mps.checkMember(ptUno);
			
			//리스트 카운트
			int listCount = mps.getAllchargeClover(ptUno);
			System.out.println("listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//충전내역 - 리스트
			List<Payment> chargeList = mps.selectChargeList(pi, ptUno);
			
			model.addAttribute("m", m);
			model.addAttribute("chargeList", chargeList);
			System.out.println("가져온리스트! "+chargeList);
			
			request.setAttribute("pi", pi);
			
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		
		
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
	
	/*//비밀번호 확인 페이지
	@RequestMapping("checkPwd.me")
	public String gocheckPwd() {
		return "myPage/checkPwd";
	}*/
	
	//계좌인증 페이지 - 비밀번호 확인 후, 진행
	@RequestMapping("bankChk.me")
	public String gobankChk(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int mUno = Integer.parseInt(request.getParameter("mUno"));
		Member m;
		
		int res = 0;
		
		//만약 계좌등록이 되어있으면 alert로 계좌삭제한 후 등록해달라고 창띄우기
		//계좌값이 null이면 계좌인증 후 등록시켜주기
		
		try {
			m = mps.checkMember(mUno);
			/*System.out.println("사용자의 은행명 : "+m.getBank());*/
			
			if(m.getBank()!=null) {
				res=0;
			}else {
				res=1;
			}
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("res", res);
		model.addAttribute("mUno", mUno);
		
		
		return "myPage/bankChk";
	}
	
	//계좌등록 
	@RequestMapping("insertBank.me")
	public String insertBank(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		return "redirect:goMain.me";
	}
	
	//계좌관리 페이지 - 비밀번호 확인 후, 진행
	@RequestMapping("bankChk2.me")
	public String bankChk2(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String mBank=request.getParameter("mBank"); 
		String mBankNo=request.getParameter("mBankNo"); 
		
		int mUno = Integer.parseInt(request.getParameter("mUno"));
		System.out.println("mUno : "+mUno);
		
		//계좌가 등록되어있는경우는 삭제 후 등록하라고 띄워주기
		
		
		if(mBank.equals("004")) {
			mBank="국민은행";	
		}else if(mBank.equals("003")) {
			mBank="기업은행";
		}else if(mBank.equals("088")) {
			mBank="신한은행";
		}else if(mBank.equals("011")) {
			mBank="농협";
		}else if(mBank.equals("020")) {
			mBank="우리은행";
		}

		System.out.println("은행코드 : "+mBank);
		System.out.println("계좌번호 : "+mBankNo);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>(); 
		hmap.put("mBank",mBank );
		hmap.put("mBankNo",mBankNo );
		hmap.put("mUno",mUno );
		
		//계좌등록
		int result;
		try {
			result = mps.updateBank(hmap);

			if(result==0) {
				System.out.println("계좌정보 update 실패!");
			}
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		return "myPage/bankChk2";
	}
	
	//계좌조회 페이지
	@RequestMapping("bankChk3.me")
	public String bankChk3(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int mUno = Integer.parseInt(request.getParameter("mUno"));
		Member m;
		
		//만약 계좌등록이 되어있으면 alert로 계좌삭제한 후 등록해달라고 창띄우기
		//계좌값이 null이면 계좌인증 후 등록시켜주기
		
		try {
			m = mps.checkMember(mUno);
			
			if(m.getBank()!=null) {
				model.addAttribute("m", m);
			}
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		
		return "myPage/bankChk2";
	}
	
	
	
	/*클로버 환전관리*/
	//환전신청 페이지
	@RequestMapping("exchangeClover.me")
	public String goexchange(Model model, HttpServletRequest request, HttpServletResponse response) throws MyPageException {
		
		int mUno = Integer.parseInt(request.getParameter("mUno"));
		
		Member m = mps.checkMember(mUno);
		
		//페이징처리할 리스트 가져오기
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//환전 - 카운트
			int listCount = mps.getAllExchange(mUno);
			System.out.println("환전 listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//환전 - 리스트
			List<Exchange> ExchangeList = mps.selectExchangeList(pi, mUno);
			System.out.println("List : "+ExchangeList);
			System.out.println("List 담긴 수 : "+ExchangeList.size());
			
			
			model.addAttribute("ExchangeList", ExchangeList);
			model.addAttribute("m", m);
			
			request.setAttribute("pi", pi);
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("mUno", mUno);
		
		return "myPage/exchange";
	}
	
	//환전신청내역 DB제출
	@RequestMapping("exchangeClover2.me")
	public String exchangeClover2(Model model, HttpServletRequest request, HttpServletResponse response) {

		int mUno = Integer.parseInt(request.getParameter("mUno"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		
		//Exchange테이블에 insert
		//ExchangeLog테이블에 insert
		//Exchange,ExchangeLog,Member 조인해서 테이블출력
		int result=0;
		try {
			result = mps.insertExchange(mUno,cnt);
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		if(result>0) {
			return "redirect:goMain.me";
		}else {
			model.addAttribute("msg","환전정보 insert 실패!");
			return "common/errorPage";
		}
		
	}
	
	//My문의 페이지
	@RequestMapping("question.me")
	public String goquestion(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = 1;
		List<CQBoard> questionList;
		//접속중인 사용자 번호
		int cqUno = Integer.parseInt(request.getParameter("cqUno"));
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//문의 - 카운트
			int listCount = mps.getQuestionCount(cqUno);
			System.out.println("신고 listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//문의 - 리스트
			questionList = mps.selectQuestion(pi, cqUno);
			
			/* model에 담아서 jsp페이지로 넘겨주기 > jsp에서는 ${ list.get(0).getCloverCnt} 이런식으로 불러다 쓰기 */
			model.addAttribute("questionList", questionList);
			request.setAttribute("pi", pi);
			
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
				
				if(questionOne != null) {
					//게시글에 첨부된 파일 이름 가져오기
					String imgName = mps.selectImgName(bid);
					model.addAttribute("imgName", imgName);
				}
				
				model.addAttribute("questionOne", questionOne);
				
			} catch (MyPageException e) {
				e.printStackTrace();
			}
			
			return "myPage/selectQuestionOne";
		}
	
	
	
	//My신고 페이지
	@RequestMapping("claim.me")
	public String goclaim(Model model,HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = 1;
		List<CQBoard> claimList;
		int cqUno = Integer.parseInt(request.getParameter("cqUno"));
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//신고 - 카운트
			int listCount = mps.getClaimCount(cqUno);
			System.out.println("신고 listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//신고 - 리스트
			claimList = mps.selectClaim(pi, cqUno);
			
			/* model에 담아서 jsp페이지로 넘겨주기 > jsp에서는 ${ list.get(0).getCloverCnt} 이런식으로 불러다 쓰기 */
			model.addAttribute("claimList", claimList);
			request.setAttribute("pi", pi);
			
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
			//게시글에대한 정보 가져오기
			CQBoard claimOne = mps.selectClaimOne(bid);
			
			if(claimOne != null) {
				//게시글에 첨부된 파일 이름 가져오기
				String imgName = mps.selectImgName(bid);
				model.addAttribute("imgName", imgName);
			}
			
			model.addAttribute("claimOne", claimOne);
			
		} catch (MyPageException e) {
			e.printStackTrace();
		}
		
		
		return "myPage/selectClaimOne";
	}
	
	
	
	//방송통계 페이지
	@RequestMapping("broadcastTotal.me")
	public String gobroadcastTotal(Model model,HttpServletRequest request, HttpServletResponse response) {
		

		int currentPage = 1;
		List<MyBroadCast> bcTotalList;
		int cqUno = Integer.parseInt(request.getParameter("cqUno"));
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			//방송통계 - 카운트
			int listCount = mps.btTotalCount(cqUno);
			System.out.println("방송통계 listCount : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			//방송통계 - 리스트
			bcTotalList = mps.selectbtTotal(pi, cqUno);
			
			
			//평균방송시간 > 방송시간 총합 / 방송횟수(listCount)
			
			//최고시청자수 > 누적시청자수 중 가장 큰값
			
			//평균시청자수 > 누적시청자수 총합 / 방송횟수 (listCount)
			
			/* model에 담아서 jsp페이지로 넘겨주기 > jsp에서는 ${ list.get(0).getCloverCnt} 이런식으로 불러다 쓰기 */
			model.addAttribute("bcTotalList", bcTotalList);
			request.setAttribute("pi", pi);
			
		} catch (MyPageException e) {
			e.printStackTrace();
		} 
		
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
