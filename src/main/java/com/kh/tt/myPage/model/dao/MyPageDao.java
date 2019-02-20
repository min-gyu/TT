package com.kh.tt.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;
import com.kh.tt.myPage.model.vo.PtClover;

public interface MyPageDao {

	//클로버 정보 가져오기
	List<Clover> selectClover(SqlSessionTemplate sqlSession) throws MyPageException;

	//결제정보 추가
	int insertPayment(SqlSessionTemplate sqlSession, Payment pay) throws MyPageException;

	//클로버 충전내역 조회
	Map<Object, Object> selectChargeLog(SqlSessionTemplate sqlSession) throws MyPageException;

	//My문의 페이지
	List<CQBoard> selectQuesion(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException;

	//My문의 게시물 상세보기
	CQBoard selectQuestionOne(SqlSessionTemplate sqlSession, int bid) throws MyPageException;

	//My신고 페이지
	List<CQBoard> selectClaim(SqlSessionTemplate sqlSession,int cqUno) throws MyPageException;

	//My신고 게시물 상세보기
	CQBoard selectClaimOne(SqlSessionTemplate sqlSession, int bid) throws MyPageException;

	/*클로버 선물한 내역*/
	//선물한 클로버 조회 - 카운트
	int getAllGivePresent(SqlSessionTemplate sqlSession, int ptUno) throws MyPageException;

	//선물한 클로버 조회 - 리스트
	List<PtClover> selectGivePresentList(SqlSessionTemplate sqlSession,PageInfo pi, int ptUno) throws MyPageException;

	//클로버 선물한내역 검색 조회 - 카운트
	int getSearchGiveCloverCount(SqlSessionTemplate sqlSession, int ptUno, String date1) throws MyPageException;

	//클로버 선물한내역 검색 조회 - 리스트
	List<PtClover> searchAllGiveCloverList(SqlSessionTemplate sqlSession, PageInfo pi, int ptUno, String date1) throws MyPageException;

	
	/*클로버 선물받은 내역*/
	//선물받은 클로버 조회 - 카운트
	int getAllTakePresent(SqlSessionTemplate sqlSession, int ptUno) throws MyPageException;

	//선물받은 클로버 조회 - 리스트
	List<PtClover> selectTakePresentList(SqlSessionTemplate sqlSession, PageInfo pi, int ptUno) throws MyPageException;

	
	//접속중인 회원 비밀번호 확인
	Member checkMember(SqlSessionTemplate sqlSession, int mUno) throws MyPageException;

	

}
