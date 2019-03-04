package com.kh.tt.channel.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tt.broadcast.model.vo.BanWord;
import com.kh.tt.channel.model.vo.Attachment;
import com.kh.tt.channel.model.vo.Board;
import com.kh.tt.channel.model.vo.Relation;
import com.kh.tt.member.model.vo.Member;

public interface ChannelDao {

	int insertVod(SqlSessionTemplate sqlSession, Board b);

	int insertAt(SqlSessionTemplate sqlSession, Attachment a);

	List<Board> vodList(SqlSessionTemplate sqlSession, Map<Object, Integer> map);

	int increaseViewC(int bNo, SqlSessionTemplate sqlSession);

	Board vodOne(int bNo, SqlSessionTemplate sqlSession);

	Board selectbNo(SqlSessionTemplate sqlSession, Board b);

	Attachment vodOneR(int bNo, SqlSessionTemplate sqlSession);

	int getListCount(int i, SqlSessionTemplate sqlSession);

	Member selectmInfo(int uNo, SqlSessionTemplate sqlSession);

	int addSubscirbe(int cuNo, int uNo, SqlSessionTemplate sqlSession);

	int selectSubscibe(int cuNo, int uNo, SqlSessionTemplate sqlSession);

	Object insertDet(HashMap<String, Object> map, SqlSessionTemplate sqlSession);

	int listDetCount(int bNo, SqlSessionTemplate sqlSession);

	List<Board> listDet(HashMap<Object, Integer> map, SqlSessionTemplate sqlSession);

	Object deleteDet(HashMap<String, Integer> map, SqlSessionTemplate sqlSession);

	int onebNo(int bNo, SqlSessionTemplate sqlSession);

	int insertbImg(Attachment a, SqlSessionTemplate sqlSession);

	int lastBimg(int i, SqlSessionTemplate sqlSession);

	int updateBimg(Attachment a, SqlSessionTemplate sqlSession);

	int lastPimg(int i, SqlSessionTemplate sqlSession);

	int insertPimg(Attachment a, SqlSessionTemplate sqlSession);

	int updatePimg(Attachment a, SqlSessionTemplate sqlSession);

	Attachment selectbInfo(int chNo, SqlSessionTemplate sqlSession);

	Attachment selectpInfo(int chNo, SqlSessionTemplate sqlSession);

	int updatecInfo(HashMap<String, Object> map, SqlSessionTemplate sqlSession);

	int totalSub(int chNo, SqlSessionTemplate sqlSession);

	List<Relation> selecttSub(int i, int j, int chNo, SqlSessionTemplate sqlSession);

	int insertBanLan(HashMap<String, Object> map, SqlSessionTemplate sqlSession);

	Member selecttInfo(int chNo, SqlSessionTemplate sqlSession);

	List<Board> getMainVList(int chNo, SqlSessionTemplate sqlSession);

	int vodDelete(int bNo, SqlSessionTemplate sqlSession);

	int updateVod(Board b, SqlSessionTemplate sqlSession);

	int updatevAt(Attachment a, SqlSessionTemplate sqlSession);

	List<Relation> selectManager(int cuNo, SqlSessionTemplate sqlSession);

	int listBCount(int chNo, SqlSessionTemplate sqlSession);

	List<BanWord> listBan(HashMap<Object, Integer> map, SqlSessionTemplate sqlSession);

	int deleteBanW(HashMap<String, Integer> map, SqlSessionTemplate sqlSession);

	

}
