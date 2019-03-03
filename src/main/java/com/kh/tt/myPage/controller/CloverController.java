package com.kh.tt.myPage.controller;

import java.util.HashMap;

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
		int cnt = Integer.parseInt(request.getParameter("cnt")); //클로버개수
		System.out.println(cnt);
		
		int result=0; //결과값
		int result1=0;//결제정보 추가 성공여부 확인
		int result2=0; //결제완료 후, 보유클로버 udpate
	
		
		/*System.out.println("pno : "+pno+", pCloverCnt : "+pCloverCnt);*/
		System.out.println("pUno : "+pUno);
		
		Payment pay = new Payment();
		pay.setpNo(pno);
		pay.setpUno(pUno);
		pay.setpCloverCnt(pCloverCnt);
		
		HashMap<String, Object> hmap =  new HashMap<String, Object>();
		hmap.put("mUno", pUno);
		hmap.put("totalClover", cnt);
		System.out.println("컨트롤러 충전클로버수 받음 : "+ cnt);
		
		//결제완료
		result1 = mps.insertPayment(pay);

		if(result1>0) {
			//보유클로버 업데이트
			result2= mps.updateClover(hmap);
			
			if(result1 ==0 ||result2==0) {
				result=0;
				
				model.addAttribute("msg","결제정보 전달 실패!");
				return "common/errorPage";
			}else {
				result=1;
				return "redirect:chargeClover2.me?ptUno="+pUno;
			}
			
		}else {
			model.addAttribute("msg","결제정보 전달 실패!");
			return "common/errorPage";
		}
		
	}	
}
