package com.kh.tt.channel.model.vo;


import java.sql.Date;

public class cPtClover implements java.io.Serializable{
	private int rnum;
	private int pcNo; 
	private int pcUno; 
	private int pcTargetUno;
	private int pcCnt;
	private Date pcDate;
	private String mNickName;
	private int mUno;
	
	
	public cPtClover() {}


	public cPtClover(int rnum, int pcNo, int pcUno, int pcTargetUno, int pcCnt, Date pcDate, String mNickName,
			int mUno) {
		super();
		this.rnum = rnum;
		this.pcNo = pcNo;
		this.pcUno = pcUno;
		this.pcTargetUno = pcTargetUno;
		this.pcCnt = pcCnt;
		this.pcDate = pcDate;
		this.mNickName = mNickName;
		this.mUno = mUno;
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


	public String getmNickName() {
		return mNickName;
	}


	public void setmNickName(String mNickName) {
		this.mNickName = mNickName;
	}


	public int getmUno() {
		return mUno;
	}


	public void setmUno(int mUno) {
		this.mUno = mUno;
	}


	@Override
	public String toString() {
		return "PtClover [rnum=" + rnum + ", pcNo=" + pcNo + ", pcUno=" + pcUno + ", pcTargetUno=" + pcTargetUno
				+ ", pcCnt=" + pcCnt + ", pcDate=" + pcDate + ", mNickName=" + mNickName + ", mUno=" + mUno + "]";
	}

	

}
