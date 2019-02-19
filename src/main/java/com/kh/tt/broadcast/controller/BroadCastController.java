package com.kh.tt.broadcast.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.header.writers.HstsHeaderWriter;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tt.broadcast.model.service.BroadCastService;
import com.kh.tt.broadcast.model.vo.BanWord;
import com.kh.tt.broadcast.model.vo.Relation;
import com.kh.tt.member.model.vo.Member;

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
		//채널 번호를 리턴하는 controller
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
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("fNoList", fNoArr);
		result = bcs.deleteBanWord(hmap);
		return result;
	}
	//구독여부를 조회하기위한 메서드
	@RequestMapping("searchSubscribe.bc")
	public @ResponseBody HashMap<String, Object> searchSubcribe(@RequestParam("owner") String owner, 
			HttpServletRequest request) {
		String[] userList = request.getParameterValues("userList");
		//채널번호를 가져오고
		int channelNum = bcs.selectChannelNum(owner);
		//유저번호를 가져오고
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userList", userList);
		//맴버 리스트를 가져옴
		ArrayList<Member> memberList = bcs.selectMember(hmap);
		//채널번호와 멤버번호를 arraylist에 담아서 reration테이블의 값들을 가져옴
		HashMap<String, Object> hListMap = new HashMap<String, Object>();
		hListMap.put("channelNum", channelNum);
		hListMap.put("memberList", memberList);
		//채널번호와 유저번호를 바탕으로 값을 relation값을 가져옴
		ArrayList<Relation> relationList = bcs.selectRelation(hListMap);
		System.out.println(relationList);
		HashMap<String, Object> hResultMap = new HashMap<String, Object>();
		hResultMap.put("member", memberList);
		hResultMap.put("relation",relationList);
		return hResultMap;	
	}
	//매니저를 추가하는 메서드
	@RequestMapping("insertManager.bc")
	public @ResponseBody String addManager(@RequestParam("owner") String owner, 
			@RequestParam("addManagerId") String addManagerId) {
		//채널번호를 가져오고
		int channelNum = bcs.selectChannelNum(owner);
		//유저 아이디를 검사하고(중복검사)
		Member duplicateMember = bcs.selectUser(addManagerId);
		//존재하지 않으면 리턴
		if(duplicateMember==null) {
			return "존재하지 않는 유저 입니다";
		}
		//현재 매니저인지 확인
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("channelNum",channelNum);
		hmap.put("userNo",duplicateMember.getUno());
		System.out.println(hmap);
		Relation duplicateRelation = bcs.selectManager(hmap);
		System.out.println(duplicateRelation);
		if(duplicateRelation!=null) {
			return "이미 매니저로 등록된 회원입니다.";
		}
		//매니저에 추가하기
		int insertResult = bcs.insertManager(hmap);
		if(insertResult==1) {
			return "매니저 등록 성공";
		}
		return "매니저 등록 실패";
	}
	//매니저를 검색하는 메서드
	@RequestMapping("selectManager.bc")
	public @ResponseBody HashMap<String, Object> selectManager(@RequestParam("owner") String owner){
		//채널번호를 가져오고
		int channelNum = bcs.selectChannelNum(owner);
		//채널번호의 relation 목록을 가져온다(오버로딩)
		ArrayList<Relation> relationList = bcs.selectRelation(channelNum);
		//relation의 rTargetUno로 Member에서 유저들을 조회해서 리턴한다
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("relationList", relationList);
		ArrayList<Member> memberList = bcs.selectMemberList(hmap);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("relationList",relationList);
		resultMap.put("memberList",memberList);
		return resultMap;
	}
	//매니저를 삭제하는 메서드
	@RequestMapping("deleteManager.bc")
	public @ResponseBody int deleteManager(@RequestParam("rNoArr") String[] rNoArr) {
		ArrayList<Integer> rNoList = new ArrayList<Integer>();
		for(int i=0; i<rNoArr.length; i++) {
			
		}
		return 0;
	}
}
