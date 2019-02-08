package com.kh.tt.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements java.io.Serializable{
	private int uno;
	private String userId;
	private String nickName;
	private String userName;
	private String userPwd;
	private Date birth;
	private String gender;
	private String email;
	private Date enrollDate;
	private String bankNo;
	private String bank;
	private int warningNo;
	private String status;
	private String banStatus;
	private String reason;
	private String btYN;
	private int totalClover;
	private String adminYN;
	
	public Member() {}

	public Member(int uno, String userId, String nickName, String userName, String userPwd, Date birth, String gender,
			String email, Date enrollDate, String bankNo, String bank, int warningNo, String status, String banStatus,
			String reason, String btYN, int totalClover, String adminYN) {
		super();
		this.uno = uno;
		this.userId = userId;
		this.nickName = nickName;
		this.userName = userName;
		this.userPwd = userPwd;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.enrollDate = enrollDate;
		this.bankNo = bankNo;
		this.bank = bank;
		this.warningNo = warningNo;
		this.status = status;
		this.banStatus = banStatus;
		this.reason = reason;
		this.btYN = btYN;
		this.totalClover = totalClover;
		this.adminYN = adminYN;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getBankNo() {
		return bankNo;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public int getWarningNo() {
		return warningNo;
	}

	public void setWarningNo(int warningNo) {
		this.warningNo = warningNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBanStatus() {
		return banStatus;
	}

	public void setBanStatus(String banStatus) {
		this.banStatus = banStatus;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getBtYN() {
		return btYN;
	}

	public void setBtYN(String btYN) {
		this.btYN = btYN;
	}

	public int getTotalClover() {
		return totalClover;
	}

	public void setTotalClover(int totalClover) {
		this.totalClover = totalClover;
	}

	public String getAdminYN() {
		return adminYN;
	}

	public void setAdminYN(String adminYN) {
		this.adminYN = adminYN;
	}

	@Override
	public String toString() {
		return "Member [uno=" + uno + ", userId=" + userId + ", nickName=" + nickName + ", userName=" + userName
				+ ", userPwd=" + userPwd + ", birth=" + birth + ", gender=" + gender + ", email=" + email
				+ ", enrollDate=" + enrollDate + ", bankNo=" + bankNo + ", bank=" + bank + ", warningNo=" + warningNo
				+ ", status=" + status + ", banStatus=" + banStatus + ", reason=" + reason + ", btYN=" + btYN
				+ ", totalClover=" + totalClover + ", adminYN=" + adminYN + "]";
	}

	
}
