package com.kh.tt.broadcast.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {

	@RequestMapping("goBroadCast.bc")
	public String goBroadCast() {
		return "broadcast/board";
	}
}
