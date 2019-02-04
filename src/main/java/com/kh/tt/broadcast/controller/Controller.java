package com.kh.tt.broadcast.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {

	@RequestMapping("goBroadCast.bc")
	public String goBroadCast() {
		return "broadcast/board";
	}
	@RequestMapping("addBanWord.bc")
	public String addBanWord(){
		return "broadcast/addBanWord";
	}
	@RequestMapping("addManager.bc")
	public String addManager(){
		return "broadcast/addManager";
	}
	@RequestMapping("userList.bc")
	public String userList(){
		return "broadcast/userList";
	}
	@RequestMapping("broadCastSetting.bc")
	public String broadCastSetting(){
		return "broadcast/broadCastSetting";
	}
}
