package com.kh.tt.broadcast.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.broadcast.model.vo.BanWord;

public interface BroadCastDao {
	
	ArrayList<BanWord> searchBanWord(SqlSessionTemplate sqlSession, String owner);

	int selectChannelNum(SqlSessionTemplate sqlSession, String owner);

	int insertBanWord(SqlSessionTemplate sqlSession, BanWord addBanWord);

	int deleteBanWord(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	


}
