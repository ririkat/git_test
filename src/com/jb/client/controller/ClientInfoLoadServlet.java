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
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/client/infoLoad")
public class ClientInfoLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientInfoLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.여기가 뭘하는 서블릿인지 파악 -> 수정할 회원 1명의 정보를 가져와서 뷰(updateClientInfo.jsp) 화면으로 넘겨줘야함.
				//2.서블릿에서 서비스->dao로 뭘 넘기고? 뭘 가져와야 하는지 파악 
		
				String cId=request.getParameter("cId");
				
				ClientService service = new ClientService();
				Client c = service.selectClient(cId);
				request.setAttribute("client", c);

				
			
				request.getRequestDispatcher("/views/client/updateClientInfo.jsp")
				.forward(request,response);		
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
