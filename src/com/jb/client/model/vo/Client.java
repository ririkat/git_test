package com.jb.client.model.vo;

import java.sql.Date;

public class Client {
	
	private String cId;
	private String cPw;
	private String cName;
	private Date cBirthYY;
	private Date cBirthMM;
	private Date cBirthDD;
	private String cGender;
	private String cEmail;
	private String cEmailSelect;
	private String cPhone;
	private String cAddr;
	private Date cEd;
	private int cBLCount;
	private int Authority;
	
	public Client() {
		// TODO Auto-generated constructor stub
	}
	

	public Client(String cId, String cPw, String cName, Date cBirth, String cGender, String cEmail, String cPhone,
			String cAddr, Date cEd, int cBLCount, int authority) {
		super();
		this.cId = cId;
		this.cPw = cPw;
		this.cName = cName;
		this.cBirth = cBirth;
		this.cGender = cGender;
		this.cEmail = cEmail;
		this.cPhone = cPhone;
		this.cAddr = cAddr;
		this.cEd = cEd;
		this.cBLCount = cBLCount;
		Authority = authority;
	}


	public Client(String cId, String cPw, String cName, Date cBirth, String cGender, String cEmail, String cEmailSelect,
			String cPhone, String cAddr, Date cEd, int cBLCount, int authority) {
		super();
		this.cId = cId;
		this.cPw = cPw;
		this.cName = cName;
		this.cBirth = cBirth;
		this.cGender = cGender;
		this.cEmail = cEmail;
		this.cEmailSelect = cEmailSelect;
		this.cPhone = cPhone;
		this.cAddr = cAddr;
		this.cEd = cEd;
		this.cBLCount = cBLCount;
		Authority = authority;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getcPw() {
		return cPw;
	}

	public void setcPw(String cPw) {
		this.cPw = cPw;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public Date getcBirth() {
		return cBirth;
	}

	public void setcBirth(Date cBirth) {
		this.cBirth = cBirth;
	}

	public String getcGender() {
		return cGender;
	}

	public void setcGender(String cGender) {
		this.cGender = cGender;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}

	public String getcEmailSelect() {
		return cEmailSelect;
	}

	public void setcEmailSelect(String cEmailSelect) {
		this.cEmailSelect = cEmailSelect;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public String getcAddr() {
		return cAddr;
	}

	public void setcAddr(String cAddr) {
		this.cAddr = cAddr;
	}

	public Date getcEd() {
		return cEd;
	}

	public void setcEd(Date cEd) {
		this.cEd = cEd;
	}

	public int getcBLCount() {
		return cBLCount;
	}

	public void setcBLCount(int cBLCount) {
		this.cBLCount = cBLCount;
	}

	public int getAuthority() {
		return Authority;
	}

	public void setAuthority(int authority) {
		Authority = authority;
	}

	@Override
	public String toString() {
		return "Client [cId=" + cId + ", cPw=" + cPw + ", cName=" + cName + ", cBirth=" + cBirth + ", cGender="
				+ cGender + ", cEmail=" + cEmail + ", cEmailSelect=" + cEmailSelect + ", cPhone=" + cPhone + ", cAddr="
				+ cAddr + ", cEd=" + cEd + ", cBLCount=" + cBLCount + ", Authority=" + Authority + "]";
	}
	
	
	
	
	
}
