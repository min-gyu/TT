package com.kh.tt.myPage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;


public interface MyPageService {

	//클로버 정보 가져오기
	List<Clover> selectClover() throws MyPageException;

	//결제정보 추가
	int insertPayment(Payment pay) throws MyPageException;

	//클로버 충전내역 조회
	Map<Object, Object> selectChargeLog() throws MyPageException;

	//My문의 페이지 조회
	List<CQBoard> selectQuestion(int cqUno) throws MyPageException;

	//My문의 게시글 상세보기
	CQBoard selectQuestionOne(int bid) throws MyPageException;
	
	
	//My신고 페이지 조회
	List<CQBoard> selectClaim(int cqUno) throws MyPageException;

	//My신고 게시글 상세보기
	CQBoard selectClaimOne(int bid) throws MyPageException;


}
