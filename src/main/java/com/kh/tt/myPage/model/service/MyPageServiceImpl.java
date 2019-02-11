package com.kh.tt.myPage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.myPage.model.dao.MyPageDao;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.Clover;

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

}
