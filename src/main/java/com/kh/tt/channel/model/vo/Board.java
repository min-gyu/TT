package com.kh.tt.channel.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	 private int bNo; //게시물 번호
	 private int bchNo;//채널 번호
	 private int buNo; //작성자 번호
	 private String buId;//작성자 아이디
	 private String bnickName;//작성자 닉네임
	 private int bCate;//카테고리 번호
	 private String bTitle; //제목
	 private String bContent; //내용
	 private Date bwDate;//작성일
	 private Date bmDate;//수정일
	 private int bCount;//조회수
	 private int bLevel;//레벨
	 private int bupNo;//상위 게시물 번호
	 private String bAttachs;//첨부파일여부
	 private String bDels;//삭제상태
	 private String bType;//게시물 구분(VOD , 게시판)
	 
	 private int atCHno;//채널번호(FK)
	 private String atMName;//바꾼이름
		
	private String userId;
	private String nickName;

	 public Board() {}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bchNo=" + bchNo + ", buNo=" + buNo + ", buId=" + buId + ", bnickName="
				+ bnickName + ", bCate=" + bCate + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bwDate="
				+ bwDate + ", bmDate=" + bmDate + ", bCount=" + bCount + ", bLevel=" + bLevel + ", bupNo=" + bupNo
				+ ", bAttachs=" + bAttachs + ", bDels=" + bDels + ", bType=" + bType + ", atCHno=" + atCHno
				+ ", atMName=" + atMName + ", userId=" + userId + ", nickName=" + nickName + "]";
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getBchNo() {
		return bchNo;
	}

	public void setBchNo(int bchNo) {
		this.bchNo = bchNo;
	}

	public int getBuNo() {
		return buNo;
	}

	public void setBuNo(int buNo) {
		this.buNo = buNo;
	}

	public String getBuId() {
		return buId;
	}

	public void setBuId(String buId) {
		this.buId = buId;
	}

	public String getBnickName() {
		return bnickName;
	}

	public void setBnickName(String bnickName) {
		this.bnickName = bnickName;
	}

	public int getbCate() {
		return bCate;
	}

	public void setbCate(int bCate) {
		this.bCate = bCate;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getBwDate() {
		return bwDate;
	}

	public void setBwDate(Date bwDate) {
		this.bwDate = bwDate;
	}

	public Date getBmDate() {
		return bmDate;
	}

	public void setBmDate(Date bmDate) {
		this.bmDate = bmDate;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public int getbLevel() {
		return bLevel;
	}

	public void setbLevel(int bLevel) {
		this.bLevel = bLevel;
	}

	public int getBupNo() {
		return bupNo;
	}

	public void setBupNo(int bupNo) {
		this.bupNo = bupNo;
	}

	public String getbAttachs() {
		return bAttachs;
	}

	public void setbAttachs(String bAttachs) {
		this.bAttachs = bAttachs;
	}

	public String getbDels() {
		return bDels;
	}

	public void setbDels(String bDels) {
		this.bDels = bDels;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public int getAtCHno() {
		return atCHno;
	}

	public void setAtCHno(int atCHno) {
		this.atCHno = atCHno;
	}

	public String getAtMName() {
		return atMName;
	}

	public void setAtMName(String atMName) {
		this.atMName = atMName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Board(int bNo, int bchNo, int buNo, String buId, String bnickName, int bCate, String bTitle, String bContent,
			Date bwDate, Date bmDate, int bCount, int bLevel, int bupNo, String bAttachs, String bDels, String bType,
			int atCHno, String atMName, String userId, String nickName) {
		super();
		this.bNo = bNo;
		this.bchNo = bchNo;
		this.buNo = buNo;
		this.buId = buId;
		this.bnickName = bnickName;
		this.bCate = bCate;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bwDate = bwDate;
		this.bmDate = bmDate;
		this.bCount = bCount;
		this.bLevel = bLevel;
		this.bupNo = bupNo;
		this.bAttachs = bAttachs;
		this.bDels = bDels;
		this.bType = bType;
		this.atCHno = atCHno;
		this.atMName = atMName;
		this.userId = userId;
		this.nickName = nickName;
	}

	
	
}
