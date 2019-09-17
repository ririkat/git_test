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
 * Servlet implementation class OwnerOnePensionDelete
 */
@WebServlet("/owner/oneDelete")
public class OwnerOnePensionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerOnePensionDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 삭제할 펜션 코드, 업주아이디 받아오기
		String pCode = request.getParameter("pCode");
		String oId = request.getParameter("oId");

		int result = new PensionService().deleteOnePension(pCode, oId);

		String msg = result > 0 ? "삭제 완료" : "삭제 실패";
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
