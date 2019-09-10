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
		
		String cId=request.getParameter("cId");
		
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
		c.setcId(request.getParameter("cId"));
		
		//자기만 수정할 수 있게 처리 
//		
//		if(!sessionCId.equals(request.getParameter("cId"))) {
//			
//			response.sendRedirect("/");
//			return;
//		}
		
		
		
		c.setcPw(request.getParameter("cPw"));
		c.setcName(request.getParameter("cName"));
		
		String  bBirth = request.getParameter("cBirth"); // 형식을 지켜야 함 yyyy-mm-dd
		java.sql.Date aBirth = java.sql.Date.valueOf(bBirth);
		
		c.setcBirth(aBirth); 
		
//		c.setcBirth(request.getParameter("cBirth"));
	
		c.setcEmail(request.getParameter("cEmail"));
		c.setcPhone(request.getParameter("cPhone"));
		c.setcAddr(request.getParameter("cAddr"));
		
	    
     int result=new ClientService().updateClient(c);
		
		String msg=result>0?"회원수정이 완료되었습니다.":"회원수정을 실패하였습니다.";
		String loc="/client/infoLoad?cId="+cId;
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
	
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
