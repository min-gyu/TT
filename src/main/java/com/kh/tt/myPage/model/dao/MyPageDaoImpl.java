package com.kh.tt.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;


@Repository
public class MyPageDaoImpl implements MyPageDao{

	
	//클로버 정보 가져오기
	@Override
	public List<Clover> selectClover(SqlSessionTemplate sqlSession) throws MyPageException {
		
		List<Clover> list = sqlSession.selectList("Clover.cloverInfo");
		
		if(list==null) {
			throw new MyPageException("클로버 정보 조회 실패!");
		}
		return list;
	}

	
	//결제정보 추가
	@Override
	public int insertPayment(SqlSessionTemplate sqlSession, Payment pay) throws MyPageException {
		
		int result = sqlSession.insert("Payment.insertPayment",pay);
		
		if(result==0) {
			throw new MyPageException("결제정보 삽입 실패!");
		}
	
		return result;
	}

}
