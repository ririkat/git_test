package com.jb.board.model.vo;

import java.sql.Date;

public class BoardComment {
	
	private int commentNo;
	private int cmmNo;
	private String comment;
	private Date commentDate;
	private String cId;
	private int commentLevel;
	private int commentRef;
	
	
	public BoardComment() {
	}
	
	public BoardComment(int commentLevel, String cId, String comment, int cmmNo, int commentRef) {
		super();
		this.commentLevel = commentLevel;
		this.cId = cId;
		this.comment = comment;
		this.cmmNo = cmmNo;
		this.commentRef = commentRef;
	}


	public BoardComment(int commentNo, int cmmNo, String comment, Date commentDate, String cId, int commentLevel,
			int commentRef) {
		super();
		this.commentNo = commentNo;
		this.cmmNo = cmmNo;
		this.comment = comment;
		this.commentDate = commentDate;
		this.cId = cId;
		this.commentLevel = commentLevel;
		this.commentRef = commentRef;
	}


	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCmmNo() {
		return cmmNo;
	}


	public void setCmmNo(int cmmNo) {
		this.cmmNo = cmmNo;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public Date getCommentDate() {
		return commentDate;
	}


	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}


	public String getcId() {
		return cId;
	}


	public void setcId(String cId) {
		this.cId = cId;
	}


	public int getCommentLevel() {
		return commentLevel;
	}


	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}


	public int getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}


	
	


}