package com.kh.tt.subscribe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tt.admin.model.vo.Category;
import com.kh.tt.subscribe.model.service.SubscribeService;
import com.kh.tt.subscribe.model.vo.Subscribe;

@Controller
@RequestMapping("*.sub")
public class SubscribeController {
	@Autowired
	private SubscribeService ss;
	
	@RequestMapping("subscribe")
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
	
	@RequestMapping("subChannel")
	public @ResponseBody List<Subscribe> channelList(Model model, HttpServletRequest request, HttpServletResponse response) {
		int uno = Integer.parseInt(request.getParameter("uno"));
		
		List<Subscribe> cList = ss.channelList(uno);
		
		System.out.println("cList > " + cList);
		System.out.println(" 조회 결과 리스트사이즈 > " + cList.size());
		
		return cList;
	}
}
