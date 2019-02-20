package com.kh.tt.channel.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.member.model.vo.Member;



public interface ChannelService{

	//채널관리-VOD 추가 메소드
	int insertVod(Board b);
	Board selectbNo(Board b);
	
	//채널관리-VOD추가시 첨부파일 추가 메소드
	int insertAt(Attachment a);

	//채널관리-VOD리스트 메소드
	List<Board> vodList(int i,int j);
	//VOD리스트 총 개수 메소드
	int getLisCount(Board b);
	
	//VOD상세보기-조회수 메소드
	void increaseViewC(int bNo, HttpSession session);

	//VOD상세보기-내용 메소드
	Board vodOne(int bNo);
	//VOD상세보기-영상 메소드
	Attachment vodOneR(int bNo);
	
	//채널 회원 정보 메소드
	Member selectmInfo(int uNo);
	
	//채널 구독하기 메소드
	int addSubscirbe(int cuNo, int uno);
	Object insertDet(HashMap<String, Object> map);
	
	
	
	
	

	

	

}
