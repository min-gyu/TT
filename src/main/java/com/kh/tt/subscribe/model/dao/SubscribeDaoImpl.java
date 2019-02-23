package com.kh.tt.subscribe.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tt.subscribe.model.vo.Subscribe;

@Repository
public class SubscribeDaoImpl implements SubscribeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Subscribe> channelList(int uno) {
		return sqlSession.selectList("Subscribe.channelList", uno);
	}

	@Override
	public List<Subscribe> vodList(int uno) {
		return sqlSession.selectList("Subscribe.vodList", uno);
	}

	@Override
	public List<Subscribe> liveList(int uno) {
		return sqlSession.selectList("Subscribe.liveList", uno);
	}

}
