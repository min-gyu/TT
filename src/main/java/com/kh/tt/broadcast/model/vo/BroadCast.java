package com.kh.tt.broadcast.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BroadCast implements Serializable{
	private int btNo;
	private int btChNo;
	private int btCtNo;
	private String btUrl;
	private String btTitle;
	private int btCount;
	private int btTotalCount;
	private Date btStartTime;
	private Date btEndTimeDate;
	
	public BroadCast() {
		super();
	}

	public BroadCast(int btNo, int btChNo, int btCtNo, String btUrl, String btTitle, int btCount, int btTotalCount,
			Date btStartTime, Date btEndTimeDate) {
		super();
		this.btNo = btNo;
		this.btChNo = btChNo;
		this.btCtNo = btCtNo;
		this.btUrl = btUrl;
		this.btTitle = btTitle;
		this.btCount = btCount;
		this.btTotalCount = btTotalCount;
		this.btStartTime = btStartTime;
		this.btEndTimeDate = btEndTimeDate;
	}

	@Override
	public String toString() {
		return "BroadCast [btNo=" + btNo + ", btChNo=" + btChNo + ", btCtNo=" + btCtNo + ", btUrl=" + btUrl
				+ ", btTitle=" + btTitle + ", btCount=" + btCount + ", btTotalCount=" + btTotalCount + ", btStartTime="
				+ btStartTime + ", btEndTimeDate=" + btEndTimeDate + "]";
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

	public int getBtCtNo() {
		return btCtNo;
	}

	public void setBtCtNo(int btCtNo) {
		this.btCtNo = btCtNo;
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

	public Date getBtStartTime() {
		return btStartTime;
	}

	public void setBtStartTime(Date btStartTime) {
		this.btStartTime = btStartTime;
	}

	public Date getBtEndTimeDate() {
		return btEndTimeDate;
	}

	public void setBtEndTimeDate(Date btEndTimeDate) {
		this.btEndTimeDate = btEndTimeDate;
	}
	
	
}
