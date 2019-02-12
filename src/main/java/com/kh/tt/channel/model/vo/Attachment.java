package com.kh.tt.channel.model.vo;

import java.sql.Date;

public class Attachment implements java.io.Serializable{
	private int atNo; //파일번호
	private int atBno;//게시물번호(FK)
	private int atCQno;//신고게시글번호(FK)
	private int atCHno;//채널번호(FK)
	private String atName;//원본이름
	private String atMName;//바꾼이름
	private String atPath;//파일경로
	private Date atDate;//업로드날짜
	private String atClass;//사용구분(게시글,신고,채널)
	private String atType;//사용타입(신고,문의,배경,프로필,VOD,게시글)
	
	
	public Attachment() {}


	public int getAtNo() {
		return atNo;
	}


	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}


	public int getAtBno() {
		return atBno;
	}


	public void setAtBno(int atBno) {
		this.atBno = atBno;
	}


	public int getAtCQno() {
		return atCQno;
	}


	public void setAtCQno(int atCQno) {
		this.atCQno = atCQno;
	}


	public int getAtCHno() {
		return atCHno;
	}


	public void setAtCHno(int atCHno) {
		this.atCHno = atCHno;
	}


	public String getAtName() {
		return atName;
	}


	public void setAtName(String atName) {
		this.atName = atName;
	}


	public String getAtMName() {
		return atMName;
	}


	public void setAtMName(String atMName) {
		this.atMName = atMName;
	}


	public String getAtPath() {
		return atPath;
	}


	public void setAtPath(String atPath) {
		this.atPath = atPath;
	}


	public Date getAtDate() {
		return atDate;
	}


	public void setAtDate(Date atDate) {
		this.atDate = atDate;
	}


	public String getAtClass() {
		return atClass;
	}


	public void setAtClass(String atClass) {
		this.atClass = atClass;
	}


	public String getAtType() {
		return atType;
	}


	public void setAtType(String atType) {
		this.atType = atType;
	}


	public Attachment(int atNo, int atBno, int atCQno, int atCHno, String atName, String atMName, String atPath,
			Date atDate, String atClass, String atType) {
		super();
		this.atNo = atNo;
		this.atBno = atBno;
		this.atCQno = atCQno;
		this.atCHno = atCHno;
		this.atName = atName;
		this.atMName = atMName;
		this.atPath = atPath;
		this.atDate = atDate;
		this.atClass = atClass;
		this.atType = atType;
	}


	@Override
	public String toString() {
		return "Attachment [atNo=" + atNo + ", atBno=" + atBno + ", atCQno=" + atCQno + ", atCHno=" + atCHno
				+ ", atName=" + atName + ", atMName=" + atMName + ", atPath=" + atPath + ", atDate=" + atDate
				+ ", atClass=" + atClass + ", atType=" + atType + "]";
	}
	
	
}
