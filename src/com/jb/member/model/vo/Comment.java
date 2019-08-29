package com.jb.member.model.vo;

import java.sql.Date;

public class Comment {
	
	private int coNo;
	private int bNo;
	private String comment;
	private Date commentDate;
	private String commentWriter;
	private String cId;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}


	public int getCoNo() {
		return coNo;
	}

	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
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

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}


	@Override
	public String toString() {
		return "Comment [coNo=" + coNo + ", bNo=" + bNo + ", comment=" + comment + ", commentDate=" + commentDate
				+ ", commentWriter=" + commentWriter + ", cId=" + cId + "]";
	}
	
	

}
