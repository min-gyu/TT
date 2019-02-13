package com.kh.tt.myPage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.myPage.model.dao.MyPageDao;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;

@Service
public class MyPageServiceImpl implements MyPageService{

	
	//의존성 주입용 필드선언
	@Autowired
	private MyPageDao mpd;
	
	//DB연결
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//클로버 정보 가져오기
	@Override
	public List<Clover> selectClover() throws MyPageException {
		
		List<Clover> list = mpd.selectClover(sqlSession);
		
		return list;
	}


	//결제정보 추가
	@Override
	public int insertPayment(Payment pay) throws MyPageException {
		
		int result = mpd.insertPayment(sqlSession,pay);
		
		return result;
	}


	
	//클로버 충전내역 조회
	@Override
	public Map<Object, Object> selectChargeLog() throws MyPageException {
		
		Map<Object, Object> hmap = new HashMap<Object, Object>();
		
		hmap = mpd.selectChargeLog(sqlSession);
		
		return hmap;
	}

	//My문의 페이지
	@Override
	public List<CQBoard> selectQuestion() throws MyPageException {

		List<CQBoard> questionList = mpd.selectQuesion(sqlSession);
		
		
		return questionList;
	}

}
