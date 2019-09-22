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
 * Servlet implementation class SelectPayMethodServlet
 */
@WebServlet("/reservation/selectPayMethod")
public class SelectPayMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPayMethodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cId = request.getParameter("cId");
		String resCode = request.getParameter("resCode");
		//분기처리를 위해 radio버튼의 name 불러온거에욤
		String pay = request.getParameter("pay");
		
		Reservation resInfo = new ReservationService().selectOneReservation(resCode, cId);
		
		System.out.println("selectPayMethodServlet: "+resInfo);
	
		
	    
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
	    
	    
	   
	    if(pay.equals("payByAccount")) {
	    	
	    	request.getRequestDispatcher("/views/reservation/paymentOnAccount.jsp").forward(request,response);
	    
	    }else {
	    	
	    	request.getRequestDispatcher("/views/reservation/paymentOnKakao.jsp").forward(request,response);
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
