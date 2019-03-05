package com.kh.tt.admin.model.vo;

import java.sql.Date;

public class VodLog {
	private int vlNo; //시퀀스 번호
	private int vlDelNo;//삭제된 게시물 번호
	private Date vlDate;// 삭제된 날짜
	
	private String bTitle; //제목
	private String bContent; //내용
	
	private String userId;//작성자 이름
	private String nickName;//작성자 닉네임
	
	public VodLog() {}

	public int getVlNo() {
		return vlNo;
	}

	public void setVlNo(int vlNo) {
		this.vlNo = vlNo;
	}

	public int getVlDelNo() {
		return vlDelNo;
	}

	public void setVlDelNo(int vlDelNo) {
		this.vlDelNo = vlDelNo;
	}

	public Date getVlDate() {
		return vlDate;
	}

	public void setVlDate(Date vlDate) {
		this.vlDate = vlDate;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "VodLog [vlNo=" + vlNo + ", vlDelNo=" + vlDelNo + ", vlDate=" + vlDate + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", userId=" + userId + ", nickName=" + nickName + "]";
	}

	public VodLog(int vlNo, int vlDelNo, Date vlDate, String bTitle, String bContent, String userId, String nickName) {
		super();
		this.vlNo = vlNo;
		this.vlDelNo = vlDelNo;
		this.vlDate = vlDate;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.userId = userId;
		this.nickName = nickName;
	}

	
}