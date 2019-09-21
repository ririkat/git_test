package com.jb.report.model.vo;

public class Report {
	
	private int repNo;
	private String category;
	private String content;
	private String cId;
	private int cmmNo;
	
	public Report() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Report(String cId, String category, String content, int cmmNo) {
		super();
		this.category = category;
		this.content = content;
		this.cId = cId;
		this.cmmNo = cmmNo;
	}



	public Report(int repNo, String category, String content, String cId, int cmmNo) {
		super();
		this.repNo = repNo;
		this.category = category;
		this.content = content;
		this.cId = cId;
		this.cmmNo = cmmNo;
	}

	public int getRepNo() {
		return repNo;
	}

	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public int getCmmNo() {
		return cmmNo;
	}

	public void setCmmNo(int cmmNo) {
		this.cmmNo = cmmNo;
	}

	@Override
	public String toString() {
		return "Report [repNo=" + repNo + ", category=" + category + ", content=" + content + ", cId=" + cId
				+ ", cmmNo=" + cmmNo + "]";
	}
	
	
	

}
