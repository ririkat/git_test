package com.jb.reservation.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Payment;

/**
 * Servlet implementation class PaymentInfoInsertServlet
 */
@WebServlet("/reservation/payInfoInsert")
public class PaymentInfoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentInfoInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String payCode = request.getParameter("payCode");
		String resCode = request.getParameter("resCode");
		String payMethod = request.getParameter("payMethod");
		//pay-method radio button name 
		String payy = request.getParameter("pay");
//		Date payDate = request.getParameter("payDate");
		
		
		Payment pay = new Payment(payCode,payMethod,resCode);
		
	    ReservationService service = new ReservationService();
	    int result = service.insertPayInfo(pay);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
