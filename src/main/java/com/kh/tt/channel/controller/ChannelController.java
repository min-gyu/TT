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
		return "channel_admin/channel_admin";
	}

	@RequestMapping("manage_black.ch")
	public String manage_Black() {
		return "channel_admin/channel_black";
	}
	
	//VOD 관리페이지로 이동시키는 메서드
	@RequestMapping("goVodAdmin.ch")
	public String goVodAdmin(){
		return "channel_admin/vodAdmin";
	}
	//VOD 추가 페이지로 이동시키는 메서드
	@RequestMapping("vodAdd.ch")
	public String vodAdd() {
		return "channel_admin/vodAdd";
	}
	//VOD 수정 페이지로 이동하는 메서드
	@RequestMapping("vodRevise")
	public String vodRevies() {
		return "channel_admin/vodRevise";
	}
	//구독자 관리 페이지로 이동하는 메서드
	@RequestMapping("subscriberAdmin.ch")
	public String goSubscriberAdmin() {
		return "channel_admin/subscriberAdmin";
	}
	//매니저 관리 페이지로 이동하는 메서드
	@RequestMapping("/managerAdmin.ch")
	public String goManagerAdmin() {
		return "channel_admin/managerAdmin";
	}
	//배너프로필 설정 페이지로 이동하는 메서드
	@RequestMapping("/goBannerProfile.ch")
	public String goBannerProfile(){
		return "channel_admin/bannerAndProfile";
	}
	//채널소개 페이지로 이동하는 메서드
	@RequestMapping("/goChannelIntro")
	public String goChannelIntro() {
		return "channel_admin/channelIntro";
	}

}
