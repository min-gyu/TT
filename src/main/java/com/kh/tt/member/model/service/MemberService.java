package com.kh.tt.member.model.service;

import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	int insertMember(Member m);

	Member idCheck(String userId);

}
