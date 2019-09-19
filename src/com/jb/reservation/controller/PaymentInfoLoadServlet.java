package com.jb.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Payment;
import com.jb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class PaymentInfoLoadServlet
 */
@WebServlet("/reservation/payInfoLoad")
public class PaymentInfoLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentInfoLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//현희 기준(결제 기능) 2번째 서블릿 !! 
		
		//paymentView.jsp 에게 값을 보여줌
		
	
		//예약한 clinet 정보 settion 및 예약한 방의 금액을 불러오는 서블릿  
		
		
		String resCode = request.getParameter("resCode");
		String cId= request.getParameter("cId");
		int rPrice=Integer.parseInt(request.getParameter("rPrice"));
		int rAddPrice = Integer.parseInt(request.getParameter("rAddPrice"));
		int totalPrice = rPrice+rAddPrice;
		
		request.setAttribute("totalPrice", totalPrice);
		
	
		Reservation res = new ReservationService().selectReservatedRoom(resCode);
		request.setAttribute("reservation", res);
		request.getRequestDispatcher("/views/reservation/pamentView.jsp").forward(request, response);
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
