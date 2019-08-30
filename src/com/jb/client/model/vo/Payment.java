package com.jb.client.model.vo;


import java.sql.Date;

public class Payment {
	
	private String payCode;
	private Date resDate;
	private Date payDate;
	private String payMethod;
	private String cId;
	private String rNo;
	private String pCode;
	
	public Payment() {
		// TODO Auto-generated constructor stub
	}

	public String getPayCode() {
		return payCode;
	}

	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
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

	@Override
	public String toString() {
		return "Payment [payCode=" + payCode + ", resDate=" + resDate + ", payDate=" + payDate + ", payMethod="
				+ payMethod + ", cId=" + cId + ", rNo=" + rNo + ", pCode=" + pCode + "]";
	}
	

}
