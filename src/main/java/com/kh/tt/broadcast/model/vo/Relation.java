package com.kh.tt.broadcast.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Relation implements Serializable{
	private int rNo;
	private int rChNo;
	private int rTargetUno;
	private Date rDate;
	private String rType;
	private String rAlarmYn;
	
	public Relation() {
		super();
	}

	public Relation(int rNo, int rChNo, int rTargetUno, Date rDate, String rType, String rAlarmYn) {
		super();
		this.rNo = rNo;
		this.rChNo = rChNo;
		this.rTargetUno = rTargetUno;
		this.rDate = rDate;
		this.rType = rType;
		this.rAlarmYn = rAlarmYn;
	}

	@Override
	public String toString() {
		return "Relation [rNo=" + rNo + ", rChNo=" + rChNo + ", rTargetUno=" + rTargetUno + ", rDate=" + rDate
				+ ", rType=" + rType + ", rAlarmYn=" + rAlarmYn + "]";
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getrChNo() {
		return rChNo;
	}

	public void setrChNo(int rChNo) {
		this.rChNo = rChNo;
	}

	public int getrTargetUno() {
		return rTargetUno;
	}

	public void setrTargetUno(int rTargetUno) {
		this.rTargetUno = rTargetUno;
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

	public String getrAlarmYn() {
		return rAlarmYn;
	}

	public void setrAlarmYn(String rAlarmYn) {
		this.rAlarmYn = rAlarmYn;
	}
	
	
}
