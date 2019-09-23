package com.jb.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.PensionFacilitiesService;
import com.jb.pension.model.vo.PensionFacilities;

/**
 * Servlet implementation class OwnerModifyPensionServlet
 */
@WebServlet("/owner/modifyPension")
public class OwnerModifyPensionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerModifyPensionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면전환용 서블릿
		String pCode = request.getParameter("pCode");
		String oId = request.getParameter("oId");
		String pName = request.getParameter("pName");
		String pAddr = request.getParameter("pAddr");
		PensionFacilities pfc = new PensionFacilitiesService().selectPensionFac(pCode);
		
		request.setAttribute("pCode", pCode);
		request.setAttribute("oId", oId);
		request.setAttribute("pName", pName);
		request.setAttribute("pAddr", pAddr);
		request.setAttribute("pfc", pfc);
		request.getRequestDispatcher("/views/owner/modifyPension.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
