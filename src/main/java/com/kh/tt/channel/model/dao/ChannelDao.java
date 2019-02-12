package com.kh.tt.channel.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;

public interface ChannelDao {

	int insertVod(SqlSessionTemplate sqlSession, Board b);

	int insertAt(SqlSessionTemplate sqlSession, Attachment a);
	
	List<Board> vodList(SqlSessionTemplate sqlSession);

	int increaseViewC(int bNo,SqlSessionTemplate sqlSession);

	Board vodOne(int bNo,SqlSessionTemplate sqlSession);

	
	
}
