package com.kh.tt.channel.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.channel.model.dao.ChannelDao;
import com.kh.tt.channel.model.vo.Board;

@Service
public class ChannelServiceImpl implements ChannelService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ChannelDao cd;
	
	//채널 관리 - VOD업로드 메소드
	@Override
	public int insertVod(Board b) {
		
		System.out.println("service도착");
		int result=cd.insertVod(sqlSession, b);
		
		System.out.println("service"+result);
		
		return result;
		
		
	}

	//채널 관리 - VOD 리스트 메소드
	@Override
	public List<Board> vodList() {
		
		return cd.vodList(sqlSession);
	}

}
