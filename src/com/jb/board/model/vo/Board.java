package com.jb.board.model.vo;

import java.sql.Date;

public class Board {
	private int bNo;
	private String title;
	private Date entDate;
	private Date modDate;
	private String content;
	private String category;
	private String file;
	private int boardCnt;
	private String cId;
	
	public Board() {
		// TODO Auto-generated constructor stub
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

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
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

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
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

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", title=" + title + ", entDate=" + entDate + ", modDate=" + modDate + ", content="
				+ content + ", category=" + category + ", file=" + file + ", boardCnt=" + boardCnt + ", cId=" + cId
				+ "]";
	}
	

}
