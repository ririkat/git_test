package com.jb.pension.model.vo;

import java.sql.Date;
import java.util.List;

public class Pension {
	//펜션테이블 정보
	private String pCode;
	private String pName;
	private String pAddr;
	private String pTel;
	private String oId;
	private String enrollYn;
	private int pBlcount;
	private Date pEnrollDate;
	//1:1 펜션 구비시설 객체 PensionFacilities('Y','N','Y,......)[]
	private PensionFacilities penFac;
	//1:n 펜션파일 리스트(여러개를 리스트로)[[],[],[]...]
	private List<PensionFile> penFile;
	//1:n 방 리스트 [[],[],[],...]
	private List<Room> roomList;
	
	public Pension() {
		// TODO Auto-generated constructor stub
	}
	

	public Pension(String pCode, String pName, String pAddr, String pTel, String oId, String enrollYn, int pBlcount,
			Date pEnrollDate) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pAddr = pAddr;
		this.pTel = pTel;
		this.oId = oId;
		this.enrollYn = enrollYn;
		this.pBlcount = pBlcount;
		this.pEnrollDate = pEnrollDate;
	}


	public Pension(String pCode, String pName, String pAddr, String pTel, String oId, String enrollYn, int pBlcount,
			Date pEnrollDate, PensionFacilities penFac, List<PensionFile> penFile, List<Room> roomList) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pAddr = pAddr;
		this.pTel = pTel;
		this.oId = oId;
		this.enrollYn = enrollYn;
		this.pBlcount = pBlcount;
		this.pEnrollDate = pEnrollDate;
		this.penFac = penFac;
		this.penFile = penFile;
		this.roomList = roomList;
	}


	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getpAddr() {
		return pAddr;
	}


	public void setpAddr(String pAddr) {
		this.pAddr = pAddr;
	}


	public String getpTel() {
		return pTel;
	}


	public void setpTel(String pTel) {
		this.pTel = pTel;
	}


	public String getoId() {
		return oId;
	}


	public void setoId(String oId) {
		this.oId = oId;
	}


	public String getEnrollYn() {
		return enrollYn;
	}


	public void setEnrollYn(String enrollYn) {
		this.enrollYn = enrollYn;
	}


	public int getpBlcount() {
		return pBlcount;
	}


	public void setpBlcount(int pBlcount) {
		this.pBlcount = pBlcount;
	}


	public Date getpEnrollDate() {
		return pEnrollDate;
	}


	public void setpEnrollDate(Date pEnrollDate) {
		this.pEnrollDate = pEnrollDate;
	}


	public PensionFacilities getPenFac() {
		return penFac;
	}


	public void setPenFac(PensionFacilities penFac) {
		this.penFac = penFac;
	}


	public List<PensionFile> getPenFile() {
		return penFile;
	}


	public void setPenFile(List<PensionFile> penFile) {
		this.penFile = penFile;
	}


	public List<Room> getRoomList() {
		return roomList;
	}


	public void setRoomList(List<Room> roomList) {
		this.roomList = roomList;
	}


	@Override
	public String toString() {
		return "Pension [pCode=" + pCode + ", pName=" + pName + ", pAddr=" + pAddr + ", pTel=" + pTel + ", oId=" + oId
				+ ", enrollYn=" + enrollYn + ", pBlcount=" + pBlcount + ", pEnrollDate=" + pEnrollDate + ", penFac="
				+ penFac + ", penFile=" + penFile + ", roomList=" + roomList + "]";
	}
	
	
}
