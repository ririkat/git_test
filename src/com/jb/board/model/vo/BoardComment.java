package com.jb.board.model.vo;

import java.sql.Date;

public class BoardComment {
	
	private int coNo;
	private String comment;
	private Date commentDate;
	private String cId;
	private int commentLevel;
	private int commentRef;
	private int cmmNo;
	
	public BoardComment() {
		// TODO Auto-generated constructor stub
	}
	
	public BoardComment(int commentLevel, String cId, String comment, int cmmNo, int commentRef) {
		super();
		this.commentLevel = commentLevel;
		this.cId = cId;
		this.comment = comment;
		this.cmmNo = cmmNo;
		this.commentRef = commentRef;
	}

	public BoardComment(int coNo, String comment, Date commentDate, String cId, int commentLevel, int commentRef,
			int cmmNo) {
		super();
		this.coNo = coNo;
		this.comment = comment;
		this.commentDate = commentDate;
		this.cId = cId;
		this.commentLevel = commentLevel;
		this.commentRef = commentRef;
		this.cmmNo = cmmNo;
	}

	public int getCoNo() {
		return coNo;
	}

	public void setCoNo(int coNo) {
		this.coNo = coNo;
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

	public int getCmmNo() {
		return cmmNo;
	}

	public void setCmmNo(int cmmNo) {
		this.cmmNo = cmmNo;
	}

	@Override
	public String toString() {
		return "BoardComment [coNo=" + coNo + ", comment=" + comment + ", commentDate=" + commentDate + ", cId=" + cId
				+ ", commentLevel=" + commentLevel + ", commentRef=" + commentRef + ", cmmNo=" + cmmNo + "]";
	}
	
	
	
}