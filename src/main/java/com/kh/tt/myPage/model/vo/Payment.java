package com.kh.tt.myPage.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable{
	
	private String pNo; //결제 승인번호
	private int pUno;  //회원번호
	private int pCloverCnt; //클로버 번호
	private Date pDate; //날짜
	
	public Payment() {}

	public Payment(String pNo, int pUno, int pCloverCnt, Date pDate) {
		super();
		this.pNo = pNo;
		this.pUno = pUno;
		this.pCloverCnt = pCloverCnt;
		this.pDate = pDate;
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

	@Override
	public String toString() {
		return "Payment [pNo=" + pNo + ", pUno=" + pUno + ", pCloverCnt=" + pCloverCnt + ", pDate=" + pDate + "]";
	}
	
	
	

}
