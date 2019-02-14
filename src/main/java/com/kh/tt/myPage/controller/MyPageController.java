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

import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.service.MyPageService;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;

@Controller
public class MyPageController {
	
	//의존성 주입용 필드선언
	@Autowired
	private MyPageService mps;

	
	//개인정보 수정페이지 - 비밀번호 확인 후 진행
	@RequestMapping("modify_myPage.me")
	public String goModifyMyPage() {
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
	
	//클로버 선물한 내역조회
	@RequestMapping("presentClover.me")
	public String goPresentClover() {
		return "myPage/presentClover";
	}
	
	//클로버 선물받은내역 조회
	@RequestMapping("presentClover2.me")
	public String goPresentClover2() {
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
