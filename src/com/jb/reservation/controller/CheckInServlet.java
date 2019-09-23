package com.jb.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class CheckInServlet
 */
@WebServlet("/checkIncheck")
public class CheckInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
//		Date CheckIn = Date.valueOf(request.getParameter("checkIn"));
		
		String date = request.getParameter("checkIn");
		Date checkIn = Date.valueOf(date);
		System.out.println(checkIn);
		SimpleDateFormat sp = new SimpleDateFormat("yy-MM-dd");
		date=sp.format(checkIn);
		System.out.println(date);
		
		
		ReservationService service = new ReservationService();
		Reservation res = service.checkIncheck(checkIn);
		System.out.println(res);
			
		
		String view = "";
		
		if(res.getResCheckIn() == null) {
			String msg = "예약이 가능합니다";
			request.setAttribute("msg", msg);
			view = "/views/common/msg.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}else {
			String msg = "예약된 방 입니다.";
			request.setAttribute("msg", msg);
			view = "/views/common/msg.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
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
