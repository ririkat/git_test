package com.jb.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.owner.model.service.OwnerService;

/**
 * Servlet implementation class OwnerUpdatePasswordEndServlet
 */
@WebServlet("/owner/updatePasswordEnd2")
public class OwnerUpdatePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerUpdatePasswordEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("oId");
		String pwNew  = request.getParameter("oPwNew");
		
		int result = new OwnerService().updateOwnerPassword(id,pwNew);
		
		String msg="";
		String loc="/owner/updatePassword?oId="+id;
		
		switch(result) {
		case 0 : msg="(업주)비밀번호 변경 실패. 다시 시도해주세요";break;
		case -1 : msg="현재 비밀번호와 다른 비밀번호를 입력했습니다";break;
		default : msg="비밀번호 변경 완료";break;
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
