package com.kh.tt.myPage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;
import com.kh.tt.myPage.model.vo.PtClover;


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

	/*클로버 선물한 내역*/
	//클로버 선물한내역 조회 - 카운트
	int getAllGivePresent(int ptUno) throws MyPageException;

	//클로버 선물한내역 조회 - 리스트
	List<PtClover> selectGivePresentList(PageInfo pi, int ptUno) throws MyPageException;

	//클로버 선물한내역 검색 조회 - 카운트
	int getSearchGiveCloverCount(int ptUno, String date1) throws MyPageException;

	//클로버 선물한내역 검색 조회 - 리스트
	List<PtClover> searchAllGiveCloverList(String date1, int ptUno, PageInfo pi)  throws MyPageException;

	
	/*클로버 선물받은 내역*/
	//클로버 선물받은내역 조회 - 카운트
	int getAllTakePresent(int ptUno) throws MyPageException;

	//클로버 선물받은내역 조회 - 리스트
	List<PtClover> selectTakePresentList(PageInfo pi, int ptUno) throws MyPageException;

	//접속중인 회원의 비밀번호 확인
	Member checkMember(int mUno) throws MyPageException;

	//개인정보수정
	int updateModify(String nickName, String userPwd, int mUno) throws MyPageException;


}
