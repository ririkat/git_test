package com.jb.owner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.owner.model.service.OwnerService;
import com.jb.owner.model.vo.Owner;

/**
 * Servlet implementation class OwnerInfoServlet
 */
@WebServlet("/owner/ownerInfo")
public class OwnerInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("oId");
		
		OwnerService service = new OwnerService();
		Owner o = service.selectOwnerOne(id);
		request.setAttribute("owner", o);
		System.out.println("info서블릿에서: "+o);
		request.getRequestDispatcher("/views/owner/ownerInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
