package com.kh.tt.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;

public interface MyPageDao {

	//클로버 정보 가져오기
	List<Clover> selectClover(SqlSessionTemplate sqlSession) throws MyPageException;

	//결제정보 추가
	int insertPayment(SqlSessionTemplate sqlSession, Payment pay) throws MyPageException;

	//클로버 충전내역 조회
	Map<Object, Object> selectChargeLog(SqlSessionTemplate sqlSession) throws MyPageException;

	//My문의 페이지
	List<CQBoard> selectQuesion(SqlSessionTemplate sqlSession) throws MyPageException;

}
