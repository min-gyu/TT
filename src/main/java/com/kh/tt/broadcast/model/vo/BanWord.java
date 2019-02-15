package com.kh.tt.broadcast.model.vo;

import java.sql.Date;
//금지단어 검색시 불러올 VO
public class BanWord {
	private int fNo;
	private int fChNo;
	private String fBan;
	private String fReplace;
	private Date fDate;
	
	public BanWord() {
		super();
	}

	public BanWord(int fNo, int fChNo, String fBan, String fReplace, Date fDate) {
		super();
		this.fNo = fNo;
		this.fChNo = fChNo;
		this.fBan = fBan;
		this.fReplace = fReplace;
		this.fDate = fDate;
	}

	@Override
	public String toString() {
		return "BanWord [fNo=" + fNo + ", fChNo=" + fChNo + ", fBan=" + fBan + ", fReplace=" + fReplace + ", fDate="
				+ fDate + "]";
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public int getfChNo() {
		return fChNo;
	}

	public void setfChNo(int fChNo) {
		this.fChNo = fChNo;
	}

	public String getfBan() {
		return fBan;
	}

	public void setfBan(String fBan) {
		this.fBan = fBan;
	}

	public String getfReplace() {
		return fReplace;
	}

	public void setfReplace(String fReplace) {
		this.fReplace = fReplace;
	}

	public Date getfDate() {
		return fDate;
	}

	public void setfDate(Date fDate) {
		this.fDate = fDate;
	}
	
	
}
