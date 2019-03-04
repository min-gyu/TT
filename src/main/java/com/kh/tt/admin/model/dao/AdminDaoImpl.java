package com.kh.tt.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tt.admin.model.exception.AdminException;
import com.kh.tt.admin.model.vo.AdClover;
import com.kh.tt.admin.model.vo.Category;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.common.PageInfo;
import com.kh.tt.member.model.vo.CQAndAttach;
import com.kh.tt.member.model.vo.Member;
import com.kh.tt.myPage.model.exception.MyPageException;
import com.kh.tt.myPage.model.vo.CQBoard;
import com.kh.tt.myPage.model.vo.Exchange;
import com.kh.tt.myPage.model.vo.Payment;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 1. 전체 회원 수 카운트
	@Override
	public int getAllCount() throws AdminException {
		int result = sqlSession.selectOne("Admin.selectAllCount");
		
		if (result <= 0) {
			throw new AdminException("회원 수 조회 실패");
		}
		
		return result;
	}
	
	// 1. 페이징 된 전체 회원 조회 
	@Override
	public List<Member> selectMemberList(PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Member> mList = sqlSession.selectList("Admin.memberList", null, rowBounds);

		if(mList == null) {
			throw new AdminException("회원 조회 실패");
		}
		
		return mList;
	}
	
	// 1. 검색 - 전체 회원 수 카운트
	@Override
	public int getSearchAllCount(String sid) throws AdminException {
		int result = sqlSession.selectOne("Admin.searchAllCount", sid);
		
		if (result <= 0) {
			throw new AdminException("회원 수 조회 실패");
		}
		
		return result;
	}
	
	// 1. 검색 - 페이징 된 전체 회원 조회
	@Override
	public List<Member> searchAllMemberList(String sid, PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Member> mList = sqlSession.selectList("Admin.searchAllMemberList", sid, rowBounds);

		if(mList == null) {
			throw new AdminException("회원 검색 실패");
		}
		
		return mList;
	}

	
	// 2. 정지 회원 수 카운트
	@Override
	public int getBanCount() throws AdminException {
		int result = sqlSession.selectOne("Admin.selectBanCount");
		
		if (result <= 0) {
			throw new AdminException("정지 회원 수 조회 실패");
		}
		
		return result;
	}
	
	// 2. 페이징 된 정지 회원 조회
	@Override
	public List<Member> selectBanList(PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Member> bList = sqlSession.selectList("Admin.banList", null, rowBounds);

		if(bList == null) {
			throw new AdminException("정지 회원 조회 실패");
		}
		return bList;
	}
	
	
	// 2. 검색 - 정지 회원 수 카운트
	@Override
	public int getSearchBanCount(String sid) throws AdminException {
		int result = sqlSession.selectOne("Admin.searchBanCount", sid);
		
		if (result <= 0) {
			throw new AdminException("정지 회원 수 검색 실패");
		}
		
		return result;
	}
	
	// 2. 검색 - 페이징 된 정지 회원 목록 조회
	@Override
	public List<Member> searchBanMemberList(String sid, PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Member> bList = sqlSession.selectList("Admin.searchBanList", sid, rowBounds);

		if(bList == null) {
			throw new AdminException("정지 회원 검색 실패");
		}
		return bList;
	}
	
	
	// 3. 탈퇴 회원 수 카운트
	public int getLeaveCount() throws AdminException {
		int result = sqlSession.selectOne("Admin.selectLeaveCount");
		
		if (result <= 0) {
			throw new AdminException("탈퇴 회원 수 조회 실패");
		}
		
		return result;
	}

	// 3. 페이징 된 탈퇴 회원 조회
	@Override
	public List<Member> selectLeaveList(PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		List<Member> lList = sqlSession.selectList("Admin.leaveList", null, rowBounds);

		if(lList == null) {
			throw new AdminException("탈퇴 회원 조회 실패");
		}
		return lList;
	}

	// 3. 검색 - 탈퇴 회원 수 카운트
	@Override
	public int getSearchLeaveCount(String sid) throws AdminException {
		int result = sqlSession.selectOne("Admin.searchLeaveCount", sid);
		
		if (result <= 0) {
			throw new AdminException("탈퇴 회원 수 조회 실패");
		}
		
		return result;
	}

	// 2. 검색 - 페이징 된 탈퇴 회원 목록 조회
	@Override
	public List<Member> searchLeaveList(String sid, PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		List<Member> lList = sqlSession.selectList("Admin.searchLeaveList", sid, rowBounds);

		if(lList == null) {
			throw new AdminException("탈퇴 회원 검색 실패");
		}
		return lList;
	}

	// 카테고리 관리
	@Override
	public List<Category> selectCategList() throws AdminException {
		return sqlSession.selectList("Admin.selectCategList");
	}

	@Override
	public List<Category> detailCateg(int num) {
		return sqlSession.selectList("Admin.selectDetailCateg", num);
	}

	//충전내역 조회 - 카운트
	@Override
	public int getChargeClover(SqlSessionTemplate sqlSession) throws AdminException {
		int result = sqlSession.selectOne("Payment.getChargeClover");
		
		if (result < 0) {
			throw new AdminException("충전내역 전체 수 조회 실패!");
		}
		
		return result;
	}


	//충전내역 조회 - 리스트
	@Override
	public List<Payment> selectChargeCloverList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminException {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Payment> chargeList = sqlSession.selectList("Payment.selectAdChargeList", null , rowBounds);

		if(chargeList == null) {
			throw new AdminException("충전내역 페이징 처리 실패!");
		}
		
		return chargeList;
	}

	//환전신청내역 - 카운트
	@Override
	public int getExchangeClover(SqlSessionTemplate sqlSession) throws AdminException {
		
		int result = sqlSession.selectOne("Exchange.getExchangeClover");
		
		if (result < 0) {
			throw new AdminException("환전신청내역 전체 수 조회 실패!");
		}
		
		return result;
	}

	//환전신청내역 - 리스트
	@Override
	public List<Exchange> selectExchangeCloverList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminException {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Exchange> exchangeList = sqlSession.selectList("Exchange.selectExchangeCloverList", null , rowBounds);

		if(exchangeList == null) {
			throw new AdminException("환전신청내역 페이징 처리 실패!");
		}
		
		return exchangeList;
	}

	//환전완료내역 - 카운트
	@Override
	public int getExchange2Clover(SqlSessionTemplate sqlSession) throws AdminException {

		int result = sqlSession.selectOne("Exchange.getExchange2Clover");
		
		if (result < 0) {
			throw new AdminException("환전완료내역 전체 수 조회 실패!");
		}
		
		return result;
	}

	//환전완료내역 - 리스트
	@Override
	public List<Exchange> selectExchange2CloverList(SqlSessionTemplate sqlSession, PageInfo pi) throws AdminException {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Exchange> exchange2List = sqlSession.selectList("Exchange.selectExchange2CloverList", null , rowBounds);

		if(exchange2List == null) {
			throw new AdminException("환전신청내역 페이징 처리 실패!");
		}
		
		return exchange2List;
	}

	//환전수락
	@Override
	public int updateExchangeStatus(SqlSessionTemplate sqlSession, int[] arr) throws AdminException {
		
		// arr배열에는 회원들의 아이디 담겨있음
		
		int[] resultArr = new int[arr.length];
		int[] resultArr2 = new int[arr.length];
		int sum = 0;
		int sum2=0;
		int result=0;
		
		for(int i=0;i<arr.length;i++) {
			
			int exNo = arr[i];
			
			//EXCHANGE에 상태 update
			resultArr2[i] = sqlSession.update("Exchange.updateExchangeStatus",exNo);
			
			//EXCHANGELOG에 insert
			resultArr[i] = sqlSession.insert("Exchange.insertExchangeStatus",exNo);
			
			if(resultArr[i]==0 || resultArr2[i]==0) {
				throw new AdminException("환전 접수처리 실패!");
			}else {
				sum2+=resultArr2[i]; //EXCHANGE에 상태 update
				sum+=resultArr[i];//EXCHANGELOG에 insert
			}
		}
		
		if(sum/resultArr.length==1 && sum2/resultArr2.length==1) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		return result;
	}

	
	
	
	//삭제할 VOD목록
	@Override
	public int deleteAvod(int[] arr, SqlSessionTemplate sqlSession) {
		
		int sum=0;
		int result=0;
		int[] resultArr = new int[arr.length];
		for(int i=0;i<arr.length;i++) {
			
			int bNo = arr[i];
			System.out.println(bNo);
			resultArr[i] = sqlSession.update("Board.updateAdminV",bNo);
			sum+=resultArr[i];			
		}
		
		if(sum/resultArr.length==1) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		return result;
	}

	@Override
	public int getAVod(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Board.getAVod");
		
	}

	@Override
	public List<Board> totalVod(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<Board> list = sqlSession.selectList("Board.totalVod", null , rowBounds);

		System.out.println(list);
		return list;
	}

	@Override
	public int getClaimCount() throws AdminException {
		int result = sqlSession.selectOne("CQandAttach.selectClaimCount");
		
		if (result <= 0) {
			throw new AdminException("신고 수 조회 실패");
		}
		
		return result;
	}

	@Override
	public List<CQAndAttach> selectClaimList(PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<CQAndAttach> cList = sqlSession.selectList("CQandAttach.claimList", null, rowBounds);

		if(cList == null) {
			throw new AdminException("신고 조회 실패");
		}
		
		return cList;
	}
	
	// 신고 상세보기
	@Override
	public CQAndAttach claimOne(int no) {
		return sqlSession.selectOne("CQandAttach.claimOne", no);
	}

	// 타겟 회원 경고 증가
	@Override
	public int targetBanCount(int cno) {
		return sqlSession.update("CorrectClaim.targetBanCount", cno);
	}
	
	// 신고자 보상
	@Override
	public int claimReward(int cno) {
		return sqlSession.insert("CorrectClaim.claimReward", cno);
	}
	
	// 보유 클로버 증가
	@Override
	public int updateTotalClover(int cno) {
		return sqlSession.update("CorrectClaim.updateTotalClover", cno);
	}

	// 문의 수 카운트
	@Override
	public int getQCount() throws AdminException {
		int result = sqlSession.selectOne("CQandAttach.selectQCount");
		
		if (result <= 0) {
			throw new AdminException("문의 수 조회 실패");
		}
		
		return result;
	}

	// 페이징 문의 리스트
	@Override
	public List<CQAndAttach> selectQuestionList(PageInfo pi) throws AdminException {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		List<CQAndAttach> qList = sqlSession.selectList("CQandAttach.questionList", null, rowBounds);

		if(qList == null) {
			throw new AdminException("문의 조회 실패");
		}
		return qList;
	}

	// 문의 상세보기
	@Override
	public CQAndAttach questionOne(int no) {
		return sqlSession.selectOne("CQandAttach.questionOne", no);
	}

	@Override
	public Object questionReply(HashMap<String, Object> map) {
		return sqlSession.insert("CQandAttach.questionReply", map);
	}

	@Override
	public List<CQAndAttach> qReplyList(int qno) {
		return sqlSession.selectList("CQandAttach.qReplyList", qno);
	}

}
