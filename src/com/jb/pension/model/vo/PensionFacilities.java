package com.jb.pension.model.vo;

public class PensionFacilities {
	
	private String pCode;
	private String store;
	private String wifi;
	private String pet;
	private String pool;
	private String sPool;
	private String slide;
	private String openBath;
	private String grill;
	private String smoked;
	private String cafe;
	private String sing;
	private String foot;
	private String hand;
	private String car;
	
	public PensionFacilities() {
		// TODO Auto-generated constructor stub
	}

	public PensionFacilities(String pCode, String store, String wifi, String pet, String pool, String sPool,
			String slide, String openBath, String grill, String smoked, String cafe, String sing, String foot,
			String hand, String car) {
		super();
		this.pCode = pCode;
		this.store = store;
		this.wifi = wifi;
		this.pet = pet;
		this.pool = pool;
		this.sPool = sPool;
		this.slide = slide;
		this.openBath = openBath;
		this.grill = grill;
		this.smoked = smoked;
		this.cafe = cafe;
		this.sing = sing;
		this.foot = foot;
		this.hand = hand;
		this.car = car;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getWifi() {
		return wifi;
	}

	public void setWifi(String wifi) {
		this.wifi = wifi;
	}

	public String getPet() {
		return pet;
	}

	public void setPet(String pet) {
		this.pet = pet;
	}

	public String getPool() {
		return pool;
	}

	public void setPool(String pool) {
		this.pool = pool;
	}

	public String getsPool() {
		return sPool;
	}

	public void setsPool(String sPool) {
		this.sPool = sPool;
	}

	public String getSlide() {
		return slide;
	}

	public void setSlide(String slide) {
		this.slide = slide;
	}

	public String getOpenBath() {
		return openBath;
	}

	public void setOpenBath(String openBath) {
		this.openBath = openBath;
	}

	public String getGrill() {
		return grill;
	}

	public void setGrill(String grill) {
		this.grill = grill;
	}

	public String getSmoked() {
		return smoked;
	}

	public void setSmoked(String smoked) {
		this.smoked = smoked;
	}

	public String getCafe() {
		return cafe;
	}

	public void setCafe(String cafe) {
		this.cafe = cafe;
	}

	public String getSing() {
		return sing;
	}

	public void setSing(String sing) {
		this.sing = sing;
	}

	public String getFoot() {
		return foot;
	}

	public void setFoot(String foot) {
		this.foot = foot;
	}

	public String getHand() {
		return hand;
	}

	public void setHand(String hand) {
		this.hand = hand;
	}

	public String getCar() {
		return car;
	}

	public void setCar(String car) {
		this.car = car;
	}

	@Override
	public String toString() {
		return "PensionFacilities [pCode=" + pCode + ", store=" + store + ", wifi=" + wifi + ", pet=" + pet + ", pool="
				+ pool + ", sPool=" + sPool + ", slide=" + slide + ", openBath=" + openBath + ", grill=" + grill
				+ ", smoked=" + smoked + ", cafe=" + cafe + ", sing=" + sing + ", foot=" + foot + ", hand=" + hand
				+ ", car=" + car + "]";
	}

}
