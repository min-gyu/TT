package com.kh.tt.broadcast.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tt.broadcast.model.vo.BanWord;
@Repository
public class BroadCastDaoImpl implements BroadCastDao{

	@Override
	public ArrayList<BanWord> searchBanWord(SqlSessionTemplate sqlSession, String owner) {
		ArrayList<BanWord> banArr = (ArrayList)sqlSession.selectList("BanWord.selectBanWord",owner);
		System.out.println(banArr);
		return null;
	}

}
