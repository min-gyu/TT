package com.kh.tt.channel.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;

public interface ChannelService{

	//채널관리-VOD 추가 메소드
	int insertVod(Board b);
	//채널관리-VOD추가시 첨부파일 추가 메소드
	int insertAt(Attachment a);

	//채널관리-VOD리스트 메소드
	List<Board> vodList();

	
	
	//VOD상세보기-조회수 메소드
	void increaseViewC(int bNo, HttpSession session);

	//VOD상세보기-내용 메소드
	Board vodOne(int bNo);

	

	

}
