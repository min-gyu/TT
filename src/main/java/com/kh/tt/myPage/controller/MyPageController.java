package com.kh.tt.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	//개인정보 수정페이지 - 비밀번호 확인 후 진행
	@RequestMapping("modify_myPage.me")
	public String goModifyMyPage() {
		return "myPage/modifyMyPage";
	}
	
	//클로버 충전하기 페이지
	@RequestMapping("chargeClover.me")
	public String goChageClover() {
		return "myPage/chargeClover";
	}
	
	//클로버 충전내역 조회 페이지
	@RequestMapping("chargeClover2.me")
	public String goChageClover2() {
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
	@RequestMapping("exchange.me")
	public String goexchange() {
		return "myPage/exchange";
	}
	
	//My문의 페이지
	@RequestMapping("question.me")
	public String goquestion() {
		return "myPage/question";
	}
	
	//My신고 페이지
	@RequestMapping("claim.me")
	public String goclaim() {
		return "myPage/claim";
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
