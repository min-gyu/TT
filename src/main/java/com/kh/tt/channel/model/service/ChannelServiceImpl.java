package com.kh.tt.channel.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.broadcast.model.vo.BanWord;
import com.kh.tt.channel.model.dao.ChannelDao;
import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.channel.model.vo.Relation;
import com.kh.tt.member.model.vo.Member;

@Service
public class ChannelServiceImpl implements ChannelService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ChannelDao cd;

	// 채널 관리 - VOD업로드 메소드
	@Override
	public int insertVod(Board b) {

		int result = cd.insertVod(sqlSession, b);
		System.out.println("service" + result);
		return result;
	}

	//// 채널 관리 - 첨부파일 위한 bNo추출
	@Override
	public Board selectbNo(Board b) {
		return cd.selectbNo(sqlSession, b);
	}

	// 채널 관리 - VOD업로드시 첨부파일 업로드 메소드
	@Override
	public int insertAt(Attachment a) {
		System.out.println("service도착");
		int result = cd.insertAt(sqlSession, a);
		return result;
	}

	// 채널 관리 - VOD 리스트 메소드
	@Override
	public List<Board> vodList(int i, int j,int ChNo) {
		HashMap<Object, Integer> map = new HashMap<Object, Integer>(); // MAP을 이용해 담기
		map.put("current", i);
		map.put("limit", j);
		map.put("ChNo", ChNo);

		return cd.vodList(sqlSession, map);
	}

	// VOD상세보기-조회수 추가
	@Override
	public void increaseViewC(int bNo, HttpSession session) {
	
			cd.increaseViewC(bNo, sqlSession);
		
		}

	

	// VOD상세보기-구독하기 메소드
	@Override
	public int addSubscirbe(int cuNo, int uNo) {

		// 구독한 이력 조회
		int result1 = cd.selectSubscibe(cuNo, uNo, sqlSession);
		System.out.println("result1 결과 : " + result1);// 1이면 존재 0이면 없음

		if (result1 == 0) {// 조회결과가 0이면 값 구독 값 추가하기
			int result2 = cd.addSubscirbe(cuNo, uNo, sqlSession);
			System.out.println("result2 결과 : " + result2);

			return 0;// 추가후 0리턴
		} else {
			return 1;// 결과 존재할때 1리턴
		}

	}

	// VOD상세보기-내용 메소드
	@Override
	public Board vodOne(int bNo) {
		return cd.vodOne(bNo, sqlSession);
	}

	// VOD상세보기-영상 메소드
	@Override
	public Attachment vodOneR(int bNo) {

		return cd.vodOneR(bNo, sqlSession);
	}

	// VOD리스트 총 개수 메소드
	@Override
	public int getLisCount(int i) {
		return cd.getListCount(i, sqlSession);
	}
	

	// 채널 회원 정보 메소드
	@Override
	public Member selectmInfo(int uNo) {
		return cd.selectmInfo(uNo, sqlSession);
	}

	// 댓글 추가 메소드
	@Override
	public Object insertDet(HashMap<String, Object> map) {
		return cd.insertDet(map, sqlSession);

	}

	// 댓글 개수 출력하기 메소드
	@Override
	public int listDetCount(int bNo) {

		return cd.listDetCount(bNo, sqlSession);
	}

	//댓글 리스트 메소드
	@Override
	public List<Board> listDet(int i, int j, int k) {
		HashMap<Object, Integer> map = new HashMap<Object, Integer>(); // MAP을 이용해 담기
		map.put("bNo", i);
		map.put("current", j);
		map.put("limit", k);
		return cd.listDet(map, sqlSession);

	}

	//댓글 삭제 메소드
	@Override
	public Object deleteDet(HashMap<String, Integer> map) {
		
		return cd.deleteDet(map,sqlSession);
	}

	@Override
	public int onebNo(int bNo) {
		
		return cd.onebNo(bNo,sqlSession);
	}

	//베너사진 추가 메소드
	@Override
	public int insertBimg(Attachment a) {
		return cd.insertbImg(a,sqlSession);
	}

	//베너 사진 적용전 확인 메소드
	@Override
	public int lastBimg(int i) {
		
		return cd.lastBimg(i,sqlSession);
	}

	//베너 사진 업데이트 메소드
	@Override
	public int updateBimg(Attachment a) {
		return cd.updateBimg(a,sqlSession);
		
	}

	//프로필 사진 조회 메소드
	@Override
	public int lastPimg(int i) {
		return cd.lastPimg(i,sqlSession);
	}
//프로필 사진 업로드 메소드
	@Override
	public int insertPimg(Attachment a) {
		return cd.insertPimg(a,sqlSession);
	}
//프로필 사진 업데이트 메소드
	@Override
	public int updatePimg(Attachment a) {
		return cd.updatePimg(a,sqlSession);
		
	}
//채널 메인 사진 조회용 메소드
	@Override
	public Attachment selectbInfo(int chNo) {
		return cd.selectbInfo(chNo,sqlSession);
	}
//사이드바 프로필 사진 조회용 메소드
	@Override
	public Attachment selectpInfo(int chNo) {
		return cd.selectpInfo(chNo,sqlSession);
	}

	//채널 소개 업데이트 메소드
	@Override
	public int updatecInfo(HashMap<String, Object> map) {
		return cd.updatecInfo(map,sqlSession);
	}

	//총 구독자수 메소드
	@Override
	public int totalSub(int chNo) {
		return cd.totalSub(chNo,sqlSession);
	}

	//총 구독자 목록 메소드
	@Override
	public List<Relation> selecttSub(int i, int j, int chNo) {
		// TODO Auto-generated method stub
		return cd.selecttSub(i, j,chNo,sqlSession);
	}
	
	//금칙어 추가 메소드
		@Override
		public int insertBanLan(HashMap<String, Object> map) {
			return cd.insertBanLan(map,sqlSession);
		}

		@Override
		public Member selecttInfo(int chNo) {
			return cd.selecttInfo(chNo,sqlSession);
		}

		//메인 VOD출력용 메소드
		@Override
		public List<Board> getMainVList(int chNo) {
			return cd.getMainVList(chNo,sqlSession);
		}

		@Override
		public int vodDelete(int bNo) {
			return cd.vodDelete(bNo,sqlSession);
		}

		@Override
		public int updateVod(Board b) {
			return cd.updateVod(b,sqlSession);
		}

		@Override
		public int updatevAt(Attachment a) {
			return cd.updatevAt(a,sqlSession);
		}

		@Override
		public List<Relation> selectManager(int cuNo) {
			return cd.selectManager(cuNo,sqlSession);
		}

		@Override
		public int listBCount(int chNo) {
			return cd.listBCount(chNo,sqlSession);
		}

		@Override
		public List<BanWord> listBan(int chNo, int i, int j) {
			HashMap<Object, Integer> map = new HashMap<Object, Integer>(); // MAP을 이용해 담기
			map.put("chNo", chNo);
			map.put("current", i);
			map.put("limit", j);
			return cd.listBan(map,sqlSession);
		}

		@Override
		public int deleteBanW(HashMap<String, Integer> map) {
			return cd.deleteBanW(map,sqlSession);
		}

		


	


	

}
