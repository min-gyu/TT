package com.kh.tt.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 1. 전체 회원 조회 
	@Override
	public List<Member> selectMemberList() throws AdminException {
		List<Member> mList = sqlSession.selectList("Member.memberList");

		if(mList == null) {
			throw new AdminException("회원 조회 실패");
		}
		return mList;
	}
	
	// 2. 정지 회원 조회
	@Override
	public List<Member> selectBanList() throws AdminException {
		List<Member> bList = sqlSession.selectList("Member.banList");

		if(bList == null) {
			throw new AdminException("정지 회원 조회 실패");
		}
		return bList;
	}
	
	// 3. 탈퇴 회원 조회
	@Override
	public List<Member> selectLeaveList() throws AdminException {
		List<Member> lList = sqlSession.selectList("Member.leaveList");

		if(lList == null) {
			throw new AdminException("탈퇴 회원 조회 실패");
		}
		return lList;
	}

}
