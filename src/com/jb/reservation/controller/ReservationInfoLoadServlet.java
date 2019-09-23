package com.jb.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.vo.Pension;
import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/reservation/reservationInfoLoad")
public class ReservationInfoLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationInfoLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//현희 기준(결제기능) 1번 서블릿!!! reservationConfirm.jsp에 예약한 펜션정보 깔아주는 서블릿임
		
	
		//예약정보를 보여주는 로직 
		

		String resCode = request.getParameter("resCode");
		System.out.println("resCode : "+resCode);
	
		//임의로 예약코드 설정해놓음 / DB생성되면 지워도됨 
	//	String resCode = "1234";

		String cId=request.getParameter("cId");
		System.out.println("cId : "+cId);
		
		Reservation resInfo = new ReservationService().selectOneReservation(resCode, cId);
		System.out.println("infoLoad서블릿 : "+resInfo);
	

		
	    request.setAttribute("resInfo", resInfo);
	    request.setAttribute("cId", cId);
	    request.setAttribute("resCode", resCode);
	     System.out.println("reservation info load 서블릿 " + resInfo);
	     

		
		
		request.getRequestDispatcher("/views/reservation/reservationConfirm.jsp").forward(request,response);		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
