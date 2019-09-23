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
      
      String resState = "N";//결제상태
      Date resCheckIn = Date.valueOf(request.getParameter("checkIn"));//쳌인
      Date resCheckOut = Date.valueOf(request.getParameter("checkOut")); //아웃
      int resNop = Integer.parseInt(request.getParameter("resNo_")); //인원
      int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));//가격
      String rNo = request.getParameter("rNo");//방번
      String cId = request.getParameter("cId");//아이디
            
      Reservation res = new Reservation(null,resCheckIn,resCheckOut,resState,resNop,totalPrice,rNo,cId,null);
      ReservationService service = new ReservationService();
      int result = service.insertReservation(res);	// result에 resCode가 들어있음
     
      System.out.println("RoomReservationServlet의 result(==resCode) : "+result);
      System.out.println("RoomReservationServlet의 cId : "+cId);
      System.out.println("--------------------");
      String resCode = Integer.toString(result);

//      System.out.println(resCheckIn);  
//      System.out.println(resCheckOut); 
//      System.out.println(res);
//      System.out.println(rNo);
      
      String msg = "";
      String loc = "";
      if(result>0) {
    	  msg = "등록 성공";
    	  loc = "/reservation/reservationInfoLoad?resCode="+resCode+"&cId="+cId;
      }
      else {
    	  msg = "등록 실패";
    	  loc = "/";
      }

      request.setAttribute("msg", msg);
      request.setAttribute("loc", loc);
      request.getRequestDispatcher("/reservation/reservationInfoLoad").forward(request, response);   
 
   }
      


   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}