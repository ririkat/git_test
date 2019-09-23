package com.jb.reservation.model.vo;


import java.util.Date;

import com.jb.client.model.vo.Client;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.Room;

public class Payment {
	
	private String payCode;
	private Date payDate;
	private String payMethod;
	private String resCode;
	
 
  
    
    public Payment() {
		// TODO Auto-generated constructor stub
	}




	public Payment(String payCode, Date payDate, String payMethod, String resCode) {
		super();
		this.payCode = payCode;
		this.payDate = payDate;
		this.payMethod = payMethod;
		this.resCode = resCode;
	}




	public String getPayCode() {
		return payCode;
	}




	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}




	public Date getPayDate() {
		return payDate;
	}




	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}




	public String getPayMethod() {
		return payMethod;
	}




	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}




	public String getResCode() {
		return resCode;
	}




	public void setResCode(String resCode) {
		this.resCode = resCode;
	}




	@Override
	public String toString() {
		return "Payment [payCode=" + payCode + ", payDate=" + payDate + ", payMethod=" + payMethod + ", resCode="
				+ resCode + "]";
	}


	
	
	
	

}
