package com.kh.tt.broadcast.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tt.broadcast.model.vo.BanWord;
@Repository
public class BroadCastDaoImpl implements BroadCastDao{
	//금지어를 검색하는 메서드
	@Override
	public ArrayList<BanWord> searchBanWord(SqlSessionTemplate sqlSession, String owner) {
		ArrayList<BanWord> banArr = (ArrayList)sqlSession.selectList("BanWord.selectBanWord",owner);
		return banArr;
	}
	//채널 번호를 검색하는 메서드
	@Override
	public int selectChannelNum(SqlSessionTemplate sqlSession, String owner) {
		int channelNum = sqlSession.selectOne("BanWord.selectChannelNum", owner);
		return channelNum;
	}
	//금지어를 추가하는 메서드
	@Override
	public int insertBanWord(SqlSessionTemplate sqlSession, BanWord addBanWord) {
		int result = sqlSession.insert("BanWord.insertBanWord", addBanWord);
		return result;
	}

}
