package com.kh.tt.member.model.service;

import java.util.HashMap;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.CQAndAttach;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.CQBoard;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	// 회원 가입
	int insertMember(Member m);
	
	int selectUno();
	
	int createChannel(Member m);

	// 아이디 중복 체크
	HashMap<String, Object> idCheck(String userId);

	// 닉네임 중복 체크
	HashMap<String, Object> nickNameCheck(String nickName);

	// 신고문의 게시판 시퀀스
	int selectCqNo();
	
	// 문의하기
	int insertQuestion(CQAndAttach ca);
	
	// 문의 첨부 파일 
	int insertQAt(CQAndAttach ca);

	// 신고하기
	int insertClaim(CQAndAttach ca);

	// 신고 첨부 파일
	int insertCAt(CQAndAttach ca);

	// 신고 아이디 체크
	HashMap<String, Object> targetIdCheck(String targetId);

	

	

}
