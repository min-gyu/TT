package com.kh.tt.broadcast.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.header.writers.HstsHeaderWriter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tt.broadcast.model.service.BroadCastService;
import com.kh.tt.broadcast.model.vo.BanWord;

@org.springframework.stereotype.Controller
public class BroadCastController {
	@Autowired 
	private BroadCastService bcs;

	@RequestMapping("goBroadCast.bc")
	public String goBroadCast(){
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
	@RequestMapping("broadTest.bc")
	public String broadtest() {
		return "broadcast/broadtest";
	}
	@RequestMapping("broadTest2.bc")
	public String broadtest2() {
		return "broadcast/resolution/test";
	}
	//금지어를 검색하는 메서드
	@RequestMapping("searchBanWord.bc")
	public @ResponseBody ArrayList<BanWord> searchBanWord(@RequestParam String owner){
		ArrayList<BanWord> banArr= bcs.searchBanWord(owner);
		return banArr;
	}
	//금지어를 추가하는 메서드
	@RequestMapping("inputBanWord.bc")
	public @ResponseBody int inputBanWord(@RequestParam("owner") String owner,
			@RequestParam("banWord") String banWord,
			@RequestParam("replaceWord") String replaceWord) {
		int channelNum = bcs.selectChannelNum(owner);
		BanWord addBanWord = new BanWord();
		addBanWord.setfChNo(channelNum);
		addBanWord.setfBan(banWord);
		addBanWord.setfReplace(replaceWord);
		int result = bcs.insertBanWord(addBanWord);
		return result;
	}
	//금지어를 삭제하는 메서드
	@RequestMapping("deleteBanWord.bc")
	public @ResponseBody int deleteBanWord(@RequestParam("fNoArr") Integer[] fNoArr) {
		int result = 0;
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("fNoList", fNoArr);
		System.out.println(hmap);
		result = bcs.deleteBanWord(hmap);
		return result;
	}
}
