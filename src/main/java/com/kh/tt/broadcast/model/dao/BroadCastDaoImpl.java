package com.kh.tt.broadcast.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tt.broadcast.model.vo.BanWord;
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

	
}
