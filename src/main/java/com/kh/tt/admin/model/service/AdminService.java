package com.kh.tt.admin.model.service;

import java.util.List;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;

public interface AdminService {

	// 전체 회원 조회
	List<Member> selectMemberList() throws AdminException;

	// 정지 회원 조회
	List<Member> selectBanList() throws AdminException;

	// 탈퇴 회원 조회
	List<Member> selectLeaveList() throws AdminException;

	// 전체 회원 목록 조회용 메소드
	int getListCount() throws AdminException;

	// 페이징 처리 된 전체 회원 목록 조회용 메소드
	List<Member> selectMemberList(PageInfo pi) throws AdminException;

	// 전체 회원 검색
	List<Member> selectAllMemberList() throws AdminException;

	List<Member> selectAllMemberList(PageInfo pi);

}
