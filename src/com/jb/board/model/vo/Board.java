package com.jb.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int cmmNo;
	private String title;
	private Date entDate;
	private String content;
	private String category;
	private String originalFilename;
	private String renameFilename;
	private int commuCnt;
	private String cId;//클라이언트 id
	private int viewCnt;//조회수
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(int cmmNo, String title, String cId, String content, String originalFilename, String renameFilename) {
		super();
		this.cmmNo = cmmNo;
		this.title = title;
		this.cId = cId;
		this.content = content;
		this.originalFilename = originalFilename;
		this.renameFilename = renameFilename;
	}

	public Board(String title, String cId, String content, String originalFilename, String renameFilename) {
		super();
		this.title = title;
		this.cId = cId;
		this.content = content;
		this.originalFilename = originalFilename;
		this.renameFilename = renameFilename;
	}


	public Board(int cmmNo, String title, Date entDate, String content, String category, String originalFilename,
			String renameFilename, int commuCnt, String cId, int viewCnt) {
		super();
		this.cmmNo = cmmNo;
		this.title = title;
		this.entDate = entDate;
		this.content = content;
		this.category = category;
		this.originalFilename = originalFilename;
		this.renameFilename = renameFilename;
		this.commuCnt = commuCnt;
		this.cId = cId;
		this.viewCnt = viewCnt;
	}

	public int getCmmNo() {
		return cmmNo;
	}

	public void setCmmNo(int cmmNo) {
		this.cmmNo = cmmNo;
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

	public int getCommuCnt() {
		return commuCnt;
	}

	public void setCommuCnt(int commuCnt) {
		this.commuCnt = commuCnt;
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


	
	
}