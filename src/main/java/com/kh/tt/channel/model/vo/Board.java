package com.kh.tt.channel.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	 private int bNo; //게시물 번호
	 private int buNo; //작성자 번호
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

	 public Board() {}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getBuNo() {
		return buNo;
	}

	public void setBuNo(int buNo) {
		this.buNo = buNo;
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

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", buNo=" + buNo + ", bCate=" + bCate + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", bwDate=" + bwDate + ", bmDate=" + bmDate + ", bCount=" + bCount + ", bLevel=" + bLevel
				+ ", bupNo=" + bupNo + ", bAttachs=" + bAttachs + ", bDels=" + bDels + ", bType=" + bType + "]";
	}

	public Board(int bNo, int buNo, int bCate, String bTitle, String bContent, Date bwDate, Date bmDate, int bCount,
			int bLevel, int bupNo, String bAttachs, String bDels, String bType) {
		super();
		this.bNo = bNo;
		this.buNo = buNo;
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
	}

	
}
