package com.kh.tt.channel.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.tt.broadcast.model.vo.BanWord;
import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.channel.model.vo.Relation;
import com.kh.tt.channel.model.vo.cPtClover;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.PtClover;



public interface ChannelService{

	//채널관리-VOD 추가 메소드
	int insertVod(Board b);
	Board selectbNo(Board b);
	
	//채널관리-VOD추가시 첨부파일 추가 메소드
	int insertAt(Attachment a);

	//채널관리-VOD리스트 메소드
	List<Board> vodList(int i,int j,int ChNo);
	//VOD리스트 총 개수 메소드
	int getLisCount(int i);
	
	//VOD상세보기-조회수 메소드
	void increaseViewC(int bNo, HttpSession session);

	//VOD상세보기-내용 메소드
	Board vodOne(int bNo);
	//VOD상세보기-영상 메소드
	Attachment vodOneR(int bNo);
	
	//채널 회원 정보 메소드
	Member selectmInfo(int uNo);
	
	//채널 구독하기 메소드
	int addSubscirbe(int cuNo, int uno);
	Object insertDet(HashMap<String, Object> map);
	
	//댓글 카운트 메소드
	int listDetCount(int bNo);
	//댓글 리스트 출력 메소드
	List<Board> listDet(int i, int j, int k);
	
	//댓글 삭제 메소드
	Object deleteDet(HashMap<String, Integer> map);
	//댓글 삭제후 돌아가기위한 메소드
	int onebNo(int bNo);
	
	//베너 사진 업로드 메소드
	int insertBimg(Attachment a);
	//베너 적용전 확인 메소드
	int lastBimg(int i);
	int updateBimg(Attachment a);
	int lastPimg(int i);
	int insertPimg(Attachment a);
	int updatePimg(Attachment a);

	Attachment selectbInfo(int chNo);
	Attachment selectpInfo(int chNo);
	int updatecInfo(HashMap<String, Object> map);
	int totalSub(int chNo);
	
	List<Relation> selecttSub(int i, int j, int chNo);
	int  insertBanLan(HashMap<String, Object> map);
	Member selecttInfo(int chNo);
	List<Board> getMainVList(int chNo);
	int vodDelete(int bNo);
	int updateVod(Board b);
	int updatevAt(Attachment a);
	List<Relation> selectManager(int cuNo);
	int listBCount(int chNo);
	List<BanWord> listBan(int chNo, int i, int j);
	int deleteBanW(HashMap<String, Integer> map);
	int insertBlack(HashMap<String, Object> map);
	int listBlackCount(int chNo);
	List<Relation> listBlack(int chNo, int i, int j);
	List<cPtClover> selectcInfo(int uno);
	int updateBlack(HashMap<String, Object> map);
	
	
	
	
	
	
	
	
	
	

	

	

}
