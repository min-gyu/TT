package com.kh.tt.login.google;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tt.member.model.vo.Member;

@Repository
public class GoogleDao {

	private final String MAPPER_NAME = "GOOGLE.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplates;
	
	public GoogleDao(SqlSessionTemplate sqlSessionTemplates){
		this.sqlSessionTemplates = sqlSessionTemplates;
	}
	
	public int selectFindLoginUser(HashMap<String, Object> params) {
		return sqlSessionTemplates.selectOne(MAPPER_NAME + "selectFindLoginUser", params);
	}

	public Member selectLoginMember(HashMap<String, Object> params) {
		return sqlSessionTemplates.selectOne(MAPPER_NAME + "selectLoginMember", params);
	}

}
