package com.jb.owner.model.vo;

import java.sql.Date;

public class Owner {
	private String oId;
	private String oPw;
	private String oName;
	private Date oBirth;
	private String oGender;
	private String oEmail;
	private String oPhone;
	private String oAddr;
	private Date oEd;
	private String oEaYN;
	private int oBLCount;
	private int Authority;
	
	
	
	public Owner(String oId, String oPw, String oName, Date oBirth, String oGender, String oEmail, String oPhone,
			String oAddr) {
		super();
		this.oId = oId;
		this.oPw = oPw;
		this.oName = oName;
		this.oBirth = oBirth;
		this.oGender = oGender;
		this.oEmail = oEmail;
		this.oPhone = oPhone;
		this.oAddr = oAddr;
	}

	public Owner(String oId, String oPw, String oName, Date oBirth, String oGender, String oEmail, String oPhone,
			String oAddr, Date oEd, String oEaYN, int oBLCount, int authority) {
		super();
		this.oId = oId;
		this.oPw = oPw;
		this.oName = oName;
		this.oBirth = oBirth;
		this.oGender = oGender;
		this.oEmail = oEmail;
		this.oPhone = oPhone;
		this.oAddr = oAddr;
		this.oEd = oEd;
		this.oEaYN = oEaYN;
		this.oBLCount = oBLCount;
		Authority = authority;
	}

	public Owner() {
		// TODO Auto-generated constructor stub
	}

	public String getoId() {
		return oId;
	}

	public void setoId(String oId) {
		this.oId = oId;
	}

	public String getoPw() {
		return oPw;
	}

	public void setoPw(String oPw) {
		this.oPw = oPw;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public Date getoBirth() {
		return oBirth;
	}

	public void setoBirth(Date oBirth) {
		this.oBirth = oBirth;
	}

	public String getoGender() {
		return oGender;
	}

	public void setoGender(String oGender) {
		this.oGender = oGender;
	}

	public String getoEmail() {
		return oEmail;
	}

	public void setoEmail(String oEmail) {
		this.oEmail = oEmail;
	}

	public String getoPhone() {
		return oPhone;
	}

	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}

	public String getoAddr() {
		return oAddr;
	}

	public void setoAddr(String oAddr) {
		this.oAddr = oAddr;
	}

	public Date getoEd() {
		return oEd;
	}

	public void setoEd(Date oEd) {
		this.oEd = oEd;
	}

	public String getoEaYN() {
		return oEaYN;
	}

	public void setoEaYN(String oEaYN) {
		this.oEaYN = oEaYN;
	}

	public int getoBLCount() {
		return oBLCount;
	}

	public void setoBLCount(int oBLCount) {
		this.oBLCount = oBLCount;
	}

	public int getAuthority() {
		return Authority;
	}

	public void setAuthority(int authority) {
		Authority = authority;
	}

	@Override
	public String toString() {
		return "Owner [oId=" + oId + ", oPw=" + oPw + ", oName=" + oName + ", oBirth=" + oBirth + ", oGender=" + oGender
				+ ", oEmail=" + oEmail + ", oPhone=" + oPhone + ", oAddr=" + oAddr + ", oEd=" + oEd + ", oEaYN=" + oEaYN
				+ ", oBLCount=" + oBLCount + ", Authority=" + Authority + "]";
	}
	
	

}
