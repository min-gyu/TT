package com.kh.tt.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException {
		
		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);

		if(loginUser == null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}
		
		return loginUser;
	}

	// 회원 가입
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Member.insertMember", m);
	}

	// 암호화 된 비밀번호 조회용 메소드
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectPwd", m.getUserId());
	}

	// 로그인 정보 조회용 메소드
	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectLoginUser", m);
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("Member.idCheck", userId);
	}

	// 닉네임 중복 체크
	@Override
	public int nickNameCheck(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("Member.nickNameCheck", nickName);
	}

}
