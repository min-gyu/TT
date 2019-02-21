package com.kh.tt.myPage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;
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


		/*클로버 선물한 내역*/
		//선물한 클로버 조회 - 카운트
		@Override
		public int getAllGivePresent(int ptUno) throws MyPageException {

			return mpd.getAllGivePresent(sqlSession, ptUno);
		}


		//선물한 클로버 조회 - 리스트
		@Override
		public List<PtClover> selectGivePresentList(PageInfo pi, int ptUno) throws MyPageException {
			
			return mpd.selectGivePresentList(sqlSession, pi,ptUno);
		}

		//클로버 선물한내역 검색 조회 - 카운트
		@Override
		public int getSearchGiveCloverCount(int ptUno, String date1) throws MyPageException {
			
			return mpd.getSearchGiveCloverCount(sqlSession, ptUno, date1);
		}

		//클로버 선물한내역 검색 조회 - 리스트
		@Override
		public List<PtClover> searchAllGiveCloverList(String date1, int ptUno, PageInfo pi) throws MyPageException {
			
			return mpd.searchAllGiveCloverList(sqlSession, pi,ptUno, date1);
		}


		
		
		
		/*클로버 선물받은 내역*/
		//선물받은 클로버 조회 - 카운트
		@Override
		public int getAllTakePresent(int ptUno) throws MyPageException {
			
			return mpd.getAllTakePresent(sqlSession, ptUno);
		}

		//선물받은 클로버 조회 - 리스트
		@Override
		public List<PtClover> selectTakePresentList(PageInfo pi, int ptUno) throws MyPageException {
			
			return mpd.selectTakePresentList(sqlSession, pi,ptUno);
		}


		//접속중인 회원 비밀번호 확인
		@Override
		public Member checkMember(int mUno) throws MyPageException {
			
			
			return mpd.checkMember(sqlSession,mUno);
		}

		//개인정보수정
		@Override
		public int updateModify(String nickName, String userPwd, int mUno) throws MyPageException {
			
			System.out.println("Dao도착"); 
			System.out.println("mUno : "+mUno);
			System.out.println("nickName : "+nickName);
			System.out.println("userPwd : "+userPwd);
			
			return mpd.updateModify(sqlSession,nickName,userPwd, mUno);
		}


}
