package com.kh.tt.broadcast.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.broadcast.model.vo.BanWord;

public interface BroadCastDao {
	ArrayList<BanWord> searchBanWord(SqlSessionTemplate sqlSession, String owner);

}
