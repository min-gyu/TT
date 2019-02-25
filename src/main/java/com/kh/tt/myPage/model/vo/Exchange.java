package com.kh.tt.myPage.model.vo;

import java.sql.Date;

public class Exchange implements java.io.Serializable{

	private Integer exNo;
	private int exUno;
	private int exCloverCnt;
	private String exStatus;
	
	private int rnum;
	
	//Member테이블
	private String mId;
	private String mName;
	private String mBank;
	private String mBankNo;
	
	//ExchangeLog 테이블
	private int elExNo;
	private Date elDate;
	private String elStatus;
	
	public Exchange() {}

	public Exchange(int exNo, int exUno, int exCloverCnt, String exStatus, int rnum, String mId, String mName,
			String mBank, String mBankNo, int elExNo, Date elDate, String elStatus) {
		super();
		this.exNo = exNo;
		this.exUno = exUno;
		this.exCloverCnt = exCloverCnt;
		this.exStatus = exStatus;
		this.rnum = rnum;
		this.mId = mId;
		this.mName = mName;
		this.mBank = mBank;
		this.mBankNo = mBankNo;
		this.elExNo = elExNo;
		this.elDate = elDate;
		this.elStatus = elStatus;
	}

	public int getExNo() {
		return exNo;
	}

	public void setExNo(int exNo) {
		this.exNo = exNo;
	}

	public int getExUno() {
		return exUno;
	}

	public void setExUno(int exUno) {
		this.exUno = exUno;
	}

	public int getExCloverCnt() {
		return exCloverCnt;
	}

	public void setExCloverCnt(int exCloverCnt) {
		this.exCloverCnt = exCloverCnt;
	}

	public String getExStatus() {
		return exStatus;
	}

	public void setExStatus(String exStatus) {
		this.exStatus = exStatus;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmBank() {
		return mBank;
	}

	public void setmBank(String mBank) {
		this.mBank = mBank;
	}

	public String getmBankNo() {
		return mBankNo;
	}

	public void setmBankNo(String mBankNo) {
		this.mBankNo = mBankNo;
	}

	public int getElExNo() {
		return elExNo;
	}

	public void setElExNo(int elExNo) {
		this.elExNo = elExNo;
	}

	public Date getElDate() {
		return elDate;
	}

	public void setElDate(Date elDate) {
		this.elDate = elDate;
	}

	public String getElStatus() {
		return elStatus;
	}

	public void setElStatus(String elStatus) {
		this.elStatus = elStatus;
	}

	@Override
	public String toString() {
		return "Exchange [exNo=" + exNo + ", exUno=" + exUno + ", exCloverCnt=" + exCloverCnt + ", exStatus=" + exStatus
				+ ", rnum=" + rnum + ", mId=" + mId + ", mName=" + mName + ", mBank=" + mBank + ", mBankNo=" + mBankNo
				+ ", elExNo=" + elExNo + ", elDate=" + elDate + ", elStatus=" + elStatus + "]";
	}

	
	
}
