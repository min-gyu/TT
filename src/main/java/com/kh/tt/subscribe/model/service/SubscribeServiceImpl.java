package com.kh.tt.subscribe.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.admin.model.dao.AdminDao;
import com.kh.tt.subscribe.model.dao.SubscribeDao;
import com.kh.tt.subscribe.model.vo.Subscribe;

@Service
public class SubscribeServiceImpl implements SubscribeService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SubscribeDao sd;
	
	// 구독한 채널 리스트
	@Override
	public List<Subscribe> channelList(int uno) {
		return sd.channelList(uno);
	}

	// 구독한 VOD 리스트
	@Override
	public List<Subscribe> vodList(int uno) {
		return sd.vodList(uno);	
	}

	// 구독한 생방송 리스트
	@Override
	public List<Subscribe> liveList(int uno) {
		return sd.liveList(uno);
	}

}
