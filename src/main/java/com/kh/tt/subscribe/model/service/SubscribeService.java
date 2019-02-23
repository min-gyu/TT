package com.kh.tt.subscribe.model.service;

import java.util.List;

import com.kh.tt.subscribe.model.vo.Subscribe;

public interface SubscribeService {

	// 구독한 채널 리스트
	List<Subscribe> channelList(int uno);

	// 구독한 VOD 리스트
	List<Subscribe> vodList(int uno);

	// 구독한 생방송 리스트
	List<Subscribe> liveList(int uno);

}
