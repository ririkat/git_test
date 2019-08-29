package com.jb.member.model.vo;

import java.sql.Date;

public class Master {
	private String mId;
	private String mPw;
	private Date mEd;
	private int Authority;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public Date getmEd() {
		return mEd;
	}
	public void setmEd(Date mEd) {
		this.mEd = mEd;
	}
	public int getAuthority() {
		return Authority;
	}
	public void setAuthority(int authority) {
		Authority = authority;
	}
	
	@Override
	public String toString() {
		return "Master [mId=" + mId + ", mPw=" + mPw + ", mEd=" + mEd + ", Authority=" + Authority + "]";
	}

}
