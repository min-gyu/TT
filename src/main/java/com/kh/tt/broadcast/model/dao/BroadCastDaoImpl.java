package com.kh.tt.broadcast.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tt.broadcast.model.vo.BanWord;
import com.kh.tt.broadcast.model.vo.BroadCast;
import com.kh.tt.broadcast.model.vo.Relation;
import com.kh.tt.member.model.vo.Member;
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
	//금지어를 삭제하는 메서드
	@Override
	public int deleteBanWord(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.delete("BanWord.deleteBanWord", hmap);
	}
	//멤버 리스트를 검색하는 메서드
	@Override
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return (ArrayList)sqlSession.selectList("BanWord.selectMember", hmap);
	}
	//채널번호와 유저번호를 바탕으로 relation을 검색하는 메서드(구독여부를 확인하기 위해)
	@Override
	public ArrayList<Relation> selectRelation(SqlSessionTemplate sqlSession, HashMap<String, Object> hListMap) {
		return (ArrayList)sqlSession.selectList("BanWord.selectRelation",hListMap);
	}
	//매니저로 추가할 ID가 존재하는 회원인지 검사하는 메서드
	@Override
	public Member selelctUser(SqlSessionTemplate sqlSession, String addManagerId) {
		return sqlSession.selectOne("BanWord.selectUser", addManagerId) ;
	}
	//매니저를 추가하는 메서드
	@Override
	public int insertManager(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.insert("BanWord.insertManager", hmap);
	}
	//이미 매니저로 등록되었는지 확인하는 메서드
	@Override
	public Relation selectManager(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.selectOne("BanWord.selectManager",hmap);
	}
	//채널번호의  manager를 조회해서 가져오는 메서드
	@Override
	public ArrayList<Relation> selectRelation(SqlSessionTemplate sqlSession, int channelNum) {
		return (ArrayList)sqlSession.selectList("BanWord.selectManagerRelation", channelNum);
	}
	//relationList를 바탕으로 MemberList를 찾는 메서드
	@Override
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return (ArrayList)sqlSession.selectList("BanWord.selectMemberList", hmap);
	}
	//매니저 권환을 회수(삭제)하는 메서드
	@Override
	public int deleteManager(SqlSessionTemplate sqlSession, HashMap<String, ArrayList<Integer>> hmap) {
		return sqlSession.delete("BanWord.deleteManager",hmap);
	}
	//이미 금지회원으로 등록되었는지 확인하는 메서드
	@Override
	public Relation selectChatBanUser(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.selectOne("BanWord.selectChatBanUser",hmap);
	}
	@Override
	public int insertChanBanUser(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.insert("BanWord.insertChatBanUser",hmap);
	}
	//채널번호의 CHAT relation을 조회해서 가져오는 메서드
	@Override
	public ArrayList<Relation> selectChatRelation(SqlSessionTemplate sqlSession, int channelNum) {
		return (ArrayList)sqlSession.selectList("BanWord.selelctChatRelation",channelNum);
	}
	//채팅금지 유저를 해제(삭제)하는 메서드
	@Override
	public int deleteChatBanUser(SqlSessionTemplate sqlSession, HashMap<String, ArrayList<Integer>> hmap) {
		return sqlSession.delete("BanWord.deleteChatBanUser",hmap);
	}
	//구독 유무를 리턴하는 메서드
	@Override
	public Relation selectSubscribe(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.selectOne("BanWord.selectSubscribe", hmap);
	}
	//구독을 추가하는 메서드
	@Override
	public int insertSubscribe(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.insert("BanWord.insertSubscribe",hmap);
	}
	//구독을 취소하는 메서드
	@Override
	public int deleteSubscribe(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.delete("BanWord.deleteSubscribe",hmap);
	}
	//회원 아이디로 특정 회원을 검색하는 메서드
	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, String owner) {
		return sqlSession.selectOne("BanWord.selectOneMember",owner);
	}
	//선물한 만큼의 클로버를 빼는 메서드
	@Override
	public int updateMinusClover(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.update("BanWord.updateMinusClover", hmap);
	}
	//선물 받은 만큼의 클로버를 더하는 메서드
	@Override
	public int updatePlusClover(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.update("BanWord.updatePlusClover", hmap);
	}
	//선물 내역을 PTClover 테이블에 기록하는 메서드
	@Override
	public int insertPTClover(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) {
		return sqlSession.update("BanWord.insertPTClover", hmap);
	}
	//방송시작 정보 저장 메서드
	@Override
	public int inserBroadStart(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("BanWord.insertBroadStart", map);
	}
	
	//방송통계 받기위한 메서드
	@Override
	public ArrayList<BroadCast> selectBroadCast(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("BanWord.selectBroadCast");
	}
	@Override
	public int braodEnd(SqlSessionTemplate sqlSession, int chNo) {
		return sqlSession.update("BanWord.broadEnd", chNo);
	}
	@Override
	public int updateMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("BanWord.updateMember", userId);
	}
	@Override
	public int updateNMember(SqlSessionTemplate sqlSession, String owner) {
		return sqlSession.update("BanWord.updateNMember", owner);
	}
	@Override
	public int broadTitleUpdate(SqlSessionTemplate sqlSession, int chNo, String broadTitle) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("chNo", chNo);
		map.put("broadTitle", broadTitle);
		
		return sqlSession.update("BanWord.broadTitleUpdate", map);
	}
	@Override
	public List<String> searchCategory(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("BanWord.searchCategory");
	}
	@Override
	public List<String> searchCategory1(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectList("BanWord.searchCategory1", category);
	}
	@Override
	public int broadCategoryUpdate(SqlSessionTemplate sqlSession, int chNo, String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("chNo", chNo);
		map.put("data", data);
		return sqlSession.update("BanWord.broadCategoryUpdate", map);
	}

	
}
