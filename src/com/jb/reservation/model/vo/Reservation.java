package com.jb.reservation.model.vo;

import java.sql.Date;

import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.Room;
import com.jb.client.model.vo.Client;

public class Reservation {

	private String resCode;
	private Date resCheckIn;
	private Date resCheckOut;
	private String resState;
	private String pCode;
	private int resNop;
	private int totalPrice;
	private String cId;
	
    //룸안에 펜션 넣기 
	private Pension Pension;
	private Room Room;
	
	private Payment Payment;
	
	private Client Client;

	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public Reservation(String resCode, Date resCheckIn, Date resCheckOut, String resState, String pCode, int resNop,
			int totalPrice, String cId, com.jb.pension.model.vo.Pension pension, com.jb.pension.model.vo.Room room,
			com.jb.reservation.model.vo.Payment payment, com.jb.client.model.vo.Client client) {
		super();
		this.resCode = resCode;
		this.resCheckIn = resCheckIn;
		this.resCheckOut = resCheckOut;
		this.resState = resState;
		this.pCode = pCode;
		this.resNop = resNop;
		this.totalPrice = totalPrice;
		this.cId = cId;
		Pension = pension;
		Room = room;
		Payment = payment;
		Client = client;
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public Date getResCheckIn() {
		return resCheckIn;
	}

	public void setResCheckIn(Date resCheckIn) {
		this.resCheckIn = resCheckIn;
	}

	public Date getResCheckOut() {
		return resCheckOut;
	}

	public void setResCheckOut(Date resCheckOut) {
		this.resCheckOut = resCheckOut;
	}

	public String getResState() {
		return resState;
	}

	public void setResState(String resState) {
		this.resState = resState;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public int getResNop() {
		return resNop;
	}

	public void setResNop(int resNop) {
		this.resNop = resNop;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public Pension getPension() {
		return Pension;
	}

	public void setPension(Pension pension) {
		Pension = pension;
	}

	public Room getRoom() {
		return Room;
	}

	public void setRoom(Room room) {
		Room = room;
	}

	public Payment getPayment() {
		return Payment;
	}

	public void setPayment(Payment payment) {
		Payment = payment;
	}

	public Client getClient() {
		return Client;
	}

	public void setClient(Client client) {
		Client = client;
	}

	@Override
	public String toString() {
		return "Reservation [resCode=" + resCode + ", resCheckIn=" + resCheckIn + ", resCheckOut=" + resCheckOut
				+ ", resState=" + resState + ", pCode=" + pCode + ", resNop=" + resNop + ", totalPrice=" + totalPrice
				+ ", cId=" + cId + ", Pension=" + Pension + ", Room=" + Room + ", Payment=" + Payment + ", Client="
				+ Client + "]";
	}

   
	
	
	
	

}
