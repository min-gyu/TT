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
import com.kh.tt.myPage.model.vo.MyBroadCast;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Clover;
import com.kh.tt.myPage.model.vo.Exchange;
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
	public List<CQBoard> selectQuesion(SqlSessionTemplate sqlSession, PageInfo pi,  int cqUno) throws MyPageException {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<CQBoard> questionList = sqlSession.selectList("CQBoard.selectQuestion", cqUno, rowBounds);
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
	public List<CQBoard> selectClaim(SqlSessionTemplate sqlSession,PageInfo pi,int cqUno) throws MyPageException {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		System.out.println("신고 Dao에서 cqUno : "+cqUno);
		
		
		List<CQBoard> claimList = sqlSession.selectList("CQBoard.selectClaim",cqUno, rowBounds);
		
		if(claimList == null) {
			throw new MyPageException("My신고 페이지 조회 실패!");
		}
		
		
		return claimList;
	}

	//My신고 게시글 상세보기
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
		
		if (result < 0) {
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
		
		if (result < 0) {
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
		
		if (result < 0) {
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
	public int updateModify(SqlSessionTemplate sqlSession, String nickName, String encPassword, int mUno) throws MyPageException {
		
		int result1=0;
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("mUno",mUno );
		hmap.put("nickName",nickName );
		hmap.put("encPassword",encPassword );
		
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


	//환전신청 DB에 값 insert
	@Override
	public int insertExchange(SqlSessionTemplate sqlSession, int mUno, int cnt) throws MyPageException {

		int result1 = 0; //Exchange테이블에 insert
		int result2 = 0; //ExchangeLog테이블에 insert
		int result=0; //반환할값
		
		int exresult=0;
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("mUno",mUno);
		hmap.put("cnt",cnt);
		
		//환전내역 추가(환전번호, 회원번호, 클로버 개수)
		result1 = sqlSession.insert("Exchange.insertExchange",hmap);
		System.out.println("result1의 결과 : "+result1);
		
		//환전상세내역 추가(일련번호, 환전번호, 날짜, 상태) 
		result2 = sqlSession.insert("ExchangeLog.insertExchangeLog");
		System.out.println("result2의 결과 : "+result2);
		
		if(result1<0||result2<0) {
			throw new MyPageException("결제정보 삽입 실패!");
		}else {
			result = 1;
		}
	
		return result;
	}


	//환전 - 카운트
	@Override
	public int getAllExchange(SqlSessionTemplate sqlSession, int mUno) throws MyPageException {
		
		int result = sqlSession.selectOne("Exchange.getAllExchange",mUno);
		
		if (result < 0) {
			throw new MyPageException("환전내역 전체 수 조회 실패!");
		}
		
		return result;
	}


	//환전 - 리스트
	@Override
	public List<Exchange> selectExchangeList(SqlSessionTemplate sqlSession, PageInfo pi, int mUno)
			throws MyPageException {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Exchange> ExchangeList = sqlSession.selectList("Exchange.selectExchangeList", mUno, rowBounds);

		if(ExchangeList == null) {
			throw new MyPageException("환전내역 페이징 처리 실패!");
		}
		
		return ExchangeList;
	}

	//클로버 충전내역 조회 - 카운트
	@Override
	public int getAllchargeClover(SqlSessionTemplate sqlSession, int ptUno) throws MyPageException {
		
		int result = sqlSession.selectOne("Payment.getAllchargeClover",ptUno);
		
		if (result < 0) {
			throw new MyPageException("충전내역 전체 수 조회 실패!");
		}
		
		return result;
	}

	//클로버 충전내역 조회 - 리스트
	@Override
	public List<Payment> selectChargeList(SqlSessionTemplate sqlSession, PageInfo pi, int ptUno)
			throws MyPageException {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Payment> chargeList = sqlSession.selectList("Payment.selectChargeList", ptUno, rowBounds);

		if(chargeList == null) {
			throw new MyPageException("충전내역 페이징 처리 실패!");
		}
		
		return chargeList;
	}

	//신고 - 카운트
	@Override
	public int getClaimCount(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {

		int result = sqlSession.selectOne("CQBoard.getClaimCount",cqUno);
		if (result < 0) {
			throw new MyPageException("My신고 전체 수 조회 실패!");
		}
		
		return result;
	}

	//문의 - 카운트
	@Override
	public int getQuestionCount(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {

		int result = sqlSession.selectOne("CQBoard.getQuestionCount",cqUno);
		if (result < 0) {
			throw new MyPageException("My문의 전체 수 조회 실패!");
		}
		
		return result;
	}


	//계좌등록
	@Override
	public int updateBank(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) throws MyPageException {
		int result=0;
		
		result = sqlSession.update("Member.updateBank",hmap);
		
		if(result==0) {
			throw new MyPageException("계좌 정보 변경 실패!");
		}
		
		return result;
	}

	//계좌 삭제하기
	@Override
	public int deleteBank(SqlSessionTemplate sqlSession, int mUno) throws MyPageException {
		int result=0;
		
		result = sqlSession.update("Member.deleteBank",mUno);
		
		if(result==0) {
			throw new MyPageException("계좌 정보 삭제 실패!");
		}
		
		return result;
	}

	//보유클로버 업데이트
	@Override
	public int updateClover(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap) throws MyPageException {
		int result=0;
		
		result = sqlSession.update("Member.updateClover",hmap);
		
		if(result==0) {
			throw new MyPageException("보유클로버 업데이트 실패!");
		}
		
		return result;
	}


	//게시글에 첨부된 파일 이름 가져오기
	@Override
	public String selectImgName(SqlSessionTemplate sqlSession, int cqNo) throws MyPageException {
		
		System.out.println("DaoImpl에서받은 cqNo : "+cqNo);

		String imgName = sqlSession.selectOne("CQandAttach.selectImgName", cqNo);
		
		System.out.println("DaoImpl에서받은 imgName : "+imgName);
		
		if(imgName==null) {
			throw new MyPageException("첨부파일 조회 실패!");
		}
		return imgName;
	}

	//방송통계 - 카운트
	@Override
	public int btTotalCount(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {
		
		
		int result = sqlSession.selectOne("MyBroadCast.btTotalCount", cqUno);
		System.out.println("result값 : "+result);
		
		if (result < 0) {
			result=0;
		}
		//혹은 result=0으로 세팅해주는것이 맞나?
		
		return result;
	}

	//방송통계 - 리스트
	@Override
	public List<MyBroadCast> selectbtTotal(SqlSessionTemplate sqlSession, PageInfo pi, int cqUno) throws MyPageException {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<MyBroadCast> bcTotalList = sqlSession.selectList("MyBroadCast.selectbtTotal", cqUno, rowBounds);

		if(bcTotalList == null) {
			throw new MyPageException("선물한 클로버 페이징 처리 실패!");
		}
		
		return bcTotalList;
	}

	//관리자 답변 가져오기
	@Override
	public String selectMngQuestion(SqlSessionTemplate sqlSession, int bid) throws MyPageException {
		
		String mngQuestion = sqlSession.selectOne("CQBoard.selectMngQuestion", bid);
		
		System.out.println("DaoImpl에서받은 mngQuestion : "+mngQuestion);
		
		if(mngQuestion==null) {
			throw new MyPageException("관리자 답변 조회 실패!");
		}
		return mngQuestion;
	}


	//평균방송시간 > 방송시간 총합 / 방송횟수 (total)
	@Override
	public int selectTotalTime(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {

		int totalTime = 0 ;
		int totalSumTime = sqlSession.selectOne("MyBroadCast.selectTotalSumTime", cqUno);
		int totalCount =  sqlSession.selectOne("MyBroadCast.selectTotalCount", cqUno);
		
		System.out.println("DaoImpl에서받은 방송시간총합 : "+totalSumTime);
		System.out.println("DaoImpl에서받은 방송 횟수 : "+totalCount);
		
		totalTime = (int)totalSumTime/totalCount;
		
		if(totalTime<0) {
			totalTime=0;
		}
		return totalTime;
	}

	//최고시청자수 > 누적시청자수 중 가장 큰값(total)
	@Override
	public int selectTotalMax(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {
		
		int totalMax =  sqlSession.selectOne("MyBroadCast.selectTotalMax", cqUno);
		
		System.out.println("DaoImpl에서받은 totalMax : "+totalMax);
		
		
		if(totalMax<0) {
			totalMax=0;
		}
		return totalMax;
	}

	//평균시청자수 > 누적시청자수 총합 / 방송횟수 (total)
	@Override
	public int selectTotalAvg(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {

		int totalAvg =  0;
				
		int totalTime=sqlSession.selectOne("MyBroadCast.selectTotalAvg", cqUno);
		int totalCnt = sqlSession.selectOne("MyBroadCast.selectTotalCount", cqUno);
		
		totalAvg = (int)totalTime/totalCnt;
		
		System.out.println("DaoImpl에서받은 totalAvg : "+totalAvg);
		
		
		if(totalAvg<0) {
			totalAvg=0;
		}
		return totalAvg;
	}

	//평균방송시간 > 방송시간 총합 / 방송횟수 (today)
	@Override
	public int selectTodayTime(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {

		int todayTime = 0 ;
		int todaySumTime = sqlSession.selectOne("MyBroadCast.selectTodaySumTime", cqUno);
		int todayCount =  sqlSession.selectOne("MyBroadCast.selectTodayCount", cqUno);
		
		System.out.println("DaoImpl에서받은 방송시간총합(today) : "+todaySumTime);
		System.out.println("DaoImpl에서받은 방송 횟수(today) : "+todayCount);
		
		todayTime = (int)todaySumTime/todayCount;
		
		if(todayTime<0) {
			todayTime=0;
		}
		return todayTime;
	}

	//최고시청자수 > 누적시청자수 중 가장 큰값(today)
	@Override
	public int selectTodayMax(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {

		int todayMax =  sqlSession.selectOne("MyBroadCast.selectTodayMax", cqUno);
		
		System.out.println("DaoImpl에서받은 todayMax : "+todayMax);
		
		
		if(todayMax<0) {
			todayMax=0;
		}
		return todayMax;
	}

	//평균시청자수 > 누적시청자수 총합 / 방송횟수 (today)
	@Override
	public int selectTodayAvg(SqlSessionTemplate sqlSession, int cqUno) throws MyPageException {

		int todayAvg =  0;
				
		int todayTime=sqlSession.selectOne("MyBroadCast.selectTodayAvg", cqUno);
		int todayCnt = sqlSession.selectOne("MyBroadCast.selectTodayCount", cqUno);
		
		todayAvg = (int)todayTime/todayCnt;
		
		System.out.println("DaoImpl에서받은 totalAvg : "+todayAvg);
		
		
		if(todayAvg<0) {
			todayAvg=0;
		}
		return todayAvg;
	}
}
