package com.jb.client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
@WebServlet(name="LoginClient",urlPatterns="/client/login")
public class LoginClientEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginClientEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("loginid");
		String pw = request.getParameter("cpass");
		
		System.out.println(id);
		System.out.println(pw);
		
		ClientService service = new ClientService();
		Client c = service.selectId(id, pw);
		System.out.println(c);
		
		String view = "";
		if(c != null) {
		//세션 생성
		HttpSession session = request.getSession();
		session.setAttribute("loginClient", c);
		session.setMaxInactiveInterval(600);
		
		view = "/"; // index.jsp 연결~
		response.sendRedirect(request.getContextPath()+view);
//		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
		}else {
			String msg = "아이디나 비밀번호가 일치하지 않습니다.";
			request.setAttribute("msg", msg);
			view = "/views/common/msg.jsp";
			String loc = "/login";
			request.setAttribute("loc", loc);
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
