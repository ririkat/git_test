package com.jb.member.model.vo;

public class Pension {
	private String pCode;
	private String pName;
	private String pAddr;
	private String pTel;
	private String oId;
	
	public Pension() {
		// TODO Auto-generated constructor stub
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

	@Override
	public String toString() {
		return "Pension [pCode=" + pCode + ", pName=" + pName + ", pAddr=" + pAddr + ", pTel=" + pTel + ", oId=" + oId
				+ "]";
	}
	
	

}
