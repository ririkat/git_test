package com.jb.client.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.service.ClientService;
import com.jb.client.model.vo.Client;

/**
 * Servlet implementation class SignUpClientServlet
 */
@WebServlet(name="SignUp",urlPatterns="/client/signupclient")
public class SignUpClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("cid");
		String pw = request.getParameter("cpass");
		String name = request.getParameter("cname");
		
		String birthYY = request.getParameter("cbirthYY"); 
		String birthMM = request.getParameter("cbirthMM"); 
		String birthDD = request.getParameter("cbirthDD"); 
		Date birth = Date.valueOf(birthYY+"-"+birthMM+"-"+birthDD);
		
		
		String gender = request.getParameter("cgender");
		String email = request.getParameter("cemail");
		String phone = request.getParameter("cphone");
		
		String addr1 = request.getParameter("zonecode");
		String addr3 = request.getParameter("address");
		String addr4 = request.getParameter("address_etc");
		
		String addr = (addr1+" "+addr3+" "+addr4);
		
		Client c = new Client(id,pw,name,birth,gender,email,phone,addr);
		ClientService service = new ClientService();
		int result = service.insertClient(c);
		
		String msg = "";
		String loc = "/";
		msg = result>0? "회원가입 축하드립니다.":"회원가입이 실패하였습니다.";
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

