package com.kh.tt.myPage.model.vo;

public class MyBroadCast {
	private int rnum;
	private int btNo;
	private int btChNo;
	private int btCtno;
	private String btUrl;
	private String btTitle;
	private int btCount;
	private int btTotalCount;
	private String btStartDate;
	private String btEndDate;
	
	public MyBroadCast() {}

	public MyBroadCast(int rnum, int btNo, int btChNo, int btCtno, String btUrl, String btTitle, int btCount,
			int btTotalCount, String btStartDate, String btEndDate) {
		super();
		this.rnum = rnum;
		this.btNo = btNo;
		this.btChNo = btChNo;
		this.btCtno = btCtno;
		this.btUrl = btUrl;
		this.btTitle = btTitle;
		this.btCount = btCount;
		this.btTotalCount = btTotalCount;
		this.btStartDate = btStartDate;
		this.btEndDate = btEndDate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getBtNo() {
		return btNo;
	}

	public void setBtNo(int btNo) {
		this.btNo = btNo;
	}

	public int getBtChNo() {
		return btChNo;
	}

	public void setBtChNo(int btChNo) {
		this.btChNo = btChNo;
	}

	public int getBtCtno() {
		return btCtno;
	}

	public void setBtCtno(int btCtno) {
		this.btCtno = btCtno;
	}

	public String getBtUrl() {
		return btUrl;
	}

	public void setBtUrl(String btUrl) {
		this.btUrl = btUrl;
	}

	public String getBtTitle() {
		return btTitle;
	}

	public void setBtTitle(String btTitle) {
		this.btTitle = btTitle;
	}

	public int getBtCount() {
		return btCount;
	}

	public void setBtCount(int btCount) {
		this.btCount = btCount;
	}

	public int getBtTotalCount() {
		return btTotalCount;
	}

	public void setBtTotalCount(int btTotalCount) {
		this.btTotalCount = btTotalCount;
	}

	public String getBtStartDate() {
		return btStartDate;
	}

	public void setBtStartDate(String btStartDate) {
		this.btStartDate = btStartDate;
	}

	public String getBtEndDate() {
		return btEndDate;
	}

	public void setBtEndDate(String btEndDate) {
		this.btEndDate = btEndDate;
	}

	@Override
	public String toString() {
		return "MyBroadCast [rnum=" + rnum + ", btNo=" + btNo + ", btChNo=" + btChNo + ", btCtno=" + btCtno + ", btUrl="
				+ btUrl + ", btTitle=" + btTitle + ", btCount=" + btCount + ", btTotalCount=" + btTotalCount
				+ ", btStartDate=" + btStartDate + ", btEndDate=" + btEndDate + "]";
	}
	
	

}
