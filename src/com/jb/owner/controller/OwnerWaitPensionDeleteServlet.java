package com.jb.owner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.owner.model.vo.Owner;
import com.jb.pension.model.service.PensionService;

/**
 * Servlet implementation class OwnerWaitPensionDeleteServlet
 */
@WebServlet("/owner/waitDelete")
public class OwnerWaitPensionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerWaitPensionDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 삭제할 펜션 코드, 업주아이디 받아오기
		String delList = request.getParameter("delPensionList");
		String oId = request.getParameter("oId");

		int result = new PensionService().deletePensionList(delList);

		String msg = result > 0 ? "펜션 삭제 완료" : "펜션 삭제 실패";
		String loc = "/owner/pensionList?oId="+oId;
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
