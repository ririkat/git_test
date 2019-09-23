package com.jb.reservation.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Payment;
import com.jb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class PaymentInfoInsertServlet
 */
@WebServlet("/reservation/payInfoInsert")
public class PayInfoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayInfoInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//카카오페이 결제 성공시 연결되는 서블릿 
		
		String cId = request.getParameter("cId");
		String payCode = request.getParameter("payCode");
		String resCode = request.getParameter("resCode");
		String payMethod = request.getParameter("payMethod");
		String resState = request.getParameter("resState");
		
		
		//payMethod가 kakaopay면 DB에 카드결제라고 넣어줌 
		if(payMethod.equals("kakaoPay")) {
			
			payMethod="카드결제";
		}else {
			
			payMethod="무통장입금";
		}
	
		//payDate
		String nowYear = request.getParameter("nowYear");
		String nowMonth = request.getParameter("nowMonth");
		String nowDate = request.getParameter("nowDate");
		String pd = nowYear + "-" + nowMonth + "-" + nowDate;
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = new java.util.Date();
		try {
			utilDate = transFormat.parse(pd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		System.out.println("utilDate: " + utilDate);
		System.out.println("sqlDate: " + sqlDate);
		
		Date payDate = sqlDate;

		Payment pay = new Payment(payCode,payDate,payMethod,resCode);
		
	    ReservationService service = new ReservationService();
	    Reservation res = service.selectOneReservation(resCode, cId);
	    System.out.println("인서트서블릿에서 res : " + res);
	    int result = service.insertPayInfo(pay);
	   
	  
		//결제 수단에 따른 화면 분기 처리 
	    
	    if(payMethod.equals("kakaoPay")) {
			    String msg="";
				String loc="/reservation/changeResState?resCode="+resCode;
				msg=result>0?"결제성공":"결제실패";
				request.setAttribute("msg",msg);
				request.setAttribute("loc",loc);
				request.getRequestDispatcher("/views/common/msg.jsp")
				.forward(request,response);
		
		}else {
		      String msg="";
				String loc="/";
				msg=result>0?"결제성공":"결제실패";
				request.setAttribute("msg",msg);
				request.setAttribute("loc",loc);
				request.getRequestDispatcher("/views/common/msg.jsp")
				.forward(request,response);
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
