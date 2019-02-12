package com.kh.tt.channel.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tt.channel.model.vo.Board;
@Repository
public class ChannelDaoImpl implements ChannelDao{

	
	//채널관리-VOD추가 메소드
	@Override
	public int insertVod(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		
		System.out.println("Dao도착");
		
		int result=sqlSession.insert("Board.insertVod",b);
		
		System.out.println("query"+result);
		return result;
		
	}

	//채널관리-VOD목록 메소드
	@Override
	public List<Board> vodList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Board.vodList");
	}



	
	

}
