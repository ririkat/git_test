package com.jb.client.model.vo;

import java.sql.Date;

public class Reservation {
	
	private String resCode;
	private Date resCheckIn;
	private Date resCheckOut;
	private String resState;
	private String rNo;
	private String pCode;
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public Date getResCheckIn() {
		return resCheckIn;
	}

	public void setResCheckIn(Date resCheckIn) {
		this.resCheckIn = resCheckIn;
	}

	public Date getResCheckOut() {
		return resCheckOut;
	}

	public void setResCheckOut(Date resCheckOut) {
		this.resCheckOut = resCheckOut;
	}

	public String getResState() {
		return resState;
	}

	public void setResState(String resState) {
		this.resState = resState;
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
		return "Reservation [resCode=" + resCode + ", resCheckIn=" + resCheckIn + ", resCheckOut=" + resCheckOut
				+ ", resState=" + resState + ", rNo=" + rNo + ", pCode=" + pCode + "]";
	}
	
	
	

}
