package com.kh.tt.login.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.member.model.exception.LoginException;
import com.kh.tt.member.model.vo.Member;

@Service
public class KaKaoService {
	
	@Autowired
	private KaKaoDao kakaoDao;

	public KaKaoService(KaKaoDao kakaoDao){
		this.kakaoDao = kakaoDao;
	}
	
	public int selectFindLoginUser(HashMap<String, Object> params) {
		return kakaoDao.selectFindLoginUser(params);
	}

	public Member selectLoginMember(HashMap<String, Object> params){
		return kakaoDao.selectLoginMember(params);
	}

	
	
}
