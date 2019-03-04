package com.kh.tt.admin.model.service;

import java.util.List;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.admin.model.vo.AdClover;
import com.kh.tt.admin.model.vo.Category;
import com.kh.tt.admin.model.vo.VodLog;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.Exchange;
import com.kh.tt.myPage.model.vo.Payment;

public interface AdminService {

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

	// 카테고리 조회
	List<Category> selectCategList() throws AdminException;

	List<Category> detailCateg(int num);

	//충전내역 조회 - 카운트
	int getChargeClover() throws AdminException;

	//충전내역 - 리스트
	List<Payment> selectChargeCloverList(PageInfo pi) throws AdminException;

	//환전신청내역 - 카운트
	int getExchangeClover() throws AdminException;

	//환전신청내역 - 리스트
	List<Exchange> selectExchangeCloverList(PageInfo pi) throws AdminException;

	//환전완료내역 - 카운트
	int getExchange2Clover() throws AdminException;

	//환전완료내역 - 리스트
	List<Exchange> selectExchange2CloverList(PageInfo pi) throws AdminException;

	//환전수락
	int updateExchangeStatus(int[] arr) throws AdminException;

	//VOD관리-리스트
	List<Board> totalVod(PageInfo pi);
	//VOD 관리자 삭제
	int deleteAvod(int[] arr);

	int getAVod();

	int getadminDVod();

	List<VodLog> totalAdminD(PageInfo pi);

}
