package com.jb.reservation.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class KakaoPaySuccessServlet
 */
@WebServlet("/reservation/kakaoPaySuccess")
public class KakaoPaySuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoPaySuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String resName = request.getParameter("resName");
		String cId = request.getParameter("cId");
		String resCode = request.getParameter("resCode");
		String resPhone = request.getParameter("resPhone");
		// 분기처리를 위한 radio버튼 name
		String pay = request.getParameter("pay");
		
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
//		int rPrice = Integer.parseInt(request.getParameter("rPrice"));
//		int rAddPrice = Integer.parseInt(request.getParameter("rAddPrice"));
//		int totalPrice = rPrice + rAddPrice;
		
		System.out.println("들어오니ㅣ??왜그러니???");
		System.out.println(cId);
		System.out.println(resCode);
//		
	
		Reservation resInfo = new ReservationService().selectOneReservation(resCode, cId);
		
		request.setAttribute("resInfo", resInfo);
		request.setAttribute("cId", cId);
		request.setAttribute("resCode", resCode);
		request.setAttribute("resName", resName);
		request.setAttribute("resPhone", resPhone);
		request.setAttribute("totalPrice", totalPrice);

		
		System.out.println("kakaooooooo : "+resInfo);
		
		request.getRequestDispatcher("/views/reservation/kakaoPaySuccessfully.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
