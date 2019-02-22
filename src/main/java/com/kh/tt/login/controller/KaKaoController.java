package com.kh.tt.login.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tt.common.LoginLoggin;

@Controller
@RequestMapping("*.kakao")
public class KaKaoController {
	private static final Logger logger = LoggerFactory.getLogger(LoginLoggin.class);
	
	@PostMapping("login")
	public @ResponseBody HashMap<String, Object> login (@RequestBody Map<String, Object> requestBody){
		
		Map<String, Object> reqMap = (Map)requestBody.get("params");
		
		String resultValue = (String) reqMap.get("resultValue");
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		logger.info("resultValue : " + resultValue);
		
		return resultMap;
	}
}
