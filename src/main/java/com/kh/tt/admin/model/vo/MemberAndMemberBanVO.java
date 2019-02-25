package com.kh.tt.admin.model.vo;

public class MemberAndMemberBanVO implements java.io.Serializable {

	private int rownum;
	private int uno;
	private String userId;
	private String nickName;
	private String userName;
	private String gender;
	private String bank;
	private int warningNo;
	private String banStatus;
	private String status;
	private String leaveReason;
	private String leaveDate;
	private String adminYN;
	private String enrollDate;
	private String loginType;
	
	private String banReason;
	private String startDate;
	private String endDate;
	
	public MemberAndMemberBanVO() {}

	public MemberAndMemberBanVO(int rownum, int uno, String userId, String nickName, String userName, String gender,
			String bank, int warningNo, String banStatus, String status, String leaveReason, String leaveDate,
			String adminYN, String enrollDate, String loginType, String banReason, String startDate, String endDate) {
		super();
		this.rownum = rownum;
		this.uno = uno;
		this.userId = userId;
		this.nickName = nickName;
		this.userName = userName;
		this.gender = gender;
		this.bank = bank;
		this.warningNo = warningNo;
		this.banStatus = banStatus;
		this.status = status;
		this.leaveReason = leaveReason;
		this.leaveDate = leaveDate;
		this.adminYN = adminYN;
		this.enrollDate = enrollDate;
		this.loginType = loginType;
		this.banReason = banReason;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public String getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getAdminYN() {
		return adminYN;
	}

	public void setAdminYN(String adminYN) {
		this.adminYN = adminYN;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getBanReason() {
		return banReason;
	}

	public void setBanReason(String banReason) {
		this.banReason = banReason;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "MemberAndMemberBanVO [rownum=" + rownum + ", uno=" + uno + ", userId=" + userId + ", nickName="
				+ nickName + ", userName=" + userName + ", gender=" + gender + ", bank=" + bank + ", warningNo="
				+ warningNo + ", banStatus=" + banStatus + ", status=" + status + ", leaveReason=" + leaveReason
				+ ", leaveDate=" + leaveDate + ", adminYN=" + adminYN + ", enrollDate=" + enrollDate + ", loginType="
				+ loginType + ", banReason=" + banReason + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

	
	
}
