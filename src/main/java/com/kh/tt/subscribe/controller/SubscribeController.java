package com.kh.tt.subscribe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubscribeController {

	@RequestMapping("subscribe.me")
	public String showSubscribe() {
		return "subscribe/main";
	}
	/*
	// localhost:8001/subscribe/1
	@RequestMapping(value="/subscribe/{page}")
	public String subscribeViews(@PathVariable Integer page) {
		
		String viewPath = "subscribe/";
		
		switch (page) {
			case 1:
				viewPath = viewPath + "live"; // 생방송
			break;
	
			case 2:
				viewPath = viewPath + "vod"; // vod
			break;
			
			case 3:
				viewPath = viewPath + "channel"; // 채널
				break;
		}
		
		System.out.println(" page : " + page + "  viewPath : " + viewPath);
		return viewPath;
	}
	*/
}
