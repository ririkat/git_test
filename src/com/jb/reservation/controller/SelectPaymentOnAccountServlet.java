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
 * Servlet implementation class SelectPaymentOnAccountServlet
 */
@WebServlet("/resservation/account")
public class SelectPaymentOnAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPaymentOnAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		String resName = request.getParameter("resName");
		String accountName = request.getParameter("accountName");
		String cId = request.getParameter("cId");
	String resCode = request.getParameter("resCode");
//		String resCode = "1234";
		String resPhone = request.getParameter("resPhone");

		
		Reservation resInfo = new ReservationService().selectOneReservation(resCode, cId);
		
		System.out.println("무통장입금서블릿: "+resInfo);
	
		
	    
	    Calendar now = Calendar.getInstance();
		int nowYear = now.get(Calendar.YEAR);			// 현재 년
		int nowMonth = now.get(Calendar.MONTH)+1;		// 현재 월
		int nowDate = now.get(Calendar.DATE)+7;			// 현재 일
		
		String accountDay = nowYear+"년 "+nowMonth+"월 "+nowDate+"일 까지 입금해주세요.";
		
		System.out.println(accountDay);
	

	    request.setAttribute("resInfo", resInfo);
	    request.setAttribute("cId", cId);
	    request.setAttribute("resCode", resCode);
	    request.setAttribute("accountDay", accountDay);
	    request.setAttribute("accountDay", accountDay);
	    request.setAttribute("resName", resName);
	    request.setAttribute("resPhone", resPhone);
	    
	    request.getRequestDispatcher("/views/reservation/paymentOnAccount.jsp").forward(request, response);
	    
	    
	   
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
