package com.kh.tt.broadcast.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.broadcast.model.dao.BroadCastDao;
import com.kh.tt.broadcast.model.vo.BanWord;
import com.kh.tt.broadcast.model.vo.Relation;
import com.kh.tt.member.model.vo.Member;
@Service
public class BroadCastServiceImpl implements BroadCastService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BroadCastDao bcd;
	
	@Override
	public ArrayList<BanWord> searchBanWord(String owner) {
		ArrayList<BanWord> banArr = bcd.searchBanWord(sqlSession, owner);
		return banArr;
	}

	@Override
	public int selectChannelNum(String owner) {
		int channelNum = bcd.selectChannelNum(sqlSession, owner);
		return channelNum;
	}

	@Override
	public int insertBanWord(BanWord addBanWord) {
		int result = bcd.insertBanWord(sqlSession, addBanWord);
		return result;
	}

	@Override
	public int deleteBanWord(HashMap<String, Object> hmap) {		
		return bcd.deleteBanWord(sqlSession, hmap);
	}

	@Override
	public ArrayList<Member> selectMember(HashMap<String, Object> hmap) {
		return bcd.selectMember(sqlSession, hmap);
	}

	@Override
	public ArrayList<Relation> selectRelation(HashMap<String, Object> hListMap) {
		return bcd.selectRelation(sqlSession, hListMap);
	}

	@Override
	public Member selectUser(String addManagerId) {
		return bcd.selelctUser(sqlSession, addManagerId);
	}

	

}
