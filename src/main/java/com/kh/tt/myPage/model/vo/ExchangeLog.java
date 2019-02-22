package com.kh.tt.myPage.model.vo;

import java.sql.Date;

public class ExchangeLog implements java.io.Serializable{
	
	private int elNo;
	private int elExNo;
	private Date elDate;
	private String elStatus;
	
	public ExchangeLog() {}

	public ExchangeLog(int elNo, int elExNo, Date elDate, String elStatus) {
		super();
		this.elNo = elNo;
		this.elExNo = elExNo;
		this.elDate = elDate;
		this.elStatus = elStatus;
	}

	public int getElNo() {
		return elNo;
	}

	public void setElNo(int elNo) {
		this.elNo = elNo;
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
		return "ExchangeLog [elNo=" + elNo + ", elExNo=" + elExNo + ", elDate=" + elDate + ", elStatus=" + elStatus
				+ "]";
	}

	

}
