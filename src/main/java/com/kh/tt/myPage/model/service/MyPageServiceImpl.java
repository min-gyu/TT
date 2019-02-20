package com.kh.tt.myPage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.common.PageInfo;
import com.kh.tt.myPage.model.dao.MyPageDao;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;
import com.kh.tt.myPage.model.vo.PtClover;

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
	public List<CQBoard> selectQuestion(int cqUno) throws MyPageException {

		List<CQBoard> questionList = mpd.selectQuesion(sqlSession,cqUno);
		
		
		return questionList;
	}

	//My문의 게시글 상세보기
	@Override
	public CQBoard selectQuestionOne(int bid) throws MyPageException {
		
		CQBoard questionOne = mpd.selectQuestionOne(sqlSession, bid);
		
		return questionOne;
	}
	
	
	
	//My신고 페이지
		@Override
		public List<CQBoard> selectClaim(int cqUno) throws MyPageException {
			
			List<CQBoard> claimList = mpd.selectClaim(sqlSession, cqUno);
			
			return claimList;
		}

		//My신고 게시글 상세보기
		@Override
		public CQBoard selectClaimOne(int bid) throws MyPageException {
			
			CQBoard claimOne = mpd.selectClaimOne(sqlSession, bid);
			
			return claimOne;
		}


		//선물한 클로버 조회 - 페이징 처리전
		@Override
		public int getAllGivePresent(int ptUno) throws MyPageException {

			return mpd.getAllGivePresent(sqlSession, ptUno);
		}


		//선물한 클로버 조회 - 페이지 처리 후
		@Override
		public List<PtClover> selectGivePresentList(PageInfo pi, int ptUno) throws MyPageException {
			
			return mpd.selectGivePresentList(sqlSession, pi,ptUno);
		}


}
