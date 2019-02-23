package com.kh.tt.login.controller;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tt.member.model.vo.Member;

@Repository
public class KaKaoDao {

	private final String MAPPER_NAME = "KAKAO.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplates;
	
	public KaKaoDao(SqlSessionTemplate sqlSessionTemplates){
		this.sqlSessionTemplates = sqlSessionTemplates;
	}
	
	public int selectFindLoginUser(HashMap<String, Object> params) {
		return 0;
		//return sqlSession.selectOne(MAPPER_NAME + "selectFindLoginUser", params);
	}

	public Member selectLoginMember(HashMap<String, Object> params) {
		Member member = new Member();
		int intId = (int)params.get("id");
		member.setUserId(Integer.toString(intId));
		member.setUserPwd(Integer.toString(intId));
		
		return member;
		//return sqlSession.selectOne(MAPPER_NAME + "selectLoginMember", params);
	}

}
