package com.jb.pension.model.vo;

public class RoomFile {
	
	private int rFileNo;
	private String rOriginalFile;
	private String rRenameFile;
	private String rNo;
	
	public RoomFile() {
		// TODO Auto-generated constructor stub
	}

	public RoomFile(int rFileNo, String rOriginalFile, String rRenameFile, String rNo) {
		super();
		this.rFileNo = rFileNo;
		this.rOriginalFile = rOriginalFile;
		this.rRenameFile = rRenameFile;
		this.rNo = rNo;
	}

	public int getrFileNo() {
		return rFileNo;
	}

	public void setrFileNo(int rFileNo) {
		this.rFileNo = rFileNo;
	}

	public String getrOriginalFile() {
		return rOriginalFile;
	}

	public void setrOriginalFile(String rOriginalFile) {
		this.rOriginalFile = rOriginalFile;
	}

	public String getrRenameFile() {
		return rRenameFile;
	}

	public void setrRenameFile(String rRenameFile) {
		this.rRenameFile = rRenameFile;
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
	}

	@Override
	public String toString() {
		return "RoomFile [rFileNo=" + rFileNo + ", rOriginalFile=" + rOriginalFile + ", rRenameFile=" + rRenameFile
				+ ", rNo=" + rNo + "]";
	}

}
