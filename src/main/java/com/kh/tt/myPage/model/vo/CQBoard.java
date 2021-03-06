package com.kh.tt.myPage.model.vo;

import java.sql.Date;

public class CQBoard implements java.io.Serializable{
	
	private int rnum;
	private int cqNo; //게시글번호
	private int cqUno; //작성회원번호
	private int cqTargetId; //신고당한 회원번호
	private String cqClass;  //유형
	private String cqTitle;  //제목
	private String cqContent;  //내용
	private Date cqDate;  //작성일
	private int cqLevel;  //레벨
	private int cqUpperNo;  //상위게시물번호
	private String cqAttachYn;  //첨부파일여부
	private String cqDelStatus;  //삭제상태
	private String cqType;  //사용타입
	
	public CQBoard() {}

	public CQBoard(int rnum, int cqNo, int cqUno, int cqTargetId, String cqClass, String cqTitle, String cqContent,
			Date cqDate, int cqLevel, int cqUpperNo, String cqAttachYn, String cqDelStatus, String cqType) {
		super();
		this.rnum = rnum;
		this.cqNo = cqNo;
		this.cqUno = cqUno;
		this.cqTargetId = cqTargetId;
		this.cqClass = cqClass;
		this.cqTitle = cqTitle;
		this.cqContent = cqContent;
		this.cqDate = cqDate;
		this.cqLevel = cqLevel;
		this.cqUpperNo = cqUpperNo;
		this.cqAttachYn = cqAttachYn;
		this.cqDelStatus = cqDelStatus;
		this.cqType = cqType;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getCqNo() {
		return cqNo;
	}

	public void setCqNo(int cqNo) {
		this.cqNo = cqNo;
	}

	public int getCqUno() {
		return cqUno;
	}

	public void setCqUno(int cqUno) {
		this.cqUno = cqUno;
	}

	public int getCqTargetId() {
		return cqTargetId;
	}

	public void setCqTargetId(int cqTargetId) {
		this.cqTargetId = cqTargetId;
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

	public Date getCqDate() {
		return cqDate;
	}

	public void setCqDate(Date cqDate) {
		this.cqDate = cqDate;
	}

	public int getCqLevel() {
		return cqLevel;
	}

	public void setCqLevel(int cqLevel) {
		this.cqLevel = cqLevel;
	}

	public int getCqUpperNo() {
		return cqUpperNo;
	}

	public void setCqUpperNo(int cqUpperNo) {
		this.cqUpperNo = cqUpperNo;
	}

	public String getCqAttachYn() {
		return cqAttachYn;
	}

	public void setCqAttachYn(String cqAttachYn) {
		this.cqAttachYn = cqAttachYn;
	}

	public String getCqDelStatus() {
		return cqDelStatus;
	}

	public void setCqDelStatus(String cqDelStatus) {
		this.cqDelStatus = cqDelStatus;
	}

	public String getCqType() {
		return cqType;
	}

	public void setCqType(String cqType) {
		this.cqType = cqType;
	}

	@Override
	public String toString() {
		return "CQBoard [rnum=" + rnum + ", cqNo=" + cqNo + ", cqUno=" + cqUno + ", cqTargetId=" + cqTargetId
				+ ", cqClass=" + cqClass + ", cqTitle=" + cqTitle + ", cqContent=" + cqContent + ", cqDate=" + cqDate
				+ ", cqLevel=" + cqLevel + ", cqUpperNo=" + cqUpperNo + ", cqAttachYn=" + cqAttachYn + ", cqDelStatus="
				+ cqDelStatus + ", cqType=" + cqType + "]";
	}

	
	

}
