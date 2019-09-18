package com.jb.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.service.ClientService;
import com.jb.client.model.vo.Client;
import com.jb.owner.model.service.OwnerService;
import com.jb.owner.model.vo.Owner;

/**
 * Servlet implementation class FindPwServlet
 */
@WebServlet("/client/findEmail")
public class FindEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String type=request.getParameter("loginType");
		String uid=request.getParameter("uid");
		
		System.out.println(type);
		System.out.println(uid);
		
		ClientService cs=new ClientService();
		OwnerService os=new OwnerService();
		
		
		if(type.equals("client")) {
			Client c=cs.findEmail(uid);
			if(c!=null) {
				request.setAttribute("findEmail", c);
				request.getRequestDispatcher("/views/client/findC_PwSMTP.jsp").forward(request, response);				
			}else {
				String msg="일치하는 회원 ID가 없습니다.";
				String loc="/views/client/findPW.jsp";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}
		}else {
			Owner o=os.findEmail(uid);
			if(o!=null) {
				request.setAttribute("findEmail", o);
				request.getRequestDispatcher("/views/owner/findO_PwSMTP.jsp").forward(request, response);
			}else {
				String msg="일치하는 회원 ID가 없습니다.";
				String loc="/views/client/findPW.jsp";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}
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
