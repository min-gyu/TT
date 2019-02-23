package com.kh.tt.login.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.tt.common.LoginLoggin;
import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.Member;

@Controller
@SessionAttributes("loginUser")
@RequestMapping("*.kakao")
public class KaKaoController {
	private static final Logger logger = LoggerFactory.getLogger(LoginLoggin.class);
	
	@Autowired
	private KaKaoService kaKaoService;
	
	public KaKaoController(KaKaoService kaKaoService) {
		this.kaKaoService = kaKaoService;
	}
	
	@PostMapping("login")
	public @ResponseBody HashMap<String, Object> login (@RequestBody HashMap<String, Object> requestBody, Model model){
		HashMap<String, Object> resultMap = new HashMap<>();
		
		System.out.println(">>>");
		System.out.println(requestBody);
		
		int cnt = kaKaoService.selectFindLoginUser(requestBody);
		
		if(cnt > 0){
			Member loginUser = kaKaoService.selectLoginMember(requestBody);
			model.addAttribute("loginUser", loginUser);
		}
		
		resultMap.put("cnt", cnt);
		resultMap.put("id", requestBody.get("id"));
		resultMap.put("nickName", requestBody.get("nickName"));
		
		return resultMap;
	}
	
	
	
}
