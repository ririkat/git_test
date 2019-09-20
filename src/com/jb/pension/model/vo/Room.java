package com.jb.pension.model.vo;

import java.util.List;

public class Room {
  
	private String rNo;
	private String rName;
	private int rPrice;

	private int rNop;
	private int rMaxNop;
	private int rAddNop;
	private String rSize;
	private String pCode;
	private String rStruc;
	private String rInfo;
	private int rAddPrice;
	
	private RoomFacilities roomFac;
	/* private List<RoomFile> rfList; */
	

	public Room() {
		// TODO Auto-generated constructor stub
	}
	
	public Room(String rNo, String rName, int rPrice, int rNop, int rMaxNop, String rSize, String pCode, String rStruc,
			String rInfo, int rAddPrice) {
		super();
		this.rNo = rNo;
		this.rName = rName;
		this.rPrice = rPrice;
		this.rNop = rNop;
		this.rMaxNop = rMaxNop;
		this.rSize = rSize;
		this.pCode = pCode;
		this.rStruc = rStruc;
		this.rInfo = rInfo;
		this.rAddPrice = rAddPrice;
	}


	public Room(String rNo, String rName, int rPrice, int rNop, int rMaxNop, String rSize, String pCode, String rStruc,
			String rInfo, int rAddPrice, RoomFacilities roomFac) {
		super();
		this.rNo = rNo;
		this.rName = rName;
		this.rPrice = rPrice;
		this.rNop = rNop;
		this.rMaxNop = rMaxNop;
		this.rAddNop = rAddNop;
		this.rSize = rSize;
		this.pCode = pCode;
		this.rStruc = rStruc;
		this.rInfo = rInfo;
		this.rAddPrice = rAddPrice;
		this.roomFac = roomFac;
	}


	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
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

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
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

	public RoomFacilities getRoomFac() {
		return roomFac;
	}

	public void setRoomFac(RoomFacilities roomFac) {
		this.roomFac = roomFac;
	}

	@Override
	public String toString() {
		return "Room [rNo=" + rNo + ", rName=" + rName + ", rPrice=" + rPrice + ", rNop=" + rNop + ", rMaxNop="
				+ rMaxNop + ", rAddNop=" + rAddNop + ", rSize=" + rSize + ", pCode=" + pCode + ", rStruc=" + rStruc
				+ ", rInfo=" + rInfo + ", rAddPrice=" + rAddPrice + ", roomFac=" + roomFac + "]";
	}
	

}