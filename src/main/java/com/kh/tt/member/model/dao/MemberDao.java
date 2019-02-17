package com.kh.tt.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.CQAndAttach;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.CQBoard;

public interface MemberDao {

	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException;

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	int idCheck(SqlSessionTemplate sqlSession, String userId);

	int nickNameCheck(SqlSessionTemplate sqlSession, String nickName);

	// 신고문의게시판 시퀀스
	int selectCqNo(SqlSessionTemplate sqlSession);
	
	// 문의하기
	int insertQuestion(SqlSessionTemplate sqlSession, CQAndAttach ca);

	// 문의 첨부 파일
	int insertQAt(SqlSessionTemplate sqlSession, CQAndAttach ca);

	// 신고하기
	int insertClaim(SqlSessionTemplate sqlSession, CQAndAttach ca);

	// 신고 첨부 파일
	int insertCAt(SqlSessionTemplate sqlSession, CQAndAttach ca);

	// 신고 아이디 체크
	int targetIdCheck(SqlSessionTemplate sqlSession, String targetId);

	int selectUno(SqlSessionTemplate sqlSession);

	int createChannel(SqlSessionTemplate sqlSession, Member m);





}
