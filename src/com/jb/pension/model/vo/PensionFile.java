package com.jb.pension.model.vo;

public class PensionFile {

	private int pFileNo;
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
	
	

	public PensionFile(int pFileNo, String pCode, String pOriginalFile, String pRenameFile) {
		super();
		this.pFileNo = pFileNo;
		this.pCode = pCode;
		this.pOriginalFile = pOriginalFile;
		this.pRenameFile = pRenameFile;
	}
	
	

	public int getpFileNo() {
		return pFileNo;
	}

	public void setpFileNo(int pFileNo) {
		this.pFileNo = pFileNo;
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
		return "PensionFile [pFileNo=" + pFileNo + ", pCode=" + pCode + ", pOriginalFile=" + pOriginalFile
				+ ", pRenameFile=" + pRenameFile + "]";
	}
	
}
