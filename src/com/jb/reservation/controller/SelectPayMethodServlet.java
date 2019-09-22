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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String resName = request.getParameter("resName");
		String accountName = request.getParameter("accountName");
		String cId = request.getParameter("cId");
		String resCode = request.getParameter("resCode");
		String resPhone = request.getParameter("resPhone");

		// 분기처리를 위한 radio버튼 name
		String pay = request.getParameter("pay");

		Reservation resInfo = new ReservationService().selectOneReservation(resCode, cId);

		// 입금기한 설정 위해 현재 날짜 불러움
		Calendar now = Calendar.getInstance();
		int nowYear = now.get(Calendar.YEAR); // 현재 년
		int nowMonth = now.get(Calendar.MONTH) + 1; // 현재 월
		int nowDate = now.get(Calendar.DATE) + 7; // 현재 일

		String accountDay = nowYear + "년 " + nowMonth + "월 " + nowDate + "일 까지 입금해주세요.";

		// 기본금액+추가금액 = 총금액
		int rPrice = Integer.parseInt(request.getParameter("rPrice"));
		int rAddPrice = Integer.parseInt(request.getParameter("rAddPrice"));
		int totalPrice = rPrice + rAddPrice;

		request.setAttribute("resInfo", resInfo);
		request.setAttribute("cId", cId);
		request.setAttribute("resCode", resCode);
		request.setAttribute("accountName", accountName);
		request.setAttribute("accountDay", accountDay);
		request.setAttribute("resName", resName);
		request.setAttribute("resPhone", resPhone);
		request.setAttribute("totalPrice", totalPrice);

		// name이 pay인 radio button의 value가 account(무통장입금)이라면
		if (pay.equals("account")) {

			request.getRequestDispatcher("/views/reservation/paymentOnAccount.jsp").forward(request, response);

		} else {

			request.getRequestDispatcher("/views/reservation/kakaoPay.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
