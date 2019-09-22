package com.jb.reservation.model.vo;


import java.sql.Date;

import com.jb.client.model.vo.Client;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.Room;

public class Payment {
	
	private String payCode;
	private Date resDate;
	private Date payDate;
	private String payMethod;
	private String cId;
	private String rNo;
	private String pCode;
	
	private Pension Pension;
    private Room Room;
    private Client Client;
    
    public Payment() {
		// TODO Auto-generated constructor stub
	}

	public Payment(String payCode, Date resDate, Date payDate, String payMethod, String cId, String rNo, String pCode,
			com.jb.pension.model.vo.Pension pension, com.jb.pension.model.vo.Room room,
			com.jb.client.model.vo.Client client) {
		super();
		this.payCode = payCode;
		this.resDate = resDate;
		this.payDate = payDate;
		this.payMethod = payMethod;
		this.cId = cId;
		this.rNo = rNo;
		this.pCode = pCode;
		Pension = pension;
		Room = room;
		Client = client;
	}

	@Override
	public String toString() {
		return "Payment [payCode=" + payCode + ", resDate=" + resDate + ", payDate=" + payDate + ", payMethod="
				+ payMethod + ", cId=" + cId + ", rNo=" + rNo + ", pCode=" + pCode + ", Pension=" + Pension + ", Room="
				+ Room + ", Client=" + Client + "]";
	}
    
   
	
	

}
