package com.jb.pension.model.vo;

public class Room {
	
	private String rNo;
	private String pCode;
	private String rName;
	private int rPrice;
	private int rNop;
	
	public Room() {
		// TODO Auto-generated constructor stub
	}

	public Room(String rNo, String pCode, String rName, int rPrice, int rNop) {
		super();
		this.rNo = rNo;
		this.pCode = pCode;
		this.rName = rName;
		this.rPrice = rPrice;
		this.rNop = rNop;
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

	@Override
	public String toString() {
		return "Room [rNo=" + rNo + ", pCode=" + pCode + ", rName=" + rName + ", rPrice=" + rPrice + ", rNop=" + rNop
				+ "]";
	}
	

}
