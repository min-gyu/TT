package com.kh.tt.myPage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Payment;
import com.kh.tt.myPage.model.vo.PtClover;


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


	//클로버 충전내역 조회
	@Override
	public Map<Object, Object> selectChargeLog(SqlSessionTemplate sqlSession) throws MyPageException {
		
		Map<Object, Object> hmap = new HashMap<Object, Object>();
		
		Payment pay = sqlSession.selectOne("Payment.selectLog");
		
		if(hmap==null) {
			throw new MyPageException("클로버 충전내역 조회 실패!");
		}
		
		return hmap;
	}


	
	//My문의 페이지
	@Override
	public List<CQBoard> selectQuesion(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {
		
		List<CQBoard> questionList = sqlSession.selectList("CQBoard.selectQuestion", cqUno);
		System.out.println("Dao결과 : "+questionList);
		
		if(questionList == null) {
			throw new MyPageException("My문의 페이지 조회 실패!");
		}
		
		
		return questionList;
	}

	//My문의 게시글 상세보기
	@Override
	public CQBoard selectQuestionOne(SqlSessionTemplate sqlSession, int bid) throws MyPageException {
		
		CQBoard questionOne = sqlSession.selectOne("CQBoard.selectQuestionOne",bid);
		
		if(questionOne == null) {
			throw new MyPageException("My문의 게시글 상세보기 실패!");
		}
		
		return questionOne;
	}
	
	
	
	
	//My신고 페이지
	@Override
	public List<CQBoard> selectClaim(SqlSessionTemplate sqlSession,int cqUno) throws MyPageException {

		List<CQBoard> claimList = sqlSession.selectList("CQBoard.selectClaim",cqUno);
		
		if(claimList == null) {
			throw new MyPageException("My신고 페이지 조회 실패!");
		}
		
		
		return claimList;
	}

	//My문의 게시글 상세보기
	@Override
	public CQBoard selectClaimOne(SqlSessionTemplate sqlSession, int bid) throws MyPageException {

		CQBoard claimOne = sqlSession.selectOne("CQBoard.selectClaimOne",bid);
		
		if(claimOne == null) {
			throw new MyPageException("My신고 게시글 상세보기 실패!");
		}
		return claimOne;
	}


	/*클로버 선물한 내역*/
	//선물한 클로버 조회 - 카운트
	@Override
	public int getAllGivePresent(SqlSessionTemplate sqlSession, int ptUno) throws MyPageException {
		
		
		int result = sqlSession.selectOne("PtClover.getAllGivePresent",ptUno);
		
		if (result <= 0) {
			result = 0;
			return result;
		}
		
		return result;
	}


	//선물한 클로버 조회 - 리스트
	@Override
	public List<PtClover> selectGivePresentList(SqlSessionTemplate sqlSession,PageInfo pi, int ptUno) throws MyPageException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<PtClover> givePresentList = sqlSession.selectList("PtClover.selectGivePresentList", ptUno, rowBounds);

		if(givePresentList == null) {
			throw new MyPageException("선물한 클로버 페이징 처리 실패!");
		}
		
		return givePresentList;
	}


	//클로버 선물한내역 검색 조회 - 카운트
	@Override
	public int getSearchGiveCloverCount(SqlSessionTemplate sqlSession, int ptUno, String date1) throws MyPageException {
		
		
		
		int result = sqlSession.selectOne("PtClover.getSearchGiveCloverCount", date1);
		
		if (result <= 0) {
			throw new MyPageException("선물한 클로버 검색결과 조회 실패!");
		}
		
		return result;
	}

	//클로버 선물한내역 검색 조회 - 리스트
	@Override
	public List<PtClover> searchAllGiveCloverList(SqlSessionTemplate sqlSession, PageInfo pi, int ptUno, String date1)
			throws MyPageException {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<PtClover> searchAllGiveCloverList = sqlSession.selectList("PtClover.searchAllGiveCloverList", date1, rowBounds);

		if(searchAllGiveCloverList == null) {
			throw new MyPageException("선물한 클로버 페이징 처리 실패!");
		}

		return searchAllGiveCloverList;
	}


	
	
	
	

	/*클로버 선물받은 내역*/
	//선물받은 클로버 조회 - 카운트
	@Override
	public int getAllTakePresent(SqlSessionTemplate sqlSession, int ptUno) throws MyPageException {

		int result = sqlSession.selectOne("PtClover.getAllTakePresent",ptUno);
		
		if (result <= 0) {
			throw new MyPageException("선물받은 클로버 전체 수 조회 실패!");
		}
		
		return result;
	}

	//선물받은 클로버 조회 - 리스트
	@Override
	public List<PtClover> selectTakePresentList(SqlSessionTemplate sqlSession, PageInfo pi, int ptUno)
			throws MyPageException {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<PtClover> takePresentList = sqlSession.selectList("PtClover.selectTakePresentList", ptUno, rowBounds);

		if(takePresentList == null) {
			throw new MyPageException("선물한 클로버 페이징 처리 실패!");
		}
		
		return takePresentList;
	}


	//접속중인 회원을 객체로 담기
	@Override
	public Member checkMember(SqlSessionTemplate sqlSession, int mUno) throws MyPageException {
		
		Member member = sqlSession.selectOne("Member.checkMember",mUno);
		
		if (member==null) {
			throw new MyPageException("회원수정위한 정보 조회 실패!");
		}
		
		return member;
	}


	//개인정보수정
	@Override
	public int updateModify(SqlSessionTemplate sqlSession, String nickName, String userPwd, int mUno) throws MyPageException {
		
		int result1=0;
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("mUno",mUno );
		hmap.put("nickName",nickName );
		hmap.put("userPwd",userPwd );
		
		result1 = sqlSession.update("Member.updateNickName",hmap);
		
		if(result1==0) {
			throw new MyPageException("회원 정보 변경 실패!");
		}
		
		return result1;
		
	}

	//회원번호, 탈퇴사유, 탈퇴상태 update
	@Override
	public int modifyOutStatus(SqlSessionTemplate sqlSession, int mUno, String reason) throws MyPageException {
		
		int result=0;
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("mUno",mUno );
		hmap.put("reason",reason );
		
		result = sqlSession.update("Member.modifyOutStatus",hmap);
		System.out.println("탈퇴상태 처리결과 : "+result);
		
		if(result==0) {
			throw new MyPageException("탈퇴상태 전환 실패!");
		}
		
		return result;
	}
}
