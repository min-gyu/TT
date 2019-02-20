package com.kh.tt.broadcast.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tt.broadcast.model.vo.BanWord;
import com.kh.tt.broadcast.model.vo.Relation;
import com.kh.tt.member.model.vo.Member;

public interface BroadCastService{

	ArrayList<BanWord> searchBanWord(String owner);

	int selectChannelNum(String owner);

	int insertBanWord(BanWord addBanWord);

	int deleteBanWord(HashMap<String, Object> hmap);

	ArrayList<Member> selectMember(HashMap<String, Object> hmap);

	ArrayList<Relation> selectRelation(HashMap<String, Object> hListMap);

	Member selectUser(String addManagerId);

	int insertManager(HashMap<String, Object> hmap);

	Relation selectManager(HashMap<String, Object> hmap);

	ArrayList<Relation> selectRelation(int channelNum);

	ArrayList<Member> selectMemberList(HashMap<String, Object> hmap);

	int deleteManager(HashMap<String, ArrayList<Integer>> hmap);

	Relation selectChatBanUser(HashMap<String, Object> hmap);

	int insertChanBanUser(HashMap<String, Object> hmap);

	ArrayList<Relation> selectChatRelation(int channelNum);

	int deleteChatBanUser(HashMap<String, ArrayList<Integer>> hmap);

	Relation selectSubscribe(HashMap<String, Object> hmap);

	int insertSubscribe(HashMap<String, Object> hmap);

	int deleteSubscribe(HashMap<String, Object> hmap);

	Member selectMember(String owner);

	int updateMinusClover(HashMap<String, Object> hmap);

	int updatePlusClover(HashMap<String, Object> hmap);

	int insertPTClover(HashMap<String, Object> hmap);


	

}
