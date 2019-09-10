package com.jb.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int nNo;
	private String nTitle;
	private Date nEntDate;
	private Date nModDate;
	private String nContent;
	private String nOriginFile;
	private String nRenamedFile;
	private String mId;
	private int nViewCnt;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(String nTitle,String writer, String nContent, String nOriginFile,
			String nRenamedFile) {

		this.nTitle = nTitle;
		this.nContent = nContent;
		this.mId=writer;
		this.nOriginFile = nOriginFile;
		this.nRenamedFile = nRenamedFile;
	}
	
	

	public Notice(int nNo, String nTitle,String writer, String nContent, String nOriginFile,
			String nRenamedFile) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.mId=writer;
		this.nContent = nContent;
		this.nOriginFile = nOriginFile;
		this.nRenamedFile = nRenamedFile;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public Date getnEntDate() {
		return nEntDate;
	}

	public void setnEntDate(Date nEntDate) {
		this.nEntDate = nEntDate;
	}

	public Date getnModDate() {
		return nModDate;
	}

	public void setnModDate(Date nModDate) {
		this.nModDate = nModDate;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnOriginFile() {
		return nOriginFile;
	}

	public void setnOriginFile(String nOriginFile) {
		this.nOriginFile = nOriginFile;
	}

	public String getnRenamedFile() {
		return nRenamedFile;
	}

	public void setnRenamedFile(String nRenamedFile) {
		this.nRenamedFile = nRenamedFile;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getnViewCnt() {
		return nViewCnt;
	}

	public void setnViewCnt(int nViewCnt) {
		this.nViewCnt = nViewCnt;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nEntDate=" + nEntDate + ", nModDate=" + nModDate
				+ ", nContent=" + nContent + ", nOriginFile=" + nOriginFile + ", nRenamedFile=" + nRenamedFile
				+ ", mId=" + mId + ", nViewCnt=" + nViewCnt + "]";
	}

	
	
}
