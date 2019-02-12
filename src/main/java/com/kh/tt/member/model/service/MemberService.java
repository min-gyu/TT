package com.kh.tt.member.model.service;

import java.util.HashMap;

import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	int insertMember(Member m);

	HashMap<String, Object> idCheck(String userId);

	HashMap<String, Object> nickNameCheck(String nickName);
}
