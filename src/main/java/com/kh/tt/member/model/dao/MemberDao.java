package com.kh.tt.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.CQAndAttach;
import com.kh.tt.member.model.vo.MainRanking;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.subscribe.model.vo.Subscribe;

public interface MemberDao {

	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException;

	// 회원 가입
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	
	// 채널 생성을 위한 회원 시퀀스
	int selectUno(SqlSessionTemplate sqlSession);

	// 회원 가입 시 채널 자동 생성
	int createChannel(SqlSessionTemplate sqlSession, Member m);

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

	// 메인 페이지 vod 랭킹
	List<MainRanking> mainVodList();

	// 메인페이지 생방송 리스트
	List<MainRanking> mainLiveList();

	int blackBlock(SqlSessionTemplate sqlSession, Map<String, Object> reqMap);

	




}
