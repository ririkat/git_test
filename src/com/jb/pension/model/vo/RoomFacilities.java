package com.jb.pension.model.vo;

public class RoomFacilities {
	
	private String rNo;
	private String bed;
	private String dressTable;
	private String table;
	private String sofa;
	private String dressCase;
	private String bath;
	private String spa;
	private String washKit;
	private String tv;
	private String beam;
	private String aircon;
	private String fridge;
	private String cookFac;
	private String cookUten;
	private String rice;
	private String microwave;
	private String rSmoked;
	private String child;
	private String oView;
	private String iPool;
	
	public RoomFacilities() {
		// TODO Auto-generated constructor stub
	}

	public RoomFacilities(String rNo, String bed, String dressTable, String table, String sofa,
			String dressCase, String bath, String spa, String washKit, String tv, String beam, String aircon,
			String fridge, String cookFac, String cookUten, String rice, String microwave, String rSmoked, String child,
			String oView, String iPool) {
		super();
		this.rNo = rNo;
		this.bed = bed;
		this.dressTable = dressTable;
		this.table = table;
		this.sofa = sofa;
		this.dressCase = dressCase;
		this.bath = bath;
		this.spa = spa;
		this.washKit = washKit;
		this.tv = tv;
		this.beam = beam;
		this.aircon = aircon;
		this.fridge = fridge;
		this.cookFac = cookFac;
		this.cookUten = cookUten;
		this.rice = rice;
		this.microwave = microwave;
		this.rSmoked = rSmoked;
		this.child = child;
		this.oView = oView;
		this.iPool = iPool;
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
	}

	public String getBed() {
		return bed;
	}

	public void setBed(String bed) {
		this.bed = bed;
	}

	public String getDressTable() {
		return dressTable;
	}

	public void setDressTable(String dressTable) {
		this.dressTable = dressTable;
	}

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String getSofa() {
		return sofa;
	}

	public void setSofa(String sofa) {
		this.sofa = sofa;
	}

	public String getDressCase() {
		return dressCase;
	}

	public void setDressCase(String dressCase) {
		this.dressCase = dressCase;
	}

	public String getBath() {
		return bath;
	}

	public void setBath(String bath) {
		this.bath = bath;
	}

	public String getSpa() {
		return spa;
	}

	public void setSpa(String spa) {
		this.spa = spa;
	}

	public String getWashKit() {
		return washKit;
	}

	public void setWashKit(String washKit) {
		this.washKit = washKit;
	}

	public String getTv() {
		return tv;
	}

	public void setTv(String tv) {
		this.tv = tv;
	}

	public String getBeam() {
		return beam;
	}

	public void setBeam(String beam) {
		this.beam = beam;
	}

	public String getAircon() {
		return aircon;
	}

	public void setAircon(String aircon) {
		this.aircon = aircon;
	}

	public String getFridge() {
		return fridge;
	}

	public void setFridge(String fridge) {
		this.fridge = fridge;
	}

	public String getCookFac() {
		return cookFac;
	}

	public void setCookFac(String cookFac) {
		this.cookFac = cookFac;
	}

	public String getCookUten() {
		return cookUten;
	}

	public void setCookUten(String cookUten) {
		this.cookUten = cookUten;
	}

	public String getRice() {
		return rice;
	}

	public void setRice(String rice) {
		this.rice = rice;
	}

	public String getMicrowave() {
		return microwave;
	}

	public void setMicrowave(String microwave) {
		this.microwave = microwave;
	}

	public String getrSmoked() {
		return rSmoked;
	}

	public void setrSmoked(String rSmoked) {
		this.rSmoked = rSmoked;
	}

	public String getChild() {
		return child;
	}

	public void setChild(String child) {
		this.child = child;
	}

	public String getoView() {
		return oView;
	}

	public void setoView(String oView) {
		this.oView = oView;
	}

	public String getiPool() {
		return iPool;
	}

	public void setiPool(String iPool) {
		this.iPool = iPool;
	}

	@Override
	public String toString() {
		return "RoomFacilities [rNo=" + rNo + ", bed=" + bed + ", dressTable=" + dressTable
				+ ", table=" + table + ", sofa=" + sofa + ", dressCase=" + dressCase + ", bath=" + bath + ", spa=" + spa
				+ ", washKit=" + washKit + ", tv=" + tv + ", beam=" + beam + ", aircon=" + aircon + ", fridge=" + fridge
				+ ", cookFac=" + cookFac + ", cookUten=" + cookUten + ", rice=" + rice + ", microwave=" + microwave
				+ ", rSmoked=" + rSmoked + ", child=" + child + ", oView=" + oView + ", iPool=" + iPool + "]";
	}

}
