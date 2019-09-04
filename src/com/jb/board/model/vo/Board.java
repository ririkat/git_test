package com.jb.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int bNo;
	private String title;
	private Date entDate;
	private String content;
	private String category;
	private String originalFilename;
	private String renameFilename;
	private int boardCnt;
	private String cId;//클라이언트 id
	private int viewCnt;//조회수
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Board(String title, String content, String originalFilename, String renameFilename, String cId) {
		super();
		this.title = title;
		this.content = content;
		this.originalFilename = originalFilename;
		this.renameFilename = renameFilename;
		this.cId = cId;
	}


	public Board(int bNo, String title, Date entDate, String content, String category, String originalFilename,
			String renameFilename, int boardCnt, String cId, int viewCnt) {
		super();
		this.bNo = bNo;
		this.title = title;
		this.entDate = entDate;
		this.content = content;
		this.category = category;
		this.originalFilename = originalFilename;
		this.renameFilename = renameFilename;
		this.boardCnt = boardCnt;
		this.cId = cId;
		this.viewCnt = viewCnt;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getEntDate() {
		return entDate;
	}

	public void setEntDate(Date entDate) {
		this.entDate = entDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getRenameFilename() {
		return renameFilename;
	}

	public void setRenameFilename(String renameFilename) {
		this.renameFilename = renameFilename;
	}

	public int getBoardCnt() {
		return boardCnt;
	}

	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", title=" + title + ", entDate=" + entDate + ", content=" + content
				+ ", category=" + category + ", originalFilename=" + originalFilename + ", renameFilename="
				+ renameFilename + ", boardCnt=" + boardCnt + ", cId=" + cId + ", viewCnt=" + viewCnt + "]";
	}

	
	
}