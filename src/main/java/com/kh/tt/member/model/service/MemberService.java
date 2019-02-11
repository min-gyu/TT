package com.kh.tt.member.model.service;

import java.util.ArrayList;

import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.vo.Clover;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	

	
	
}
