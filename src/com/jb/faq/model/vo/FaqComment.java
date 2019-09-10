package com.jb.faq.model.vo;

import java.sql.Date;

public class FaqComment {
	private int fCommentNo;
	private int fCommentLevel;
	private String fCommentWriter;
	private String fCommentContent;
	private int fRef;
	private int fCommentRef;
	private Date fCommentDate;
	
	public FaqComment() {
		// TODO Auto-generated constructor stub
	}

	public FaqComment(int fCommentLevel, String fCommentWriter, String fCommentContent, int fRef,
			int fCommentRef) {
		super();
		this.fCommentLevel = fCommentLevel;
		this.fCommentWriter = fCommentWriter;
		this.fCommentContent = fCommentContent;
		this.fRef = fRef;
		this.fCommentRef = fCommentRef;
	}

	public int getfCommentNo() {
		return fCommentNo;
	}

	public void setfCommentNo(int fCommentNo) {
		this.fCommentNo = fCommentNo;
	}

	public int getfCommentLevel() {
		return fCommentLevel;
	}

	public void setfCommentLevel(int fCommentLevel) {
		this.fCommentLevel = fCommentLevel;
	}

	public String getfCommentWriter() {
		return fCommentWriter;
	}

	public void setfCommentWriter(String fCommentWriter) {
		this.fCommentWriter = fCommentWriter;
	}

	public String getfCommentContent() {
		return fCommentContent;
	}

	public void setfCommentContent(String fCommentContent) {
		this.fCommentContent = fCommentContent;
	}

	public int getfRef() {
		return fRef;
	}

	public void setfRef(int fRef) {
		this.fRef = fRef;
	}

	public int getfCommentRef() {
		return fCommentRef;
	}

	public void setfCommentRef(int fCommentRef) {
		this.fCommentRef = fCommentRef;
	}

	public Date getfCommentDate() {
		return fCommentDate;
	}

	public void setfCommentDate(Date fCommentDate) {
		this.fCommentDate = fCommentDate;
	}

	@Override
	public String toString() {
		return "FaqComment [fCommentNo=" + fCommentNo + ", fCommentLevel=" + fCommentLevel + ", fCommentWriter="
				+ fCommentWriter + ", fCommentContent=" + fCommentContent + ", fRef=" + fRef + ", fCommentRef="
				+ fCommentRef + ", fCommentDate=" + fCommentDate + "]";
	}

}
