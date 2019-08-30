package com.jb.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int nNo;
	private String nTitle;
	private Date nEntDate;
	private Date nModeDate;
	private String nContent;
	private String nFile;
	private String mId;
	private int nViewCnt;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int nNo, String nTitle, Date nEntDate, Date nModeDate, String nContent, String nFile, String mId,
			int nViewCnt) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nEntDate = nEntDate;
		this.nModeDate = nModeDate;
		this.nContent = nContent;
		this.nFile = nFile;
		this.mId = mId;
		this.nViewCnt = nViewCnt;
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

	public Date getnModeDate() {
		return nModeDate;
	}

	public void setnModeDate(Date nModeDate) {
		this.nModeDate = nModeDate;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnFile() {
		return nFile;
	}

	public void setnFile(String nFile) {
		this.nFile = nFile;
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
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nEntDate=" + nEntDate + ", nModeDate=" + nModeDate
				+ ", nContent=" + nContent + ", nFile=" + nFile + ", mId=" + mId + ", nViewCnt=" + nViewCnt + "]";
	}

}
