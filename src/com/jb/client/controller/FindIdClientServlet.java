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
 * Servlet implementation class FindIdClientServlet
 */
@WebServlet("/client/findId")
public class FindIdClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("uname");
		String email = request.getParameter("cemail");
		System.out.println(name);
		System.out.println(email);
		
		ClientService service = new ClientService();
		Client c = service.findId(name,email);
		
		System.out.println(c.getcId());
		System.out.println(c.getcEmail());
		
		request.setAttribute("findClient", c);
		
		request.getRequestDispatcher("/views/client/findCheck.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
