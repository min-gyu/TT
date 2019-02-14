package com.kh.tt.member.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Member implements java.io.Serializable{
	private int uno;
	private String userId;
	private String nickName;
	private String userName;
	private String userPwd;
	private String birth;
	private String gender;
	private String email;
	private String enrollDate;
	private String bank;
	private String bankNo;
	private int warningNo;
	private String banStatus;
	private String status;
	private String reason;
	private String leaveDate;
	private String btYN;
	private int totalClover;
	private String adminYN;
	
	public Member() {}

	public Member(int uno, String userId, String nickName, String userName, String userPwd, String birth, String gender,
			String email, String enrollDate, String bank, String bankNo, int warningNo, String banStatus, String status,
			String reason, String leaveDate, String btYN, int totalClover, String adminYN) {
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
		this.bank = bank;
		this.bankNo = bankNo;
		this.warningNo = warningNo;
		this.banStatus = banStatus;
		this.status = status;
		this.reason = reason;
		this.leaveDate = leaveDate;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
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

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankNo() {
		return bankNo;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	public int getWarningNo() {
		return warningNo;
	}

	public void setWarningNo(int warningNo) {
		this.warningNo = warningNo;
	}

	public String getBanStatus() {
		return banStatus;
	}

	public void setBanStatus(String banStatus) {
		this.banStatus = banStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
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
				+ ", enrollDate=" + enrollDate + ", bank=" + bank + ", bankNo=" + bankNo + ", warningNo=" + warningNo
				+ ", banStatus=" + banStatus + ", status=" + status + ", reason=" + reason + ", leaveDate=" + leaveDate
				+ ", btYN=" + btYN + ", totalClover=" + totalClover + ", adminYN=" + adminYN + "]";
	}

	
	
}
