package com.jb.pension.model.vo;

public class PensionFile {

	private String pCode;
	private String pOriginalFile;
	private String pRenameFile;
	
	public PensionFile() {
		// TODO Auto-generated constructor stub
	}

	public PensionFile(String pCode, String pOriginalFile, String pRenameFile) {
		super();
		this.pCode = pCode;
		this.pOriginalFile = pOriginalFile;
		this.pRenameFile = pRenameFile;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpOriginalFile() {
		return pOriginalFile;
	}

	public void setpOriginalFile(String pOriginalFile) {
		this.pOriginalFile = pOriginalFile;
	}

	public String getpRenameFile() {
		return pRenameFile;
	}

	public void setpRenameFile(String pRenameFile) {
		this.pRenameFile = pRenameFile;
	}

	@Override
	public String toString() {
		return "PensionFile [pCode=" + pCode + ", pOriginalFile=" + pOriginalFile + ", pRenameFile=" + pRenameFile
				+ "]";
	}
	
}
