package com.kh.tt.channel.model.service;

import java.util.List;

import com.kh.tt.channel.model.vo.Board;

public interface ChannelService{

	//채널관리-VOD 추가 메소드
	int insertVod(Board b);

	//채널관리-VOD리스트 메소드
	List<Board> vodList();

	

}
