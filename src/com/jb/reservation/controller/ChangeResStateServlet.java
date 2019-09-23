package com.jb.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ChangeResStateServlet
 */
@WebServlet("/reservation/changeResState")
public class ChangeResStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeResStateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	

//		String resState = request.getParameter("resState");
	
		Reservation res=new Reservation();
		
		res.setResCode(request.getParameter("resCode"));
		System.out.println("서블릿 code : "+res.getResCode());
		res.setResState("Y");
		System.out.println("서블릿 state : "+res.getResState());
		
		
		
		int result = new ReservationService().changeResState(res);
		
		String msg=result>0?"예약목록에서 확인 가능합니다":"실패하였습니다.";
		String loc="/";
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
