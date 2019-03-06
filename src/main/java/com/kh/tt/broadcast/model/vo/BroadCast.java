package com.kh.tt.broadcast.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BroadCast implements Serializable{
	private int btTime;
	private int totalCount;
	private int btCount;
	private String year;
	public BroadCast() {
		super();
	}
	public BroadCast(int btTime, int totalCount, int btCount, String year) {
		super();
		this.btTime = btTime;
		this.totalCount = totalCount;
		this.btCount = btCount;
		this.year = year;
	}
	@Override
	public String toString() {
		return "BroadCast [btTime=" + btTime + ", totalCount=" + totalCount + ", btCount=" + btCount + ", year=" + year
				+ "]";
	}
	public int getBtTime() {
		return btTime;
	}
	public void setBtTime(int btTime) {
		this.btTime = btTime;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getBtCount() {
		return btCount;
	}
	public void setBtCount(int btCount) {
		this.btCount = btCount;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	
}
