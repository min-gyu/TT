package com.kh.tt.login.google;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.member.model.vo.Member;

@Service
public class GoogleService {
	
	@Autowired
	private GoogleDao googleDao;

	public GoogleService(GoogleDao googleDao){
		this.googleDao = googleDao;
	}
	
	public int selectFindLoginUser(HashMap<String, Object> params) {
		return googleDao.selectFindLoginUser(params);
	}

	public Member selectLoginMember(HashMap<String, Object> params){
		return googleDao.selectLoginMember(params);
	}
}
