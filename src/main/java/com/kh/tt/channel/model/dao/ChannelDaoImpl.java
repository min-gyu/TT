package com.kh.tt.channel.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.member.model.vo.Member;

@Repository
public class ChannelDaoImpl implements ChannelDao{

	
	//채널관리-VOD추가 메소드
	@Override
	public int insertVod(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		
		int result=sqlSession.insert("Board.insertVod",b);
		
		
		return result;
		
	}
	//채널관리-VOD추가 시 첨부파일업로드 메소드
	@Override
	public int insertAt(SqlSessionTemplate sqlSession, Attachment a) {
		
		int result=sqlSession.insert("Attachment.insertAt",a);
		System.out.println("첨부파일업로드"+result);
		
		return result;
	}

	//채널관리-VOD목록 메소드
	@Override
	public List<Board> vodList(SqlSessionTemplate sqlSession, Map<Object, Integer> map) {
		System.out.println(map);
		return sqlSession.selectList("Board.vodList", map);
	}


	//VOD상세보기-조회수 메소드
	@Override
	public int increaseViewC(int bNo, SqlSessionTemplate sqlSession) {
		System.out.println("조회수 증가 다오"+bNo);
		int result=sqlSession.update("Board.increaseVC",bNo);
		return result;
		
	}
	
	//VOD상세보기-내용 메소드
	@Override
	public Board vodOne(int bNo, SqlSessionTemplate sqlSession) {
		
		Board result= sqlSession.selectOne("Board.vodOne",bNo);
		System.out.println("상세보기"+result);
		return result;
	}
	
	//VOD상세보기-영상 메소드
	@Override
	public Attachment vodOneR(int bNo, SqlSessionTemplate sqlSession) {
		Attachment result=sqlSession.selectOne("Attachment.vodOneR",bNo);
		return result;
	}
	//VOD상세보기-구독 조회해보기
	@Override
	public int selectSubscibe(int cuNo, int uNo, SqlSessionTemplate sqlSession) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cuNo", cuNo);
		map.put("uNo", uNo);
		System.out.println(map);
		if(sqlSession.selectOne("Relation2.selectSub",map)==null) {
			return 0;
		}
		
		return 1;
	}
	//VOD상세보기-구독 추가하기
	@Override
	public int addSubscirbe(int cuNo, int uNo, SqlSessionTemplate sqlSession) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cuNo", cuNo);
		map.put("uNo", uNo);
		int result=sqlSession.insert("Relation2.addSub",map);
		return result;
	}
	
	@Override
	public Board selectbNo(SqlSessionTemplate sqlSession, Board b) {
	
		Board result=sqlSession.selectOne("Board.selectbNo", b);
		return result;
	}
	
	@Override
	public int getListCount(Board b,SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int result=sqlSession.selectOne("Board.getListCount",b);
		return result;
	}
	@Override
	public Member selectmInfo(int uNo, SqlSessionTemplate sqlSession) {
		Member result=sqlSession.selectOne("Member.selectmInfo", uNo);
		return result;
	}
	@Override
	public Object insertDet(HashMap<String, Object> map, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Board.insertDet", map);
	}
	
	

	

	
	

	



	
	

}
