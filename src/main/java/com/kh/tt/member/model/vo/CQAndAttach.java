package com.kh.tt.member.model.vo;

public class CQAndAttach implements java.io.Serializable {
	private int rownum;
	private int cqNo;
	private int uno;
	private int targetNo;
	private String userId;
	private String targetId;
	private int btNo;
	private String cqClass;
	private String cqTitle;
	private String cqContent;
	private String cqDate;
	private int level;
	private int upperNo;
	private String attachYN;
	private String delStatus;
	private String cqType;
	
	private int atNo;
	private int atCqNO;
	private int atBNo;
	private int atChNo;
	private String atName;
	private String modifyName;
	private String path;
	private String atDate;
	private String atClass;
	private String atType;
	
	public CQAndAttach() {}

	public CQAndAttach(int rownum, int cqNo, int uno, int targetNo, String userId, String targetId, int btNo,
			String cqClass, String cqTitle, String cqContent, String cqDate, int level, int upperNo, String attachYN,
			String delStatus, String cqType, int atNo, int atCqNO, int atBNo, int atChNo, String atName,
			String modifyName, String path, String atDate, String atClass, String atType) {
		super();
		this.rownum = rownum;
		this.cqNo = cqNo;
		this.uno = uno;
		this.targetNo = targetNo;
		this.userId = userId;
		this.targetId = targetId;
		this.btNo = btNo;
		this.cqClass = cqClass;
		this.cqTitle = cqTitle;
		this.cqContent = cqContent;
		this.cqDate = cqDate;
		this.level = level;
		this.upperNo = upperNo;
		this.attachYN = attachYN;
		this.delStatus = delStatus;
		this.cqType = cqType;
		this.atNo = atNo;
		this.atCqNO = atCqNO;
		this.atBNo = atBNo;
		this.atChNo = atChNo;
		this.atName = atName;
		this.modifyName = modifyName;
		this.path = path;
		this.atDate = atDate;
		this.atClass = atClass;
		this.atType = atType;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getCqNo() {
		return cqNo;
	}

	public void setCqNo(int cqNo) {
		this.cqNo = cqNo;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTargetId() {
		return targetId;
	}

	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}

	public int getBtNo() {
		return btNo;
	}

	public void setBtNo(int btNo) {
		this.btNo = btNo;
	}

	public String getCqClass() {
		return cqClass;
	}

	public void setCqClass(String cqClass) {
		this.cqClass = cqClass;
	}

	public String getCqTitle() {
		return cqTitle;
	}

	public void setCqTitle(String cqTitle) {
		this.cqTitle = cqTitle;
	}

	public String getCqContent() {
		return cqContent;
	}

	public void setCqContent(String cqContent) {
		this.cqContent = cqContent;
	}

	public String getCqDate() {
		return cqDate;
	}

	public void setCqDate(String cqDate) {
		this.cqDate = cqDate;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getUpperNo() {
		return upperNo;
	}

	public void setUpperNo(int upperNo) {
		this.upperNo = upperNo;
	}

	public String getAttachYN() {
		return attachYN;
	}

	public void setAttachYN(String attachYN) {
		this.attachYN = attachYN;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}

	public String getCqType() {
		return cqType;
	}

	public void setCqType(String cqType) {
		this.cqType = cqType;
	}

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public int getAtCqNO() {
		return atCqNO;
	}

	public void setAtCqNO(int atCqNO) {
		this.atCqNO = atCqNO;
	}

	public int getAtBNo() {
		return atBNo;
	}

	public void setAtBNo(int atBNo) {
		this.atBNo = atBNo;
	}

	public int getAtChNo() {
		return atChNo;
	}

	public void setAtChNo(int atChNo) {
		this.atChNo = atChNo;
	}

	public String getAtName() {
		return atName;
	}

	public void setAtName(String atName) {
		this.atName = atName;
	}

	public String getModifyName() {
		return modifyName;
	}

	public void setModifyName(String modifyName) {
		this.modifyName = modifyName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getAtDate() {
		return atDate;
	}

	public void setAtDate(String atDate) {
		this.atDate = atDate;
	}

	public String getAtClass() {
		return atClass;
	}

	public void setAtClass(String atClass) {
		this.atClass = atClass;
	}

	public String getAtType() {
		return atType;
	}

	public void setAtType(String atType) {
		this.atType = atType;
	}

	@Override
	public String toString() {
		return "CQAndAttach [rownum=" + rownum + ", cqNo=" + cqNo + ", uno=" + uno + ", targetNo=" + targetNo
				+ ", userId=" + userId + ", targetId=" + targetId + ", btNo=" + btNo + ", cqClass=" + cqClass
				+ ", cqTitle=" + cqTitle + ", cqContent=" + cqContent + ", cqDate=" + cqDate + ", level=" + level
				+ ", upperNo=" + upperNo + ", attachYN=" + attachYN + ", delStatus=" + delStatus + ", cqType=" + cqType
				+ ", atNo=" + atNo + ", atCqNO=" + atCqNO + ", atBNo=" + atBNo + ", atChNo=" + atChNo + ", atName="
				+ atName + ", modifyName=" + modifyName + ", path=" + path + ", atDate=" + atDate + ", atClass="
				+ atClass + ", atType=" + atType + "]";
	}




}