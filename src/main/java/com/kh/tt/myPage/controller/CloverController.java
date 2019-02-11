package com.kh.tt.myPage.controller;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tt.member.model.service.MemberService;
import com.kh.tt.myPage.model.vo.Clover;



@Controller
public class CloverController {
	
	//의존성 주입용 필드선언
	@Autowired
	private MemberService ms;
		
	//클로버 충전버튼 클릭시
	@RequestMapping("payment.me")
	public String chargeEx(HttpServletRequest request, HttpServletResponse response) {
		String cno = request.getParameter("cno");
		System.out.println(cno);
		
		
		return  "redirect:goMain.me";
	}	
		
		
		
}
