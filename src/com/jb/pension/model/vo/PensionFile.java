package com.jb.pension.model.vo;

public class PensionFile {

	private int pFileNo;
	private String pOriginalFile;
	private String pRenameFile;
	private String pCode;
	
	public PensionFile() {
		// TODO Auto-generated constructor stub
	}

	public PensionFile(int pFileNo, String pOriginalFile, String pRenameFile, String pCode) {
		super();
		this.pFileNo = pFileNo;
		this.pOriginalFile = pOriginalFile;
		this.pRenameFile = pRenameFile;
		this.pCode = pCode;
	}
	

	public int getpFileNo() {
		return pFileNo;
	}

	public void setpFileNo(int pFileNo) {
		this.pFileNo = pFileNo;
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

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	@Override
	public String toString() {
		return "PensionFile [pFileNo=" + pFileNo + ", pOriginalFile=" + pOriginalFile + ", pRenameFile=" + pRenameFile
				+ ", pCode=" + pCode + "]";
	}
	
}
