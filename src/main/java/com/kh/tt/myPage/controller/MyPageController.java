package com.kh.tt.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	@RequestMapping("modify_myPage.me")
	public String goChannel() {
		return "myPage/modify_myPage";
	}
	
	
	
}
