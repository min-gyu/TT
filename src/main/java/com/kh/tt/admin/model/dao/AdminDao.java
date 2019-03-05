package com.kh.tt.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.admin.model.vo.AdClover;
import com.kh.tt.admin.model.vo.Category;
import com.kh.tt.admin.model.vo.VodLog;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.CQAndAttach;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Exchange;
import com.kh.tt.myPage.model.vo.Payment;

public interface AdminDao {

	// 1. 전체 회원 수 카운트
	int getAllCount() throws AdminException;
	
	// 1. 페이징 된 전체 회원 조회 
	List<Member> selectMemberList(PageInfo pi) throws AdminException;
	
	// 1. 검색 - 전체 회원 수 카운트
	int getSearchAllCount(String sid) throws AdminException;
	
	// 1. 검색 - 페이징 된 전체 회원 조회
	List<Member> searchAllMemberList(String sid, PageInfo pi) throws AdminException;		
	
	
	// 2. 정지 회원 수 카운트
	int getBanCount() throws AdminException;
	
	// 2. 페이징 된 정지 회원 조회
	List<Member> selectBanList(PageInfo pi) throws AdminException;

	// 2. 검색 - 정지 회원 수 카운트
	int getSearchBanCount(String sid) throws AdminException;
	
	// 2. 검색 - 페이징 된 정지 회원 목록 조회
	List<Member> searchBanMemberList(String sid, PageInfo pi) throws AdminException;

	
	// 3. 탈퇴 회원 수 카운트
	int getLeaveCount() throws AdminException;
	
	// 3. 페이징 된 탈퇴 회원 조회
	List<Member> selectLeaveList(PageInfo pi) throws AdminException;

	// 3. 검색 - 탈퇴 회원 수 카운트
	int getSearchLeaveCount(String sid) throws AdminException;

	// 3. 검색 - 페이징 된 탈퇴 회원 목록 조회
	List<Member> searchLeaveList(String sid, PageInfo pi) throws AdminException;

	// 카테고리 관리
	List<Category> selectCategList() throws AdminException;

	List<Category> detailCateg(int num);

	//충전내역 조회 - 카운트
	int getChargeClover(SqlSessionTemplate sqlSession) throws AdminException;

	//충전내역 조회 - 리스트
	List<Payment> selectChargeCloverList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminException;


	//환전신청내역 - 카운트
	int getExchangeClover(SqlSessionTemplate sqlSession) throws AdminException;

	//환전신청내역 - 리스트
	List<Exchange> selectExchangeCloverList(SqlSessionTemplate sqlSession, PageInfo pi)  throws AdminException;

	//환전완료내역 - 카운트
	int getExchange2Clover(SqlSessionTemplate sqlSession) throws AdminException;
	
	//환전완료내역 - 리스트
	List<Exchange> selectExchange2CloverList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminException;

	//환전수락
	int updateExchangeStatus(SqlSessionTemplate sqlSession, int[] arr) throws AdminException;

	List<Board> totalVod(SqlSessionTemplate sqlSession, PageInfo pi);

	int deleteAvod(int[] arr, SqlSessionTemplate sqlSession);

	int getAVod(SqlSessionTemplate sqlSession);


	int getadminDVod(SqlSessionTemplate sqlSession);

	List<VodLog> totalAdminD(SqlSessionTemplate sqlSession, PageInfo pi);

	// 신고 수 카운트
	int getClaimCount() throws AdminException;

	// 페이징 신고 리스트
	List<CQAndAttach> selectClaimList(PageInfo pi) throws AdminException;

	// 신고 상세보기
	CQAndAttach claimOne(int no);

	// 타겟 회원 경고 증가
	int targetBanCount(int cno);
	
	// 신고자 보상
	int claimReward(int cno);
	
	// 보유 클로버 증가
	int updateTotalClover(int cno);

	
	// 문의 수 카운트
	int getQCount() throws AdminException;

	// 페이징 문의 리스트
	List<CQAndAttach> selectQuestionList(PageInfo pi) throws AdminException;
	
	// 문의 상세보기
	CQAndAttach questionOne(int no);

	Object questionReply(HashMap<String, Object> map);

	List<CQAndAttach> qReplyList(int qno);


	
	
	



}
