package com.jb.reservation.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.reservation.model.service.ReservationService;
import com.jb.reservation.model.vo.Reservation;

/**
 * Servlet implementation class PayInfoUpdateServlet
 */
@WebServlet("/reservation/payInfoUpdate")
public class PayInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayInfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//현희 기준(결제기능) 4번쨰 서블릿 !!
		
		//client의 정보와 예약자의 정보가 다를경우 set 해주는 서블릿
		//기본가격,추가인원가격,총금액 보여주고 등록해주는 서블릿
		
		//paySuccessViewServlet으로 넘겨줌
		
		
				Reservation res = new Reservation();
				String payCode=request.getParameter("payCode");
				
				
				//client 정보 바꼈으면 수정/등록해줘야함
				
				res.getClient().setcName(request.getParameter("cName"));
				res.getClient().setcPhone(request.getParameter("cPhone"));
				res.getClient().setcEmail(request.getParameter("cEmail"));
				//r.getClient().setcBirth(request.getParameter("cBirth"));

				String cBirth = request.getParameter("cBirth");
				
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utilDate = new java.util.Date();
				try {
					utilDate = transFormat.parse(cBirth);
				}catch(ParseException e) {
					e.printStackTrace();
				}
				java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
				System.out.println("utilDate: "+utilDate);
				System.out.println("sqlDate: "+sqlDate);
				res.getClient().setcBirth(sqlDate);
		        
		      //기본가격,추가인원가격,총금액 넘겨주고 등록
		        
				res.getRoom().setrPrice(Integer.parseInt(request.getParameter("rPrice")));
				res.getRoom().setrAddPrice(Integer.parseInt(request.getParameter("rAddPrice")));
				res.setTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));
				

				String payMethod = request.getParameter("payMethod");
		        
				if("kakaopay".equals(payMethod)) {
					
					res.setResState("Y");
					
					
				}else {
					
					res.setResState("N");
					
					
				}
		        
				int result = new ReservationService().updatePayInfo(res);
				
				String loc="/reservation/paySuccessView?resCode="+res.getResCode();
				String msg="";
				msg=result>0?"결제 정보 저장에 성공하였습니다.":"결제 정보 저장에 실패하였습니다.관리자에게 문의하세요.";
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
