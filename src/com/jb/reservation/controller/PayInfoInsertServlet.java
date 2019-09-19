package com.jb.reservation.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;

import com.jb.pension.model.vo.Pension;
import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Payment;
import com.jb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class PayComplateServlet
 */
@WebServlet("/reservation/payComplete")
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
		
		
		//현희 기준(결제기능) 3번쨰 서블릿 !!
		
		//paymentView.jsp 에서 결제 성공시  결제정보를 DB에 insert해주며
		//PayInfoUpdateServlet으로 전환시켜주는 서블릿
		
		
		
		
		//결제정보 등록 
		
		String payCode = request.getParameter("payCode");
//		Date payDate = request.getParameter("");
		String payMethod = request.getParameter("pay_method");
		String resCode = request.getParameter("resCode");
		
		String nowYear = 
		
		Payment pay = new Payment(payCode,payDate,payMethod,resCode);
        
	
		
		ReservationService service= new ReservationService();
		int result=service.insertPayInfo(pay);
		
		String msg="";
		String loc="/reservation/payInfoUpdate?resCode="+resCode;
		msg=result>0?"결제 정보 저장에 성공하였습니다.":"결제 정보 저장에 실패하였습니다.관리자에게 문의하세요.";
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request,response);
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
