package com.kh.tt.admin.model.service;

import java.util.List;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;

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

}
