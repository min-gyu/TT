package com.kh.tt.myPage.model.vo;

public class Clover implements java.io.Serializable{
	private int cloverNo;
	private int cloverCnt;
	private int cloverMoney;
	
	public Clover() {}

	public Clover(int cloverNo, int cloverCnt, int cloverMoney) {
		super();
		this.cloverNo = cloverNo;
		this.cloverCnt = cloverCnt;
		this.cloverMoney = cloverMoney;
	}

	public int getCloverNo() {
		return cloverNo;
	}

	public void setCloverNo(int cloverNo) {
		this.cloverNo = cloverNo;
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
		return "clover [cloverNo=" + cloverNo + ", cloverCnt=" + cloverCnt + ", cloverMoney=" + cloverMoney + "]";
	}
	
	
	
}
