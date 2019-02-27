package com.kh.tt.channel.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.channel.model.vo.Relation;
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
	
	//VOD개수 출력하기 메소드
	@Override
	public int getListCount(int i, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectLCount",i);
	}

	//회원정보 뽑기 메소드
	@Override
	public Member selectmInfo(int uNo, SqlSessionTemplate sqlSession) {
		Member result=sqlSession.selectOne("Member.selectmInfo", uNo);
		return result;
	}
	//댓글 추가 메소드
	@Override
	public Object insertDet(HashMap<String, Object> map, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Board.insertDet", map);
	}
	//댓글 리스트 카운트 메소드
	@Override
	public int listDetCount(int bNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.selectDCount",bNo);
	}
	//댓글 출력하기 메소드
	@Override
	public List<Board> listDet(HashMap<Object, Integer> map, SqlSessionTemplate sqlSession) {
		
	List<Board> result=sqlSession.selectList("Board.listDet",map);
	System.out.println("listDet: " +result);
	return result;//게시물 번호랑 페이지 정보로 목록 출력
	}
	//댓글 삭제하기 메소드
	@Override
	public Object deleteDet(HashMap<String, Integer> map, SqlSessionTemplate sqlSession) {
		return sqlSession.update("Board.deleteDet", map);	
		}
	//댓글 삭제 후 돌아가기 메소드
	@Override
	public int onebNo(int bNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Board.selectonebNo", bNo);
	}
	
	//베너사진 추가 메소드
	@Override
	public int insertbImg(Attachment a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Attachment.insertbImg", a);
	}
	//베너 사진 추가전 확인 메소드
	@Override
	public int lastBimg(int i,SqlSessionTemplate sqlSession) {
		
		int result=sqlSession.selectOne("Attachment.selectlastBimg",i);
		System.out.println(result);
		return result;
	}
	@Override
	public int updateBimg(Attachment a, SqlSessionTemplate sqlSession) {
		return sqlSession.update("Attachment.updateBimg",a);
	}
	
	//프로필 사진 추가 전 확인 메소드
	@Override
	public int lastPimg(int i,SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Attachment.selectPimg",i);
	}
	//프로필 사진 추가 메소드
	@Override
	public int insertPimg(Attachment a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Attachment.insertPimg",a);
	}
	//프로필 사진 업데이트 메소드
	@Override
	public int updatePimg(Attachment a, SqlSessionTemplate sqlSession) {
	return sqlSession.update("Attachment.updatePimg",a);
	}
	//채널 메인 베너 사진 조회용
	@Override
	public Attachment selectbInfo(int chNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Attachment.selectbInfo", chNo);
	}
	//채널 메인 프로필 사진 조회용
	@Override
	public Attachment selectpInfo(int chNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Attachment.selectpInfo", chNo);
	}
	//채널 메인 제목 사진 조회용
	@Override
	public Member selecttInfo(int chNo, SqlSessionTemplate sqlSession) {
	return sqlSession.selectOne("Member.selecttInfo",chNo);
	}
	//채널 제목 업데이트 메소드
	@Override
	public int updatecInfo(HashMap<String, Object> map, SqlSessionTemplate sqlSession) {
		return sqlSession.update("Member.updatecInfo", map);
	}
	//구독자 수 메소드
	@Override
	public int totalSub(int chNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Relation2.totalSub",chNo);
	}
	//구독자 리스트 출력 메소드
	@Override
	public List<Relation> selecttSub(int i, int j, int chNo, SqlSessionTemplate sqlSession) {
		HashMap<String,Object>  map=new HashMap<String,Object>();
		map.put("chNo", chNo);
		map.put("current", i);
		map.put("limit", j);
		return sqlSession.selectList("Relation2.selecttSub",map);

	}
	@Override
	public int insertBanLan(HashMap<String, Object> map, SqlSessionTemplate sqlSession) {
		int result= sqlSession.insert("BanWord.insertBanLan", map);
		System.out.println(result);
		return result;
	}
	//메인 채널 VOD출력용 메소드
	@Override
	public List<Board> getMainVList(int chNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Board.getMainVList", chNo);
	}
	
	
}
