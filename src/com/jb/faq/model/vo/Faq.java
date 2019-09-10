package com.jb.faq.model.vo;

import java.sql.Date;

public class Faq {
	private int fNo;
	private String fTitle;
	private String fWriter;
	private String fContent;
	private String fOriginFilename;
	private String fRenamedFilename;
	private Date fEntDate;
	private Date fModDate;
	private int fReadCount;
	
	public Faq() {
		// TODO Auto-generated constructor stub
	}

	public Faq(int fNo, String fTitle, String fWriter, String fContent, String fOriginFilename, String fRenamedFilename,
			Date fEntDate, Date fModDate, int fReadCount) {
		super();
		this.fNo = fNo;
		this.fTitle = fTitle;
		this.fWriter = fWriter;
		this.fContent = fContent;
		this.fOriginFilename = fOriginFilename;
		this.fRenamedFilename = fRenamedFilename;
		this.fEntDate = fEntDate;
		this.fModDate = fModDate;
		this.fReadCount = fReadCount;
	}

	public Faq(String fTitle, String fWriter, String fContent, String fOriginFilename, String fRenamedFilename) {
		super();
		this.fTitle = fTitle;
		this.fWriter = fWriter;
		this.fContent = fContent;
		this.fOriginFilename = fOriginFilename;
		this.fRenamedFilename = fRenamedFilename;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfTitle() {
		return fTitle;
	}

	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}

	public String getfWriter() {
		return fWriter;
	}

	public void setfWriter(String fWriter) {
		this.fWriter = fWriter;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public String getfOriginFilename() {
		return fOriginFilename;
	}

	public void setfOriginFilename(String fOriginFilename) {
		this.fOriginFilename = fOriginFilename;
	}

	public String getfRenamedFilename() {
		return fRenamedFilename;
	}

	public void setfRenamedFilename(String fRenamedFilename) {
		this.fRenamedFilename = fRenamedFilename;
	}

	public Date getfEntDate() {
		return fEntDate;
	}

	public void setfEntDate(Date fEntDate) {
		this.fEntDate = fEntDate;
	}

	public Date getfModDate() {
		return fModDate;
	}

	public void setfModDate(Date fModDate) {
		this.fModDate = fModDate;
	}

	public int getfReadCount() {
		return fReadCount;
	}

	public void setfReadCount(int fReadCount) {
		this.fReadCount = fReadCount;
	}

	@Override
	public String toString() {
		return "Faq [fNo=" + fNo + ", fTitle=" + fTitle + ", fWriter=" + fWriter + ", fContent=" + fContent
				+ ", fOriginFilename=" + fOriginFilename + ", fRenamedFilename=" + fRenamedFilename + ", fEntDate="
				+ fEntDate + ", fModDate=" + fModDate + ", fReadCount=" + fReadCount + "]";
	}

}
