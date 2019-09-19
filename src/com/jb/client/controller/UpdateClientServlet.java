package com.jb.client.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jb.client.model.service.ClientService;
import com.jb.client.model.vo.Client;

/**
 * Servlet implementation class UpdateClientServlet
 */
@WebServlet("/client/clientUpdate")
public class UpdateClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateClientServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cId = request.getParameter("cId");

//		
//		//login하지 않으면 수정할 수 없게 
//		HttpSession session= request.getSession();
//		Object object = session.getAttribute("loginClient");
//		if(object ==null) {
//			
//			response.sendRedirect("/");
//			return;
//		}

		Client c = new Client();

//		String sessionCId = (String)object;
//		

		// 자기만 수정할 수 있게 처리
//		
//		if(!sessionCId.equals(request.getParameter("cId"))) {
//			
//			response.sendRedirect("/");
//			return;
//		}

		c.setcId(request.getParameter("cId"));
		c.setcPw(request.getParameter("cPw"));
		c.setcName(request.getParameter("cName"));
		c.setcGender(request.getParameter("cGender"));

		c.setcEmail(request.getParameter("cEmail"));
		c.setcPhone(request.getParameter("cPhone"));
		c.setcAddr(request.getParameter("cAddr"));

		String cBirthYY = request.getParameter("cBirthYY");
		String cBirthMM = request.getParameter("cBirthMM");
		String cBirthDD = request.getParameter("cBirthDD");
		String cBirth = cBirthYY + "-" + cBirthMM + "-" + cBirthDD;

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = new java.util.Date();
		try {
			utilDate = transFormat.parse(cBirth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		System.out.println("utilDate: " + utilDate);
		System.out.println("sqlDate: " + sqlDate);
		c.setcBirth(sqlDate);

		String zonecode = request.getParameter("zonecode");
		String addr = request.getParameter("address");
		String addrEtc = request.getParameter("address_etc");

		String cAddr = "우)"+zonecode+"|"+addr+"|"+addrEtc;

		c.setcAddr(cAddr);

		

		int result = new ClientService().updateClient(c);

		String msg = result > 0 ? "회원수정이 완료되었습니다." : "회원수정을 실패하였습니다.";
		String loc = "/client/infoLoad?cId=" + cId;

		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

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
