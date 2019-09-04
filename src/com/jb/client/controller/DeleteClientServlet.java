package com.jb.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import com.jb.client.model.service.ClientService;

/**
 * Servlet implementation class DeleteClientServlet
 */
@WebServlet("/client/deleteClient")

public class DeleteClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("cId");
		String pw = request.getParameter("cPw");
		
		 int result=new ClientService().deleteClient(id,pw);
		 
		 String msg = result>0?"회원탈퇴완료":"회원탈퇴실패";
		 String loc = result>0?"/logout":"/client/clientDelete?cId="+id;
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
