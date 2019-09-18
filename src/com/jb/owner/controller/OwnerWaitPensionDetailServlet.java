package com.jb.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.owner.model.vo.Owner;
import com.jb.pension.model.service.PensionService;
import com.jb.pension.model.vo.Pension;

/**
 * Servlet implementation class OwnerWaitPensionDetailServlet
 */
@WebServlet("/owner/waitDetail")
public class OwnerWaitPensionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerWaitPensionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//펜션정보 받아오기
		String pCode = request.getParameter("pensionCode");
		Pension pInfo = new PensionService().selectPension(pCode);
		
		request.setAttribute("pInfo", pInfo);
		request.getRequestDispatcher("/views/owner/waitPensionDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
