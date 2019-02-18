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

	

}
