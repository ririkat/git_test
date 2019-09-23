package com.jb.owner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.owner.model.vo.Owner;
import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ResWaitClientListServlet
 */
@WebServlet("/owner/resWaitClientList")
public class ResWaitClientListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResWaitClientListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Owner loginOwner = (Owner)request.getSession().getAttribute("loginOwner");
		if(loginOwner==null) {
			request.setAttribute("msg", "잘못된 경로로 접근하였습니다");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
	
		List<Reservation> list = new ReservationService().loadReservationList2();  //나중에는 o_id를 받아서 자신에 관련된 예약목록만 승인해줘야하지
		System.out.println("ResWaitClientList 서블릿에서 list : "+list);
		

		request.setAttribute("reservations", list);
		request.getRequestDispatcher("/views/owner/resWaitClientList.jsp").forward(request, response);
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
