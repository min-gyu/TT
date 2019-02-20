package com.kh.tt.channel.model.vo;

import java.sql.Date;

public class Relation {
	private int rNo; //관계번호
	private int rchNo; //채널번호
	private int rtargetuNo; //타겟회원번호
	private Date rDate; //날짜
	private String rType; //구분 "SUBSCRIBE"
	private String rAlarm; //알람수신여부

	public Relation() {}

	public Relation(int rNo, int rchNo, int rtargetuNo, Date rDate, String rType, String rAlarm) {
		super();
		this.rNo = rNo;
		this.rchNo = rchNo;
		this.rtargetuNo = rtargetuNo;
		this.rDate = rDate;
		this.rType = rType;
		this.rAlarm = rAlarm;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getRchNo() {
		return rchNo;
	}

	public void setRchNo(int rchNo) {
		this.rchNo = rchNo;
	}

	public int getRtargetuNo() {
		return rtargetuNo;
	}

	public void setRtargetuNo(int rtargetuNo) {
		this.rtargetuNo = rtargetuNo;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
	}

	public String getrAlarm() {
		return rAlarm;
	}

	public void setrAlarm(String rAlarm) {
		this.rAlarm = rAlarm;
	}

	@Override
	public String toString() {
		return "Relation [rNo=" + rNo + ", rchNo=" + rchNo + ", rtargetuNo=" + rtargetuNo + ", rDate=" + rDate
				+ ", rType=" + rType + ", rAlarm=" + rAlarm + "]";
	}
	
	
}
