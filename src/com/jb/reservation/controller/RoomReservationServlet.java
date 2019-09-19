package com.jb.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Reservation;


/**
 * Servlet implementation class RoomReservationServlet
 */
@WebServlet("/reservation")
public class RoomReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String resCode = "1234";
		String resState = "N";
		
		int rNop = Integer.parseInt(request.getParameter("rnop"));
		int totalPrice = Integer.parseInt(request.getParameter("rpirce"));
		
		String rNo = request.getParameter("rno");
		String cId = "test1";
		
		  Reservation res = new Reservation(resCode,null,null,resState,rNop,totalPrice,rNo,cId);
		  ReservationService service = new ReservationService();
		  
		  int result = service.insertReservation(res); System.out.println(res);
		 

	}
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
