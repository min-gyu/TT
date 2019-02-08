package com.kh.tt.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.member.model.dao.MemberDao;
import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	
	@Override
	public Member loginMember(Member m) throws LoginException {

		System.out.println(sqlSession.hashCode());

		Member loginUser = md.loginCheck(sqlSession, m);
		
		return loginUser;
	}
}
