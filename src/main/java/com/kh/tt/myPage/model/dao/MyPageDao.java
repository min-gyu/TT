package com.kh.tt.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.Clover;

public interface MyPageDao {

	//클로버 정보 가져오기
	List<Clover> selectClover(SqlSessionTemplate sqlSession) throws MyPageException;

}
