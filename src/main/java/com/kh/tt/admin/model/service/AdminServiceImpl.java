package com.kh.tt.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.admin.model.dao.AdminDao;
import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.admin.model.vo.AdClover;
import com.kh.tt.admin.model.vo.Category;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.Exchange;
import com.kh.tt.myPage.model.vo.Payment;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao md;
	
	
	// 1. 전체 회원 수 카운트
	@Override
	public int getAllCount() throws AdminException {
		return md.getAllCount();
	}
	
	// 1. 페이징 된 전체 회원 조회 
	@Override
	public List<Member> selectMemberList(PageInfo pi) throws AdminException {
		return md.selectMemberList(pi);
	}

	// 1. 검색 - 전체 회원 수 카운트
	@Override
	public int getSearchAllCount(String sid) throws AdminException {
		return md.getSearchAllCount(sid);
	}
	
	// 1. 검색 - 페이징 된 전체 회원 조회
	@Override
	public List<Member> searchAllMemberList(String sid, PageInfo pi) throws AdminException {
		return md.searchAllMemberList(sid, pi);
	}

	
	// 2. 정지 회원 수 카운트
	@Override
	public int getBanCount() throws AdminException {
		return md.getBanCount();
	}
	
	// 2. 페이징 된 정지 회원 조회
	@Override
	public List<Member> selectBanList(PageInfo pi) throws AdminException {
		return  md.selectBanList(pi);
	}
	
	// 2. 검색 - 정지 회원 수 카운트
	public int getSearchBanCount(String sid) throws AdminException {
		return md.getSearchBanCount(sid);
	}
	
	// 2. 검색 - 페이징 된 정지 회원 목록 조회
	@Override
	public List<Member> searchBanMemberList(String sid, PageInfo pi) throws AdminException {
		return md.searchBanMemberList(sid, pi);
	}


	// 3. 탈퇴 회원 수 카운트
	@Override
	public int getLeaveCount() throws AdminException {
		return md.getLeaveCount();
	}

	// 3. 페이징 된 탈퇴 회원 조회
	@Override
	public List<Member> selectLeaveList(PageInfo pi) throws AdminException {
		return md.selectLeaveList(pi);
	}
	
	// 3. 검색 - 탈퇴 회원 수 카운트
	@Override
	public int getSearchLeaveCount(String sid) throws AdminException {
		return md.getSearchLeaveCount(sid);
	}

	// 3. 검색 - 페이징 된 탈퇴 회원 목록 조회
	@Override
	public List<Member> searchLeaveList(String sid, PageInfo pi) throws AdminException {
		return md.searchLeaveList(sid, pi);
	}

	// 카테고리 관리
	@Override
	public List<Category> selectCategList() throws AdminException {
		return md.selectCategList();
	}

	@Override
	public List<Category> detailCateg(int num) {
		return md.detailCateg(num);
	}

	
	//충전내역 조회 - 카운트
	@Override
	public int getChargeClover() throws AdminException {
		
		return md.getChargeClover(sqlSession);
	}
	
	//충전내역 조회 - 리스트
	@Override
	public List<Payment> selectChargeCloverList(PageInfo pi) throws AdminException {
		
		return md.selectChargeCloverList(sqlSession, pi);
	}
	
	//환전신청내역 - 카운트
	@Override
	public int getExchangeClover() throws AdminException {
		
		return md.getExchangeClover(sqlSession);
	}

	//환전신청내역 - 리스트
	@Override
	public List<Exchange> selectExchangeCloverList(PageInfo pi) throws AdminException {
		
		return md.selectExchangeCloverList(sqlSession, pi);
	}

	//환전완료내역 - 카운트
	@Override
	public int getExchange2Clover() throws AdminException {
		
		return md.getExchange2Clover(sqlSession);
	}

	//환전완료내역 - 리스트
	@Override
	public List<Exchange> selectExchange2CloverList(PageInfo pi) throws AdminException {

		return md.selectExchange2CloverList(sqlSession, pi);
	}

	//환전수락
	@Override
	public int updateExchangeStatus(int[] arr) throws AdminException {

		return md.updateExchangeStatus(sqlSession, arr);
		
	}
	
	
	
	
	

	

	
	


}
