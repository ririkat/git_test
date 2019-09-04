package com.jb.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//업데이트 위한 로직
		Client c = new Client();
		c.setcId(request.getParameter("cId"));
		c.setcPw(request.getParameter("cPw"));
		c.setcName(request.getParameter("cName"));
		
		String  bBirth = request.getParameter("cBirth"); // 형식을 지켜야 함 yyyy-mm-dd
		java.sql.Date aBirth = java.sql.Date.valueOf(bBirth);
		
		c.setcBirth(aBirth); 
		c.setcEmail(request.getParameter("cEmail"));
		c.setcPhone(request.getParameter("cPhone"));
		c.setcAddr(request.getParameter("cAddr"));
		
		int result = new ClientService().updateClient(c);
		
		String msg="";
		msg=result>0?"회원수정이 완료되었습니다.":"회원수정을 실패하였습니다.";
		String loc="/client/clientUpdate/?cId="+c.getcId();
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/client/updateClientInfo.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
