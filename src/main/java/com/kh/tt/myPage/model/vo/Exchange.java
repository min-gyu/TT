package com.kh.tt.myPage.model.vo;

import java.sql.Date;

public class Exchange implements java.io.Serializable{

	private int exNo;
	private int exUno;
	private int exCloverCnt;
	private int rnum;
	
	//Member테이블
	private String mBank;
	private String mBankNo;
	
	//ExchangeLog 테이블
	private Date elDate;
	private String elStatus;
	
	public Exchange() {}

	public Exchange(int exNo, int exUno, int exCloverCnt, int rnum, String mBank, String mBankNo, Date elDate,
			String elStatus) {
		super();
		this.exNo = exNo;
		this.exUno = exUno;
		this.exCloverCnt = exCloverCnt;
		this.rnum = rnum;
		this.mBank = mBank;
		this.mBankNo = mBankNo;
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

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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
		return "Exchange [exNo=" + exNo + ", exUno=" + exUno + ", exCloverCnt=" + exCloverCnt + ", rnum=" + rnum
				+ ", mBank=" + mBank + ", mBankNo=" + mBankNo + ", elDate=" + elDate + ", elStatus=" + elStatus + "]";
	}


	
	

}
