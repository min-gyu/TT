package com.kh.tt.subscribe.model.vo;

public class Subscribe implements java.io.Serializable {
	private int rNO;
	private int rChNO;
	private int rTargetUno;
	private String rDate;
	private String rType;
	private String rAlarmYN;
	
	// member table
	//private int uno;
	private String mId;
	private String nickName;
	
	// channel table
	private int chNo;
	
	// attachment table
	private int atNo;

	public Subscribe() {}

	public Subscribe(int rNO, int rChNO, int rTargetUno, String rDate, String rType, String rAlarmYN, String mId,
			String nickName, int chNo, int atNo) {
		super();
		this.rNO = rNO;
		this.rChNO = rChNO;
		this.rTargetUno = rTargetUno;
		this.rDate = rDate;
		this.rType = rType;
		this.rAlarmYN = rAlarmYN;
		this.mId = mId;
		this.nickName = nickName;
		this.chNo = chNo;
		this.atNo = atNo;
	}

	public int getrNO() {
		return rNO;
	}

	public void setrNO(int rNO) {
		this.rNO = rNO;
	}

	public int getrChNO() {
		return rChNO;
	}

	public void setrChNO(int rChNO) {
		this.rChNO = rChNO;
	}

	public int getrTargetUno() {
		return rTargetUno;
	}

	public void setrTargetUno(int rTargetUno) {
		this.rTargetUno = rTargetUno;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
	}

	public String getrAlarmYN() {
		return rAlarmYN;
	}

	public void setrAlarmYN(String rAlarmYN) {
		this.rAlarmYN = rAlarmYN;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	@Override
	public String toString() {
		return "Subscribe [rNO=" + rNO + ", rChNO=" + rChNO + ", rTargetUno=" + rTargetUno + ", rDate=" + rDate
				+ ", rType=" + rType + ", rAlarmYN=" + rAlarmYN + ", mId=" + mId + ", nickName=" + nickName + ", chNo="
				+ chNo + ", atNo=" + atNo + "]";
	}
	
}
