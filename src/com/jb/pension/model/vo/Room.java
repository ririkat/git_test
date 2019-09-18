package com.jb.pension.model.vo;

public class Room {
	
	private String rNo;
	private String pCode;
	private String rName;
	private int rPrice;
	private int rNop;
	private int rMaxNop;
	private String rSize,rStruc,rInfo;
	private int rAddPrice;
	
	public Room() {
		// TODO Auto-generated constructor stub
	}

	public Room(String rNo, String pCode, String rName, int rPrice, int rNop, int rMaxNop, String rSize, String rStruc,
			String rInfo, int rAddPrice) {
		super();
		this.rNo = rNo;
		this.pCode = pCode;
		this.rName = rName;
		this.rPrice = rPrice;
		this.rNop = rNop;
		this.rMaxNop = rMaxNop;
		this.rSize = rSize;
		this.rStruc = rStruc;
		this.rInfo = rInfo;
		this.rAddPrice = rAddPrice;
	}

	@Override
	public String toString() {
		return "Room [rNo=" + rNo + ", pCode=" + pCode + ", rName=" + rName + ", rPrice=" + rPrice + ", rNop=" + rNop
				+ ", rMaxNop=" + rMaxNop + ", rSize=" + rSize + ", rStruc=" + rStruc + ", rInfo=" + rInfo
				+ ", rAddPrice=" + rAddPrice + "]";
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public int getrPrice() {
		return rPrice;
	}

	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}

	public int getrNop() {
		return rNop;
	}

	public void setrNop(int rNop) {
		this.rNop = rNop;
	}

	public int getrMaxNop() {
		return rMaxNop;
	}

	public void setrMaxNop(int rMaxNop) {
		this.rMaxNop = rMaxNop;
	}

	public String getrSize() {
		return rSize;
	}

	public void setrSize(String rSize) {
		this.rSize = rSize;
	}

	public String getrStruc() {
		return rStruc;
	}

	public void setrStruc(String rStruc) {
		this.rStruc = rStruc;
	}

	public String getrInfo() {
		return rInfo;
	}

	public void setrInfo(String rInfo) {
		this.rInfo = rInfo;
	}

	public int getrAddPrice() {
		return rAddPrice;
	}

	public void setrAddPrice(int rAddPrice) {
		this.rAddPrice = rAddPrice;
	}
	
	
	
	
	
	
	

}
