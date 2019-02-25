package com.kh.tt.category.model.vo;

public class CategoryVod implements java.io.Serializable{
	// channel
	private int chNo;
	
	// member
	private int uNo;
	private String nickName;
	
	// attachment
	private int atNo;
	private String atModifyName;
	
	// category
	private int ctNo;
	private int ctUpperNo;
	private String ctName;
	
	// board
	private int bNo;
	private String bTitle;
	private String bWriteDate;
	private int bCount;
	private int bLevel;
	private String bAttachYN;
	private String bDelStatus;
	private String bType;
	
	public CategoryVod() {}

	public CategoryVod(int chNo, int uNo, String nickName, int atNo, String atModifyName, int ctNo, int ctUpperNo,
			String ctName, int bNo, String bTitle, String bWriteDate, int bCount, int bLevel, String bAttachYN,
			String bDelStatus, String bType) {
		super();
		this.chNo = chNo;
		this.uNo = uNo;
		this.nickName = nickName;
		this.atNo = atNo;
		this.atModifyName = atModifyName;
		this.ctNo = ctNo;
		this.ctUpperNo = ctUpperNo;
		this.ctName = ctName;
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bWriteDate = bWriteDate;
		this.bCount = bCount;
		this.bLevel = bLevel;
		this.bAttachYN = bAttachYN;
		this.bDelStatus = bDelStatus;
		this.bType = bType;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
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

	public int getCtNo() {
		return ctNo;
	}

	public void setCtNo(int ctNo) {
		this.ctNo = ctNo;
	}

	public int getCtUpperNo() {
		return ctUpperNo;
	}

	public void setCtUpperNo(int ctUpperNo) {
		this.ctUpperNo = ctUpperNo;
	}

	public String getCtName() {
		return ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
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

	public String getbAttachYN() {
		return bAttachYN;
	}

	public void setbAttachYN(String bAttachYN) {
		this.bAttachYN = bAttachYN;
	}

	public String getbDelStatus() {
		return bDelStatus;
	}

	public void setbDelStatus(String bDelStatus) {
		this.bDelStatus = bDelStatus;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	@Override
	public String toString() {
		return "CategoryVod [chNo=" + chNo + ", uNo=" + uNo + ", nickName=" + nickName + ", atNo=" + atNo
				+ ", atModifyName=" + atModifyName + ", ctNo=" + ctNo + ", ctUpperNo=" + ctUpperNo + ", ctName="
				+ ctName + ", bNo=" + bNo + ", bTitle=" + bTitle + ", bWriteDate=" + bWriteDate + ", bCount=" + bCount
				+ ", bLevel=" + bLevel + ", bAttachYN=" + bAttachYN + ", bDelStatus=" + bDelStatus + ", bType=" + bType
				+ "]";
	}

	
}
