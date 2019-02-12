package com.kh.tt.myPage.model.service;

import java.util.List;

import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;


public interface MyPageService {

	//클로버 정보 가져오기
	List<Clover> selectClover() throws MyPageException;

	//결제정보 추가
	int insertPayment(Payment pay) throws MyPageException;

}
