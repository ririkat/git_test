package com.jb.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jb.owner.model.service.OwnerService;
import com.jb.owner.model.vo.Owner;

/**
 * Servlet implementation class LoginOwnerServlet
 */
@WebServlet("/owner/login")
public class LoginOwnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOwnerServlet() {
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
		
		OwnerService service = new OwnerService();
		Owner o = service.selectId(id,pw);
		System.out.println(o);
		
		String view = "";
		if(o!= null) {
			//세션생성
			HttpSession session = request.getSession();
			session.setAttribute("loginOwner", o);
			session.setMaxInactiveInterval(600);
			
			view = "/"; //index.jsp연결
			response.sendRedirect(request.getContextPath()+view);
			
		}else {
			String msg = "(업주) 아이디나 비밀번호가 일치하지 않습니다.";
			request.setAttribute("msg", msg);
			view ="/views/common/msg.jsp";
			String loc = "/views/client/login.jsp";
			request.setAttribute("loc", loc);
			request.getRequestDispatcher(view).forward(request, response);
			
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
