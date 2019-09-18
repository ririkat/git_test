package com.jb.review.model.vo;

import java.sql.Date;

public class Review {
	private int rNo;
	private String rTitle;
	private Date rEntDate;
	private String rContent;
	private int rBoardCnt;
	private int rViewCnt;
	private String rStatus;
	private String cId;	//회원아이디
	private String pCode;	//펜션코드


	public Review() {
		// TODO Auto-generated constructor stub
	}


	public Review(int rNo, String rTitle, Date rEntDate, String rContent, int rBoardCnt, int rViewCnt, String rStatus,
			String cId, String pCode) {
		super();
		this.rNo = rNo;
		this.rTitle = rTitle;
		this.rEntDate = rEntDate;
		this.rContent = rContent;
		this.rBoardCnt = rBoardCnt;
		this.rViewCnt = rViewCnt;
		this.rStatus = rStatus;
		this.cId = cId;
		this.pCode = pCode;
	}


	public int getrNo() {
		return rNo;
	}


	public void setrNo(int rNo) {
		this.rNo = rNo;
	}


	public String getrTitle() {
		return rTitle;
	}


	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}


	public Date getrEntDate() {
		return rEntDate;
	}


	public void setrEntDate(Date rEntDate) {
		this.rEntDate = rEntDate;
	}


	public String getrContent() {
		return rContent;
	}


	public void setrContent(String rContent) {
		this.rContent = rContent;
	}


	public int getrBoardCnt() {
		return rBoardCnt;
	}


	public void setrBoardCnt(int rBoardCnt) {
		this.rBoardCnt = rBoardCnt;
	}


	public int getrViewCnt() {
		return rViewCnt;
	}


	public void setrViewCnt(int rViewCnt) {
		this.rViewCnt = rViewCnt;
	}


	public String getrStatus() {
		return rStatus;
	}


	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}


	public String getcId() {
		return cId;
	}


	public void setcId(String cId) {
		this.cId = cId;
	}


	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	@Override
	public String toString() {
		return "Review [rNo=" + rNo + ", rTitle=" + rTitle + ", rEntDate=" + rEntDate + ", rContent=" + rContent
				+ ", rBoardCnt=" + rBoardCnt + ", rViewCnt=" + rViewCnt + ", rStatus=" + rStatus + ", cId=" + cId
				+ ", pCode=" + pCode + "]";
	}
	
	
	


}
