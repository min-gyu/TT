package com.kh.tt.admin.model.vo;

import java.sql.Date;

public class AdClover {
	
	private int rnum;
	private int pUno;
	private String pNo;
	private Date pDate;
	
	private int cloverCnt;
	private int cloverMoney;
	
	public AdClover() {}

	public AdClover(int rnum, int pUno, String pNo, Date pDate, int cloverCnt, int cloverMoney) {
		super();
		this.rnum = rnum;
		this.pUno = pUno;
		this.pNo = pNo;
		this.pDate = pDate;
		this.cloverCnt = cloverCnt;
		this.cloverMoney = cloverMoney;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getpUno() {
		return pUno;
	}

	public void setpUno(int pUno) {
		this.pUno = pUno;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
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

	@Override
	public String toString() {
		return "AdClover [rnum=" + rnum + ", pUno=" + pUno + ", pNo=" + pNo + ", pDate=" + pDate + ", cloverCnt="
				+ cloverCnt + ", cloverMoney=" + cloverMoney + "]";
	}
	
	

}
