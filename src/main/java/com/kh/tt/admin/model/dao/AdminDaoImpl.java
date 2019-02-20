package com.kh.tt.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.admin.model.vo.Category;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 1. 전체 회원 수 카운트
	@Override
	public int getAllCount() throws AdminException {
		int result = sqlSession.selectOne("Admin.selectAllCount");
		
		if (result <= 0) {
			throw new AdminException("회원 수 조회 실패");
		}
		
		return result;
	}
	
	// 1. 페이징 된 전체 회원 조회 
	@Override
	public List<Member> selectMemberList(PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Member> mList = sqlSession.selectList("Admin.memberList", null, rowBounds);

		if(mList == null) {
			throw new AdminException("회원 조회 실패");
		}
		
		return mList;
	}
	
	// 1. 검색 - 전체 회원 수 카운트
	@Override
	public int getSearchAllCount(String sid) throws AdminException {
		int result = sqlSession.selectOne("Admin.searchAllCount", sid);
		
		if (result <= 0) {
			throw new AdminException("회원 수 조회 실패");
		}
		
		return result;
	}
	
	// 1. 검색 - 페이징 된 전체 회원 조회
	@Override
	public List<Member> searchAllMemberList(String sid, PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Member> mList = sqlSession.selectList("Admin.searchAllMemberList", sid, rowBounds);

		if(mList == null) {
			throw new AdminException("회원 검색 실패");
		}
		
		return mList;
	}

	
	// 2. 정지 회원 수 카운트
	@Override
	public int getBanCount() throws AdminException {
		int result = sqlSession.selectOne("Admin.selectBanCount");
		
		if (result <= 0) {
			throw new AdminException("정지 회원 수 조회 실패");
		}
		
		return result;
	}
	
	// 2. 페이징 된 정지 회원 조회
	@Override
	public List<Member> selectBanList(PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Member> bList = sqlSession.selectList("Admin.banList", null, rowBounds);

		if(bList == null) {
			throw new AdminException("정지 회원 조회 실패");
		}
		return bList;
	}
	
	
	// 2. 검색 - 정지 회원 수 카운트
	@Override
	public int getSearchBanCount(String sid) throws AdminException {
		int result = sqlSession.selectOne("Admin.searchBanCount", sid);
		
		if (result <= 0) {
			throw new AdminException("정지 회원 수 검색 실패");
		}
		
		return result;
	}
	
	// 2. 검색 - 페이징 된 정지 회원 목록 조회
	@Override
	public List<Member> searchBanMemberList(String sid, PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Member> bList = sqlSession.selectList("Admin.searchBanList", sid, rowBounds);

		if(bList == null) {
			throw new AdminException("정지 회원 검색 실패");
		}
		return bList;
	}
	
	
	// 3. 탈퇴 회원 수 카운트
	public int getLeaveCount() throws AdminException {
		int result = sqlSession.selectOne("Admin.selectLeaveCount");
		
		if (result <= 0) {
			throw new AdminException("탈퇴 회원 수 조회 실패");
		}
		
		return result;
	}

	// 3. 페이징 된 탈퇴 회원 조회
	@Override
	public List<Member> selectLeaveList(PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		List<Member> lList = sqlSession.selectList("Admin.leaveList", null, rowBounds);

		if(lList == null) {
			throw new AdminException("탈퇴 회원 조회 실패");
		}
		return lList;
	}

	// 3. 검색 - 탈퇴 회원 수 카운트
	@Override
	public int getSearchLeaveCount(String sid) throws AdminException {
		int result = sqlSession.selectOne("Admin.searchLeaveCount", sid);
		
		if (result <= 0) {
			throw new AdminException("탈퇴 회원 수 조회 실패");
		}
		
		return result;
	}

	// 2. 검색 - 페이징 된 탈퇴 회원 목록 조회
	@Override
	public List<Member> searchLeaveList(String sid, PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		List<Member> lList = sqlSession.selectList("Admin.searchLeaveList", sid, rowBounds);

		if(lList == null) {
			throw new AdminException("탈퇴 회원 검색 실패");
		}
		return lList;
	}

	// 카테고리 관리
	@Override
	public List<Category> selectCategList() throws AdminException {
		return sqlSession.selectList("Admin.selectCategList");
	}

	@Override
	public List<Category> detailCateg(int num) {
		return sqlSession.selectList("Admin.selectDetailCateg", num);
	}
	

}
