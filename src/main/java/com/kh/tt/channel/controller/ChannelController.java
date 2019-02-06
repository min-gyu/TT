package com.kh.tt.channel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChannelController {
	//---------채널 ----------------
	
	//채널 메인
	@RequestMapping("goChannel.ch")
	public String goChannel() {
		return "channel/channel";
	}
	
	//VOD리스트 페이지
	@RequestMapping("vod_List.ch")
	public String vod_List () {
		return "channel/vod_List";
	}

	//VOD상세보기 페이지
	@RequestMapping("vod_oneList.ch")
	public String vod_oneList () {
		return "channel/vod_oneList";
	}

	//게시판 리스트 페이지
	@RequestMapping("board_List.ch")
	public String board_List () {
		return "channel/board_List";
	}
	//게시판 작성 페이지
	@RequestMapping("board_write.ch")
	public String board_write () {
		return "channel/board_write";
	}

	//게시판 상세보기 페이지
	@RequestMapping("board_oneList.ch")
	public String board_oneList () {
		return "channel/board_oneList";
	}

	//게시판 수정하기 페이지
	@RequestMapping("update_board.ch")
	public String board_update () {
		return "channel/update_board";
	}

	//게시판 신고하기 팝업 페이지
	@RequestMapping("board_report.ch")
	public String board_report () {
		return "channel/board_report";
	}
	


	//---------관리자------------
	@RequestMapping("manage_C.ch")
	public String manage_C() {
		return "channel_admin/channel_admin";
	}

	@RequestMapping("manage_Black.ch")
	public String manage_Black() {
		return "channel_admin/channel_black";
	}

	@RequestMapping("manage_Chat.ch")
	public String manage_Chat() {
		return "channel_admin/channel_chat";
	}

	@RequestMapping("manage_Cate.ch")
	public String manage_Cate() {
		return "channel_admin/channel_category";
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
