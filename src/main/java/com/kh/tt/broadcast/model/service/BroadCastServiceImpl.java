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

	@Override
	public int insertManager(HashMap<String, Object> hmap) {
		return bcd.insertManager(sqlSession, hmap);
	}

	@Override
	public Relation selectManager(HashMap<String, Object> hmap) {
		return bcd.selectManager(sqlSession, hmap);
	}

	@Override
	public ArrayList<Relation> selectRelation(int channelNum) {
		return bcd.selectRelation(sqlSession, channelNum);
	}

	@Override
	public ArrayList<Member> selectMemberList(HashMap<String, Object> hmap) {
		return bcd.selectMemberList(sqlSession, hmap);
	}

	@Override
	public int deleteManager(HashMap<String, ArrayList<Integer>> hmap) {
		return bcd.deleteManager(sqlSession, hmap);
	}

	@Override
	public Relation selectChatBanUser(HashMap<String, Object> hmap) {
		return bcd.selectChatBanUser(sqlSession, hmap);
	}

	@Override
	public int insertChanBanUser(HashMap<String, Object> hmap) {
		return bcd.insertChanBanUser(sqlSession, hmap);
	}

	@Override
	public ArrayList<Relation> selectChatRelation(int channelNum) {
		return bcd.selectChatRelation(sqlSession, channelNum);
	}

	@Override
	public int deleteChatBanUser(HashMap<String, ArrayList<Integer>> hmap) {
		return bcd.deleteChatBanUser(sqlSession, hmap);
	}

	@Override
	public Relation selectSubscribe(HashMap<String, Object> hmap) {
		return bcd.selectSubscribe(sqlSession, hmap);
	}

	@Override
	public int insertSubscribe(HashMap<String, Object> hmap) {
		return bcd.insertSubscribe(sqlSession, hmap);
	}

	@Override
	public int deleteSubscribe(HashMap<String, Object> hmap) {
		return bcd.deleteSubscribe(sqlSession, hmap);
	}

	@Override
	public Member selectMember(String owner){
		return bcd.selectMember(sqlSession, owner);
	}

	@Override
	public int updateMinusClover(HashMap<String, Object> hmap) {
		return bcd.updateMinusClover(sqlSession, hmap);
	}

	@Override
	public int updatePlusClover(HashMap<String, Object> hmap) {
		return bcd.updatePlusClover(sqlSession, hmap);
	}

	@Override
	public int insertPTClover(HashMap<String, Object> hmap) {
		return bcd.insertPTClover(sqlSession, hmap);
	}


	

}
