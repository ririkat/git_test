package com.jb.master.model.vo;

import java.util.Date;

public class Master {
	private String mId;
	private String mPw;
	private Date mEd;
	private String mAuthority;
	
	public Master() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Master(String mId, String mPw, Date mEd, String mAuthority) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mEd = mEd;
		this.mAuthority = mAuthority;
	}



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

	public String getmAuthority() {
		return mAuthority;
	}

	public void setmAuthority(String mAuthority) {
		this.mAuthority = mAuthority;
	}



	@Override
	public String toString() {
		return "Master [mId=" + mId + ", mPw=" + mPw + ", mEd=" + mEd + ", mAuthority=" + mAuthority + "]";
	}
	
	
	
	
}
