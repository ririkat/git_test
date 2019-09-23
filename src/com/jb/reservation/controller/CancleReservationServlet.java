package com.jb.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.reservation.model.service.ReservationService;

/**
 * Servlet implementation class CancleReservationServlet
 */
@WebServlet("/reservation/cancleRes")
public class CancleReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancleReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		String resCode = request.getParameter("resCode");
		 String cId = request.getParameter("cId");
		 
		 int result = new ReservationService().cancleRes(resCode);
		
		 String msg = result>0?"예약취소가 완료되었습니다.":"예약취소에 실패하였습니다.";
		 String loc = result>0?"/":"/client/reservationList";
		 request.setAttribute("msg", msg);
		 request.setAttribute("loc", loc);
		 request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
