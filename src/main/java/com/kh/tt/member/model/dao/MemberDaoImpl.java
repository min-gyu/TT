package com.kh.tt.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.CQAndAttach;
import com.kh.tt.member.model.vo.MainRanking;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.subscribe.model.vo.Subscribe;

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

	// 채널 생성을 위한 회원 시퀀스
	@Override
	public int selectUno(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Member.selectUno");
	}

	// 회원 가입 시 채널 자동 생성
	@Override
	public int createChannel(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Member.createChannel", m);
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
	
	// 신고문의게시판 시퀀스
	@Override
	public int selectCqNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("CQandAttach.selectCqNo");
	}
	
	// 문의하기
	@Override
	public int insertQuestion(SqlSessionTemplate sqlSession, CQAndAttach ca) {
		return sqlSession.insert("CQandAttach.insertQuestion", ca);
	}
	
	// 문의 첨부 파일
	@Override
	public int insertQAt(SqlSessionTemplate sqlSession, CQAndAttach ca) {
		return sqlSession.insert("CQandAttach.insertQAttach", ca);
	}

	// 신고하기
	@Override
	public int insertClaim(SqlSessionTemplate sqlSession, CQAndAttach ca) {
		return sqlSession.insert("CQandAttach.insertClaim", ca);
	}

	// 문의 첨부 파일
	@Override
	public int insertCAt(SqlSessionTemplate sqlSession, CQAndAttach ca) {
		return sqlSession.insert("CQandAttach.insertCAttach", ca);
	}

	// 신고 아이디 체크
	@Override
	public int targetIdCheck(SqlSessionTemplate sqlSession, String targetId) {
		return sqlSession.selectOne("Member.targetIdCheck", targetId);
	}

	// 메인 페이지 vod 랭킹
	@Override
	public List<MainRanking> mainVodList() {
		//return sqlSession.selectList("MainRank.vodList");
		return null;
	}

	

}
