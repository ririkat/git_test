package com.jb.review.model.vo;

public class ReviewFile {
	private int rNo;
	private String pOriginalFile;
	private String pRenameFile;
	
	public ReviewFile() {
		// TODO Auto-generated constructor stub
	}

	public ReviewFile(int rNo, String pOriginalFile, String pRenameFile) {
		super();
		this.rNo = rNo;
		this.pOriginalFile = pOriginalFile;
		this.pRenameFile = pRenameFile;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getpOriginalFile() {
		return pOriginalFile;
	}

	public void setpOriginalFile(String pOriginalFile) {
		this.pOriginalFile = pOriginalFile;
	}

	public String getpRenameFile() {
		return pRenameFile;
	}

	public void setpRenameFile(String pRenameFile) {
		this.pRenameFile = pRenameFile;
	}

	@Override
	public String toString() {
		return "ReviewFile [rNo=" + rNo + ", pOriginalFile=" + pOriginalFile + ", pRenameFile=" + pRenameFile + "]";
	}
	
	
	
	
}
