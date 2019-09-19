package com.jb.reservation.controller;

import java.io.IOException;
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
		
		
	
		
		
		//펜션명, 펜션주소, 객실명, 기준/최대 인원수, 체크인아웃날짜, 인원수, 추가인원수, 추가인원요금 , 요금합계 
		//이름, 생년월일 , 연락처, 이메일
		
		//hidden으로 처리한 것 : pCode, resCode, cId , rNo
		
		
		
		
		//예약정보를 보여주는 로직 
		
		String resCode = request.getParameter("resCode");
		String cId=request.getParameter("cId");
		
		Reservation res = new ReservationService().selectReservatedRoom(resCode);
		request.setAttribute("reservation", res);
		
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
