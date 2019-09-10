package com.jb.client.model.vo;

public class WishList {
	
	private String pImage, pName, pAddr, pTel, pCode ;
	
	public WishList() {
		// TODO Auto-generated constructor stub
	}

	public WishList(String pImage, String pName, String pAddr, String pTel, String pCode) {
		super();
		this.pImage = pImage;
		this.pName = pName;
		this.pAddr = pAddr;
		this.pTel = pTel;
		this.pCode = pCode;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpAddr() {
		return pAddr;
	}

	public void setpAddr(String pAddr) {
		this.pAddr = pAddr;
	}

	public String getpTel() {
		return pTel;
	}

	public void setpTel(String pTel) {
		this.pTel = pTel;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	@Override
	public String toString() {
		return "WishList [pImage=" + pImage + ", pName=" + pName + ", pAddr=" + pAddr + ", pTel=" + pTel + ", pCode="
				+ pCode + "]";
	}
	
	
	
	
	
	
	
	
	
	
	

}
