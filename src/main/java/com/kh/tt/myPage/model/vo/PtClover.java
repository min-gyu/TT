package com.kh.tt.myPage.model.vo;

import java.sql.Date;

public class PtClover implements java.io.Serializable{
	private int rnum;
	private int pcNo; 
	private int pcUno; 
	private int pcTargetUno;
	private int pcCnt;
	private Date pcDate;
	
	public PtClover() {}

	public PtClover(int rnum, int pcNo, int pcUno, int pcTargetUno, int pcCnt, Date pcDate) {
		super();
		this.rnum = rnum;
		this.pcNo = pcNo;
		this.pcUno = pcUno;
		this.pcTargetUno = pcTargetUno;
		this.pcCnt = pcCnt;
		this.pcDate = pcDate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getPcNo() {
		return pcNo;
	}

	public void setPcNo(int pcNo) {
		this.pcNo = pcNo;
	}

	public int getPcUno() {
		return pcUno;
	}

	public void setPcUno(int pcUno) {
		this.pcUno = pcUno;
	}

	public int getPcTargetUno() {
		return pcTargetUno;
	}

	public void setPcTargetUno(int pcTargetUno) {
		this.pcTargetUno = pcTargetUno;
	}

	public int getPcCnt() {
		return pcCnt;
	}

	public void setPcCnt(int pcCnt) {
		this.pcCnt = pcCnt;
	}

	public Date getPcDate() {
		return pcDate;
	}

	public void setPcDate(Date pcDate) {
		this.pcDate = pcDate;
	}

	@Override
	public String toString() {
		return "PtClover [rnum=" + rnum + ", pcNo=" + pcNo + ", pcUno=" + pcUno + ", pcTargetUno=" + pcTargetUno
				+ ", pcCnt=" + pcCnt + ", pcDate=" + pcDate + "]";
	}

	

}
