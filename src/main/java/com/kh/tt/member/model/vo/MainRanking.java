package com.kh.tt.member.model.vo;

public class MainRanking implements java.io.Serializable {
	private int uNo;
	private String nickName;		// member
	
	private int chNo;				// channel
	
	private int bNo;				// board
	private String bTitle;
	private String bContent;
	private String bWriteDate;
	private int bCount;
	private int bLevel;
	private String bType;
	private String bDelStatus;
	private String bAttachYN;
	
	private String ctName;			// category
	
	private int atNo;				// attachment
	private String atModifyName;	
	
	public MainRanking() {}

	public MainRanking(int uNo, String nickName, int chNo, int bNo, String bTitle, String bContent, String bWriteDate,
			int bCount, int bLevel, String bType, String bDelStatus, String bAttachYN, String ctName, int atNo,
			String atModifyName) {
		super();
		this.uNo = uNo;
		this.nickName = nickName;
		this.chNo = chNo;
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriteDate = bWriteDate;
		this.bCount = bCount;
		this.bLevel = bLevel;
		this.bType = bType;
		this.bDelStatus = bDelStatus;
		this.bAttachYN = bAttachYN;
		this.ctName = ctName;
		this.atNo = atNo;
		this.atModifyName = atModifyName;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
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

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriteDate() {
		return bWriteDate;
	}

	public void setbWriteDate(String bWriteDate) {
		this.bWriteDate = bWriteDate;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public int getbLevel() {
		return bLevel;
	}

	public void setbLevel(int bLevel) {
		this.bLevel = bLevel;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getbDelStatus() {
		return bDelStatus;
	}

	public void setbDelStatus(String bDelStatus) {
		this.bDelStatus = bDelStatus;
	}

	public String getbAttachYN() {
		return bAttachYN;
	}

	public void setbAttachYN(String bAttachYN) {
		this.bAttachYN = bAttachYN;
	}

	public String getCtName() {
		return ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
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

	@Override
	public String toString() {
		return "MainRanking [uNo=" + uNo + ", nickName=" + nickName + ", chNo=" + chNo + ", bNo=" + bNo + ", bTitle="
				+ bTitle + ", bContent=" + bContent + ", bWriteDate=" + bWriteDate + ", bCount=" + bCount + ", bLevel="
				+ bLevel + ", bType=" + bType + ", bDelStatus=" + bDelStatus + ", bAttachYN=" + bAttachYN + ", ctName="
				+ ctName + ", atNo=" + atNo + ", atModifyName=" + atModifyName + "]";
	}

	
	
}
