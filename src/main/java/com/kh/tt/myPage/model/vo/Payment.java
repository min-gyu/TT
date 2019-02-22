package com.kh.tt.myPage.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable{
	
	private String pNo; //결제 승인번호
	private int rnum;
	private int pUno;  //회원번호
	private int pCloverCnt; //클로버 번호
	private Date pDate; //날짜

	private int cloverCnt; //클로버 개수
	private int cloverMoney; //결제금액

	
	public Payment() {}

	public Payment(String pNo, int pUno, int pCloverCnt, Date pDate, int cloverCnt, int cloverMoney, int rnum) {
		super();
		this.pNo = pNo;
		this.pUno = pUno;
		this.pCloverCnt = pCloverCnt;
		this.pDate = pDate;
		this.cloverCnt = cloverCnt;
		this.cloverMoney = cloverMoney;
		this.rnum = rnum;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	public int getpUno() {
		return pUno;
	}

	public void setpUno(int pUno) {
		this.pUno = pUno;
	}

	public int getpCloverCnt() {
		return pCloverCnt;
	}

	public void setpCloverCnt(int pCloverCnt) {
		this.pCloverCnt = pCloverCnt;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public int getCloverCnt() {
		return cloverCnt;
	}

	public void setCloverCnt(int cloverCnt) {
		this.cloverCnt = cloverCnt;
	}

	public int getCloverMoney() {
		return cloverMoney;
	}

	public void setCloverMoney(int cloverMoney) {
		this.cloverMoney = cloverMoney;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "Payment [pNo=" + pNo + ", pUno=" + pUno + ", pCloverCnt=" + pCloverCnt + ", pDate=" + pDate
				+ ", cloverCnt=" + cloverCnt + ", cloverMoney=" + cloverMoney + ", rnum=" + rnum + "]";
	}


	

}
