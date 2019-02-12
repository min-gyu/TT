package com.kh.tt.channel.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.channel.model.vo.Board;

public interface ChannelDao {

	int insertVod(SqlSessionTemplate sqlSession, Board b);

	List<Board> vodList(SqlSessionTemplate sqlSession);
	
}
