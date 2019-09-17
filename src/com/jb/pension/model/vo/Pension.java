package com.jb.pension.model.vo;

import java.sql.Date;

public class Pension {
	
	private String pCode;
	private String pName;
	private String pAddr;
	private String pTel;
	private String oId;
	private String enrollYn;
	private int pBlcount;
	private Date pEnrollDate;
	
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

	public Date getpEnrollDate() {
		return pEnrollDate;
	}

	public void setpEnrollDate(Date pEnrollDate) {
		this.pEnrollDate = pEnrollDate;
	}

	public int getpBlcount() {
		return pBlcount;
	}

	public void setpBlcount(int pBlcount) {
		this.pBlcount = pBlcount;
	}

	@Override
	public String toString() {
		return "Pension [pCode=" + pCode + ", pName=" + pName + ", pAddr=" + pAddr + ", pTel=" + pTel + ", oId=" + oId
				+ ", enrollYn=" + enrollYn + ", pBlcount=" + pBlcount + ", pEnrollDate=" + pEnrollDate + "]";
	}

}
