package com.kh.tt.broadcast.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.broadcast.model.dao.BroadCastDao;
import com.kh.tt.broadcast.model.vo.BanWord;
@Service
public class BroadCastServiceImpl implements BroadCastService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BroadCastDao bcd;
	
	@Override
	public ArrayList<BanWord> searchBanWord(String owner) {
		ArrayList<BanWord> banArr = bcd.searchBanWord(sqlSession, owner);
		return null;
	}

}
