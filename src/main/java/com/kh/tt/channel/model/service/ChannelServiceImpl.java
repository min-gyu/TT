package com.kh.tt.channel.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tt.channel.model.dao.ChannelDao;
import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;

@Service
public class ChannelServiceImpl implements ChannelService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ChannelDao cd;
	
	//채널 관리 - VOD업로드 메소드
	@Override
	public int insertVod(Board b) {
		
		
		int result=cd.insertVod(sqlSession, b);
		
		System.out.println("service"+result);
		
		return result;
		
	}
	//채널 관리 - VOD업로드시 첨부파일 업로드 메소드
	@Override
	public int insertAt(Attachment a) {
		System.out.println("service도착");
		int result=cd.insertAt(sqlSession,a);
		return result;
	}

	//채널 관리 - VOD 리스트 메소드
	@Override
	public List<Board> vodList() {
		
		
		return cd.vodList(sqlSession);
	}
	
	//VOD상세보기-조회수 추가
	@Override
	public void increaseViewC(int bNo, HttpSession session) {
		//세션에 저장된 조회시간 검색
		long update_time=0;
		
		//최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문 실행x
		if(session.getAttribute("update_time_"+bNo)!=null) {
			update_time = (long)session.getAttribute("update_time_"+bNo);
			
		}
		//시스템의 현재 시간을 current_time에 저장
		long current_time=System.currentTimeMillis();
		
		if(current_time -update_time>5*1000) {
			cd.increaseViewC(bNo,sqlSession);
			session.setAttribute("update_time_"+bNo, current_time);
		}
		
	}
	

	//VOD상세보기-내용 메소드
	@Override
	public Board vodOne(int bNo) {
		return cd.vodOne(bNo, sqlSession);
	}

	

	


}
