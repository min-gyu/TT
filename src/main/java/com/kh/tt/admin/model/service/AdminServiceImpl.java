package com.kh.tt.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.admin.model.dao.AdminDao;
import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao md;
	
	// 1. 전체 회원 조회
	@Override
	public List<Member> selectMemberList() throws AdminException {
		return md.selectMemberList();
	}

	// 2. 정지 회원 조회
	@Override
	public List<Member> selectBanList() throws AdminException {
		return  md.selectBanList();
	}
	
	// 3. 탈퇴 회원 조회
	@Override
	public List<Member> selectLeaveList() throws AdminException {
		return md.selectLeaveList();
	}

}
