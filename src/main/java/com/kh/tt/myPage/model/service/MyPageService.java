package com.kh.tt.myPage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Exchange;
import com.kh.tt.myPage.model.vo.MyBroadCast;
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
	List<CQBoard> selectQuestion(PageInfo pi, int cqUno) throws MyPageException;

	//My문의 게시글 상세보기
	CQBoard selectQuestionOne(int bid) throws MyPageException;
	
	
	//My신고 페이지 조회
	List<CQBoard> selectClaim(PageInfo pi, int cqUno) throws MyPageException;

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
	int updateModify(String nickName, String encPassword, int mUno) throws MyPageException;

	//회원번호, 탈퇴사유 update
	int modifyOutStatus(int mUno, String reason) throws MyPageException;

	//환전신청 내역 insert
	int insertExchange(int mUno, int cnt) throws MyPageException;

	//환전 - 카운트
	int getAllExchange(int mUno) throws MyPageException;

	//환전 - 리스트
	List<Exchange> selectExchangeList(PageInfo pi, int mUno) throws MyPageException;

	//클로버 충전내역 조회 - 카운트
	int getAllchargeClover(int ptUno) throws MyPageException;

	//클로버 충전내역 조회 - 리스트
	List<Payment> selectChargeList(PageInfo pi, int ptUno) throws MyPageException;

	//신고 - 카운트
	int getClaimCount(int cqUno) throws MyPageException;

	//문의 - 카운트
	int getQuestionCount(int cqUno) throws MyPageException;

	//계좌등록
	int updateBank(HashMap<String, Object> hmap) throws MyPageException;

	//계좌 삭제하기
	int deleteBank(int mUno) throws MyPageException;
	
	//보유클로버 업데이트
	int updateClover(HashMap<String, Object> hmap) throws MyPageException;

	//게시글에 첨부된 파일 이름 가져오기
	String selectImgName(int bid) throws MyPageException;

	//방송통계 - 카운트
	int btTotalCount(int cqUno) throws MyPageException;

	//방송통계 - 리스트
	List<MyBroadCast> selectbtTotal(PageInfo pi, int cqUno) throws MyPageException;


}
