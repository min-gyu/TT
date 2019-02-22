package com.kh.tt.channel.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.channel.model.dao.ChannelDao;
import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;
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
	public List<Board> vodList(int i, int j) {
		HashMap<Object, Integer> map = new HashMap<Object, Integer>(); // MAP을 이용해 담기
		map.put("current", i);
		map.put("limit", j);

		return cd.vodList(sqlSession, map);
	}

	// VOD상세보기-조회수 추가
	@Override
	public void increaseViewC(int bNo, HttpSession session) {
		// 세션에 저장된 조회시간 검색
		long update_time = 0;

		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문 실행x
		if (session.getAttribute("update_time_" + bNo) != null) {
			update_time = (Long) session.getAttribute("update_time_" + bNo);
		}
		// 시스템의 현재 시간을 current_time에 저장
		long current_time = System.currentTimeMillis();

		if (current_time - update_time > 5 * 1000) {
			cd.increaseViewC(bNo, sqlSession);
			session.setAttribute("update_time_" + bNo, current_time);
		}

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
	public int getLisCount(Board b) {
		return cd.getListCount(b, sqlSession);
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

	@Override
	public List<Board> listDet(int i, int j, int k) {
		HashMap<Object, Integer> map = new HashMap<Object, Integer>(); // MAP을 이용해 담기
		map.put("bNo", i);
		map.put("current", j);
		map.put("limit", k);
		return cd.listDet(map, sqlSession);

	}

	@Override
	public Object deleteDet(HashMap<String, Integer> map) {
		
		return cd.deleteDet(map,sqlSession);
	}

	@Override
	public int onebNo(int bNo) {
		
		return cd.onebNo(bNo,sqlSession);
	}

}
