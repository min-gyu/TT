package com.kh.tt.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 1. 전체 회원 조회 
	@Override
	public List<Member> selectMemberList() throws AdminException {
		List<Member> mList = sqlSession.selectList("AdminMember.memberList");

		if(mList == null) {
			throw new AdminException("회원 조회 실패");
		}
		return mList;
	}
	
	// 2. 정지 회원 조회
	@Override
	public List<Member> selectBanList() throws AdminException {
		List<Member> bList = sqlSession.selectList("AdminMember.banList");

		if(bList == null) {
			throw new AdminException("정지 회원 조회 실패");
		}
		return bList;
	}
	
	// 3. 탈퇴 회원 조회
	@Override
	public List<Member> selectLeaveList() throws AdminException {
		List<Member> lList = sqlSession.selectList("AdminMember.leaveList");

		if(lList == null) {
			throw new AdminException("탈퇴 회원 조회 실패");
		}
		return lList;
	}
	
	// 전체 회원 목록 조회용 메소드
	@Override
	public int getListCount() throws AdminException {
		int result = sqlSession.selectOne("AdminMember.selectListCount");
		
		if (result <= 0) {
			throw new AdminException("게시글 수 조회 실패");
		}
		
		return result;
	}

	// 페이징 처리 된 전체 회원 목록 조회용 메소드
	@Override
	public List<Member> selectMemberList(PageInfo pi) throws AdminException {
		
		// 몇개의 게시글을 건너 뛰고 조회를 할 지에 대해 계산한다.
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		// RowBounds : mybatis에서 제공하는 페이징 조회
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Member> mList = sqlSession.selectList("AdminMember.memberList", null, rowBounds);

		if(mList == null) {
			throw new AdminException("회원 조회 실패");
		}
		return mList;
	}

	@Override
	public List<Member> selectAllMemberList() throws AdminException {
		List<Member> mList = sqlSession.selectList("AdminMember.selectAllMemberList");

		if(mList == null) {
			throw new AdminException("회원 검색 실패");
		}
		
		return mList;
	}

}
