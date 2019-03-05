package com.kh.tt.admin.model.vo;

public class CorrectClaim implements java.io.Serializable {
	
	private int cqNo;
	private int cqUno;
	private int cqTargetId;
	private int mUno;
	private int mWarningNo;
	private int mTotalClover;
	
	public CorrectClaim() {}

	public CorrectClaim(int cqNo, int cqUno, int cqTargetId, int mUno, int mWarningNo, int mTotalClover) {
		super();
		this.cqNo = cqNo;
		this.cqUno = cqUno;
		this.cqTargetId = cqTargetId;
		this.mUno = mUno;
		this.mWarningNo = mWarningNo;
		this.mTotalClover = mTotalClover;
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

	public int getmUno() {
		return mUno;
	}

	public void setmUno(int mUno) {
		this.mUno = mUno;
	}

	public int getmWarningNo() {
		return mWarningNo;
	}

	public void setmWarningNo(int mWarningNo) {
		this.mWarningNo = mWarningNo;
	}

	public int getmTotalClover() {
		return mTotalClover;
	}

	public void setmTotalClover(int mTotalClover) {
		this.mTotalClover = mTotalClover;
	}

	@Override
	public String toString() {
		return "CorrectClaim [cqNo=" + cqNo + ", cqUno=" + cqUno + ", cqTargetId=" + cqTargetId + ", mUno=" + mUno
				+ ", mWarningNo=" + mWarningNo + ", mTotalClover=" + mTotalClover + "]";
	}
	
	
}
