package com.kh.tt.member.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.member.model.dao.MemberDao;
import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.CQAndAttach;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.CQBoard;

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
	
	// 채널 생성을 위한 회원 시퀀스
	@Override
	public int selectUno() {
		return md.selectUno(sqlSession);
	}
	
	// 회원 가입 시 채널 자동 생성
	@Override
	public int createChannel(Member m) {
		return md.createChannel(sqlSession, m);
	}

	// 아이디 중복 체크
	@Override
	public HashMap<String, Object> idCheck(String userId) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// resultMap에 ret_code, ret_message를 키로 담음
		resultMap.put("ret_code", "S");	
		resultMap.put("ret_message", "");
		
		try {// 예외가 발생할 구문
			int count = md.idCheck(sqlSession, userId);
			switch (count) {
				case 1 :
					resultMap.put("ret_message", "이미 아이디가 존재합니다.");
				break;
				
				case 0 :
					resultMap.put("ret_message", "사용 가능한 아이디입니다.");
				break;
			}
		} catch (Exception e) {
			// 예외 발생시 catch 해주는 구문
			e.printStackTrace();
			resultMap.put("ret_code", "E");
			resultMap.put("ret_message", "errors : " + e);
		}
		
		return resultMap;
	}

	// 닉네임 중복 체크
	@Override
	public HashMap<String, Object> nickNameCheck(String nickName) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// resultMap에 ret_code, ret_message를 키로 담음
		resultMap.put("ret_code", "S");	
		resultMap.put("ret_message", "");
		
		try {// 예외가 발생할 구문
			int count = md.nickNameCheck(sqlSession, nickName);
			switch (count) {
				case 1 :
					resultMap.put("ret_message", "이미 닉네임이 존재합니다.");
				break;
				
				case 0 :
					resultMap.put("ret_message", "사용 가능한 닉네임 입니다.");
				break;
			}
		} catch (Exception e) {
			// 예외 발생시 catch 해주는 구문
			e.printStackTrace();
			resultMap.put("ret_code", "E");
			resultMap.put("ret_message", "errors : " + e);
		}
		
		return resultMap;
	}

	// 신고문의게시판 시퀀스
	@Override
	public int selectCqNo() {
		return md.selectCqNo(sqlSession);
	}
	
	// 문의하기
	@Override
	public int insertQuestion(CQAndAttach ca) {
		return md.insertQuestion(sqlSession, ca);
	}
	
	// 문의 첨부 파일
	@Override
	public int insertQAt(CQAndAttach ca) {
		return md.insertQAt(sqlSession, ca);
	}

	// 신고하기
	@Override
	public int insertClaim(CQAndAttach ca) {
		return md.insertClaim(sqlSession, ca);
	}

	// 신고 첨부 파일
	@Override
	public int insertCAt(CQAndAttach ca) {
		return md.insertCAt(sqlSession, ca);
	}
	
	// 신고 아이디 체크
	@Override
	public HashMap<String, Object> targetIdCheck(String targetId) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("ret_code", "S");	
		resultMap.put("ret_message", "");
		
		try {
			
			int count = md.targetIdCheck(sqlSession, targetId);
			switch (count) {
				case 1 :
					resultMap.put("ret_message", "존재하는 아이디 입니다.");
				break;
				
				case 0 :
					resultMap.put("ret_message", "존재하지 않는 아이디 입니다.");
				break;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			resultMap.put("ret_code", "E");
			resultMap.put("ret_message", "errors : " + e);
		}
		
		return resultMap;
	}

	


}
