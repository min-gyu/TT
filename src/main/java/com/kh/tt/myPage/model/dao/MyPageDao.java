package com.kh.tt.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;

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

}
