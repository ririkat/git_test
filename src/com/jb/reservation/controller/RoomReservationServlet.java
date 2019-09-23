package com.jb.reservation.controller;

import java.io.IOException;
import java.sql.Date;

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
		
		//값 받아오기
		Date resCheckIn = Date.valueOf(request.getParameter("checkIn"));//쳌인
		Date resCheckOut = Date.valueOf(request.getParameter("checkOut")); //아웃

		String resState = "N";//결제상태
		int resNop = Integer.parseInt(request.getParameter("resNop"));//인원

		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));//가격
		String rNo = request.getParameter("rNo");//방번
		String cId = request.getParameter("cId");//아이디


		//객체 생성
//		Reservation res = new Reservation(null,resCheckIn,resCheckOut,resState,resNop,totalPrice,rNo,cId);
		Reservation res = new Reservation(resCheckIn,resCheckOut,resState,resNop,totalPrice,rNo,cId);
		  
		//예약정보 추가. 추가하면서 현재 sequence 받아옴.
		//이는 지금 추가하는 예약의 resCode이다.
		int currval = new ReservationService().insertReservation(res);
		
		//=======
		
		String resCode = Integer.toString(currval);
		Reservation resInfo = new ReservationService().selectOneReservation(resCode, cId);
		
		//잠깐!! totalPrice -> roomView에서 계산해서 제대로 다시 가져와야댕. 일단 받았다치고 한다!?
		request.setAttribute("totalPrice", totalPrice);
		
		request.setAttribute("cId", cId);
		request.setAttribute("resInfo", resInfo);
		request.setAttribute("resCode", resCode);
		request.getRequestDispatcher("/views/reservation/payInfoView.jsp").forward(request, response);
				
		ReservationService service = new ReservationService();
		int result = service.insertReservation(res);

		System.out.println(resCheckIn);  
		System.out.println(resCheckOut); 
		System.out.println(res);
		System.out.println(rNo); 
		

//		String msg = "";
//		String loc = "/reservation/load";
//		msg = result>0?"등록성공":"등록 실패";
//		request.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
//		request.getRequestDispatcher("/reservation/reservationInfoLoad").forward(request, response);	
		
		
	}
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
