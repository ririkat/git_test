package com.jb.notice.model.vo;

import java.sql.Date;

public class NoticeComment {
	private int nCommentNo;
	private int nCommentLevel;
	private String nCommentWriter;
	private String nCommentContent;
	private int nRef;
	private  int nCommentRef;
	private Date nCommentDate;
	
	public NoticeComment() {
		// TODO Auto-generated constructor stub
	}
	
	

	public NoticeComment(int nCommentLevel, String nCommentWriter, String nCommentContent, int nRef, int nCommentRef) {
		super();
		this.nCommentLevel = nCommentLevel;
		this.nCommentWriter = nCommentWriter;
		this.nCommentContent = nCommentContent;
		this.nRef = nRef;
		this.nCommentRef = nCommentRef;
	}



	public int getnCommentNo() {
		return nCommentNo;
	}

	public void setnCommentNo(int nCommentNo) {
		this.nCommentNo = nCommentNo;
	}

	public int getnCommentLevel() {
		return nCommentLevel;
	}

	public void setnCommentLevel(int nCommentLevel) {
		this.nCommentLevel = nCommentLevel;
	}

	public String getnCommentWriter() {
		return nCommentWriter;
	}

	public void setnCommentWriter(String nCommentWriter) {
		this.nCommentWriter = nCommentWriter;
	}

	public String getnCommentContent() {
		return nCommentContent;
	}

	public void setnCommentContent(String nCommentContent) {
		this.nCommentContent = nCommentContent;
	}

	public int getnRef() {
		return nRef;
	}

	public void setnRef(int nRef) {
		this.nRef = nRef;
	}

	public int getnCommentRef() {
		return nCommentRef;
	}

	public void setnCommentRef(int nCommentRef) {
		this.nCommentRef = nCommentRef;
	}

	public Date getnCommentDate() {
		return nCommentDate;
	}

	public void setnCommentDate(Date nCommentDate) {
		this.nCommentDate = nCommentDate;
	}

	@Override
	public String toString() {
		return "NoticeComment [nCommentNo=" + nCommentNo + ", nCommentLevel=" + nCommentLevel + ", nCommentWriter="
				+ nCommentWriter + ", nCommentContent=" + nCommentContent + ", nRef=" + nRef + ", nCommentRef="
				+ nCommentRef + ", nCommentDate=" + nCommentDate + "]";
	}

}
