package com.kh.tt.admin.model.vo;

public class Category implements java.io.Serializable {
	private int ctNo;
	private int upperNo;
	private String ctName;
	
	public Category() {}

	public Category(int ctNo, int upperNo, String ctName) {
		super();
		this.ctNo = ctNo;
		this.upperNo = upperNo;
		this.ctName = ctName;
	}

	public int getCtNo() {
		return ctNo;
	}

	public void setCtNo(int ctNo) {
		this.ctNo = ctNo;
	}

	public int getUpperNo() {
		return upperNo;
	}

	public void setUpperNo(int upperNo) {
		this.upperNo = upperNo;
	}

	public String getCtName() {
		return ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
	}

	@Override
	public String toString() {
		return "Category [ctNo=" + ctNo + ", upperNo=" + upperNo + ", ctName=" + ctName + "]";
	}
	
	
}