package com.kh.tt.channel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChannelController {
	
@RequestMapping("goChannel.ch")
public String goChannel() {
	return "channel/channel";
}

@RequestMapping("manage_C.ch")
public String manage_C() {
	return "channel/manageC";
}

}