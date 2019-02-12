package com.kh.tt.myPage.controller;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tt.member.model.service.MemberService;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.service.MyPageService;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;



@Controller
public class CloverController {
	
	//의존성 주입용 필드선언
		@Autowired
		private MyPageService mps;
		
	//클로버 결제완료시 호출
	@RequestMapping("payment.me")
	public String chargeEx(HttpServletRequest request, HttpServletResponse response, Model model) throws MyPageException {
		String pno = request.getParameter("pno"); //결제번호
		int pUno = Integer.parseInt(request.getParameter("pUno")); //회원번호
		int pCloverCnt = Integer.parseInt(request.getParameter("pCloverCnt")); //클로버번호
		System.out.println(pUno);
		
		int result;//결제정보 추가 성공여부 확인
	
		
		/*System.out.println("pno : "+pno+", pCloverCnt : "+pCloverCnt);*/
		System.out.println("pUno : "+pUno);
		
		Payment pay = new Payment();
		pay.setpNo(pno);
		pay.setpUno(pUno);
		pay.setpCloverCnt(pCloverCnt);
		
	
		result = mps.insertPayment(pay);

		if(result>0) {
			return "redirect:goMain.me";
		}else {
			model.addAttribute("msg","결제정보 전달 실패!");
			return "common/errorPage";
		}
		
	}	
		
		
		
}
