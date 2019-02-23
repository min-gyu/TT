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
	private String btYN;
	
	// channel table
	private int chNo;
	
	// attachment table
	private int atNo;
	private String atModifyName;
	private String atType;
	
	// board table
	private int bNo;
	private String bTitle;
	private String bWriteDate;
	
	// broadcast table
	private int btNo;
	private String btTitle;
	private String btStartTime;
	

	public Subscribe() {}


	public Subscribe(int rNO, int rChNO, int rTargetUno, String rDate, String rType, String rAlarmYN, String mId,
			String nickName, String btYN, int chNo, int atNo, String atModifyName, String atType, int bNo,
			String bTitle, String bWriteDate, int btNo, String btTitle, String btStartTime) {
		super();
		this.rNO = rNO;
		this.rChNO = rChNO;
		this.rTargetUno = rTargetUno;
		this.rDate = rDate;
		this.rType = rType;
		this.rAlarmYN = rAlarmYN;
		this.mId = mId;
		this.nickName = nickName;
		this.btYN = btYN;
		this.chNo = chNo;
		this.atNo = atNo;
		this.atModifyName = atModifyName;
		this.atType = atType;
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bWriteDate = bWriteDate;
		this.btNo = btNo;
		this.btTitle = btTitle;
		this.btStartTime = btStartTime;
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


	public String getBtYN() {
		return btYN;
	}


	public void setBtYN(String btYN) {
		this.btYN = btYN;
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


	public String getAtModifyName() {
		return atModifyName;
	}


	public void setAtModifyName(String atModifyName) {
		this.atModifyName = atModifyName;
	}


	public String getAtType() {
		return atType;
	}


	public void setAtType(String atType) {
		this.atType = atType;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public String getbTitle() {
		return bTitle;
	}


	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}


	public String getbWriteDate() {
		return bWriteDate;
	}


	public void setbWriteDate(String bWriteDate) {
		this.bWriteDate = bWriteDate;
	}


	public int getBtNo() {
		return btNo;
	}


	public void setBtNo(int btNo) {
		this.btNo = btNo;
	}


	public String getBtTitle() {
		return btTitle;
	}


	public void setBtTitle(String btTitle) {
		this.btTitle = btTitle;
	}


	public String getBtStartTime() {
		return btStartTime;
	}


	public void setBtStartTime(String btStartTime) {
		this.btStartTime = btStartTime;
	}


	@Override
	public String toString() {
		return "Subscribe [rNO=" + rNO + ", rChNO=" + rChNO + ", rTargetUno=" + rTargetUno + ", rDate=" + rDate
				+ ", rType=" + rType + ", rAlarmYN=" + rAlarmYN + ", mId=" + mId + ", nickName=" + nickName + ", btYN="
				+ btYN + ", chNo=" + chNo + ", atNo=" + atNo + ", atModifyName=" + atModifyName + ", atType=" + atType
				+ ", bNo=" + bNo + ", bTitle=" + bTitle + ", bWriteDate=" + bWriteDate + ", btNo=" + btNo + ", btTitle="
				+ btTitle + ", btStartTime=" + btStartTime + "]";
	}

	
	
}
