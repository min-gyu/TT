package com.kh.tt.channel.model.vo;

import java.sql.Date;

public class BoardClaim {
	private int bcNo; //신고 번호
	private int bcuNo; //신고한 회원번호 
	private int bctargetNo;//타겟 게시물 번호
	private String bcReason;//신고 사유
	private Date bcDate;//신고 날짜 
	
	public BoardClaim() {}

	public int getBcNo() {
		return bcNo;
	}

	public void setBcNo(int bcNo) {
		this.bcNo = bcNo;
	}


	public int getBcuNo() {
		return bcuNo;
	}

	public void setBcuNo(int bcuNo) {
		this.bcuNo = bcuNo;
	}

	public int getBctargetNo() {
		return bctargetNo;
	}

	public void setBctargetNo(int bctargetNo) {
		this.bctargetNo = bctargetNo;
	}

	public String getBcReason() {
		return bcReason;
	}

	public void setBcReason(String bcReason) {
		this.bcReason = bcReason;
	}

	public Date getBcDate() {
		return bcDate;
	}

	public void setBcDate(Date bcDate) {
		this.bcDate = bcDate;
	}

	@Override
	public String toString() {
		return "BoardClaim [bcNo=" + bcNo + ", bcuNo=" + bcuNo + ", bctargetNo=" + bctargetNo
				+ ", bcReason=" + bcReason + ", bcDate=" + bcDate + "]";
	}

	public BoardClaim(int bcNo, int bcuNo, int bctargetNo, String bcReason, Date bcDate) {
		super();
		this.bcNo = bcNo;
		this.bcuNo = bcuNo;
		this.bctargetNo = bctargetNo;
		this.bcReason = bcReason;
		this.bcDate = bcDate;
	}
	
	
}
