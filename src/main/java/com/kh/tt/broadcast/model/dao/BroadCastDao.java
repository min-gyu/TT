package com.kh.tt.broadcast.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.broadcast.model.vo.BanWord;
import com.kh.tt.broadcast.model.vo.BroadCast;
import com.kh.tt.broadcast.model.vo.Relation;
import com.kh.tt.member.model.vo.Member;

public interface BroadCastDao {
	
	ArrayList<BanWord> searchBanWord(SqlSessionTemplate sqlSession, String owner);

	int selectChannelNum(SqlSessionTemplate sqlSession, String owner);

	int insertBanWord(SqlSessionTemplate sqlSession, BanWord addBanWord);

	int deleteBanWord(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	ArrayList<Relation> selectRelation(SqlSessionTemplate sqlSession, HashMap<String, Object> hListMap);

	Member selelctUser(SqlSessionTemplate sqlSession, String addManagerId);

	int insertManager(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	Relation selectManager(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	ArrayList<Relation> selectRelation(SqlSessionTemplate sqlSession, int channelNum);

	ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	int deleteManager(SqlSessionTemplate sqlSession, HashMap<String, ArrayList<Integer>> hmap);

	Relation selectChatBanUser(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	int insertChanBanUser(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	ArrayList<Relation> selectChatRelation(SqlSessionTemplate sqlSession, int channelNum);

	int deleteChatBanUser(SqlSessionTemplate sqlSession, HashMap<String, ArrayList<Integer>> hmap);

	Relation selectSubscribe(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	int insertSubscribe(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	int deleteSubscribe(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	Member selectMember(SqlSessionTemplate sqlSession, String owner);

	int updateMinusClover(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	int updatePlusClover(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	int insertPTClover(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	int inserBroadStart(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	ArrayList<BroadCast> selectBroadCast(SqlSessionTemplate sqlSession);

	int braodEnd(SqlSessionTemplate sqlSession, int chNo);

	int updateMember(SqlSessionTemplate sqlSession, String userId);

	int updateNMember(SqlSessionTemplate sqlSession, String owner);

	int broadTitleUpdate(SqlSessionTemplate sqlSession, int chNo, String broadTitle);

	List<String> searchCategory(SqlSessionTemplate sqlSession);

	List<String> searchCategory1(SqlSessionTemplate sqlSession, String category);

	int broadCategoryUpdate(SqlSessionTemplate sqlSession, int chNo, String data);



	


}
