package com.jb.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jb.client.model.service.ClientService;
import com.jb.client.model.vo.Client;

/**
 * Servlet implementation class LoginClientServlet
 */
@WebServlet("/client/login")
public class LoginClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("loginid");
		String pw = request.getParameter("loginpw");
		
		System.out.println(id);
		System.out.println(pw);
		
		
		ClientService service = new ClientService();
		Client c = service.selectId(id, pw);
		System.out.println(c);
		

		//세션 생성
		HttpSession session = request.getSession();
		session.setAttribute("loginClient", c);
		session.setMaxInactiveInterval(600);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
