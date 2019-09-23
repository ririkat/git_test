package com.jb.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.service.ClientService;

/**
 * Servlet implementation class updatePasswordEndServlet
 */
@WebServlet(name="UpdatePwClient", urlPatterns="/client/updatePasswordEnd")
public class updatePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePasswordEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("cId");
//		String pw = request.getParameter("cPw");
		String pwNew  = request.getParameter("cPw");
		System.out.println("id: "+id+"// pw: "+pwNew);
	
		int result = new ClientService().updatePassword(id,pwNew);
		
		String msg ="";
		String loc="/";  //updatePassword(로그인한 상태)와 pw찾기(로그인 안한상태) 두곳에서 updatePasswordEnd 서블릿 호출하므로 loc 메인화면으로 변경
		
		switch(result) {
			case 0 : msg="비밀번호 변경 실패. 다시 시도해주세요.";break;
			case -1 : msg="현재 비밀번호와 다른 비밀번호를 입력하셨습니다.";break;
			default : msg="비밀번호  변경 완료"; break;
		}
		
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
