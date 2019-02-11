package com.kh.tt.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	
	//암호화 후 로그인용 메소드
	@Override
	public Member loginMember(Member m) throws LoginException {
		
		Member loginUser = null;
		
		String encPassword = md.selectEncPassword(sqlSession, m);
		
		if(!passwordEncoder.matches(m.getUserPwd(), encPassword)) {
			// 일치하지 않을 시
			throw new LoginException("로그인 실패!");
		}else {
			loginUser = md.selectMember(sqlSession, m);
		}
		
		return loginUser;
	}

	// AOP 설정 회원가입 - 암호화 포함
	@Override
	public int insertMember(Member m) {
		
		return md.insertMember(sqlSession, m);
	}
}
