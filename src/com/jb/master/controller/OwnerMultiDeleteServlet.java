package com.jb.master.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.jb.owner.model.service.OwnerService;

/**
 * Servlet implementation class OwnerMultiDeleteServlet
 */
@WebServlet("/master/ownerMultiDelete")
public class OwnerMultiDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerMultiDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] ids = request.getParameterValues("oIds");
		for(int i=0; i<ids.length;i++) {
			System.out.println(ids[i]);
		}
//		System.out.println("받아온값들: "+ids);
		
		
//		int result = new OwnerService().deleteOwner(id);
		int result=1;
		String msg = result>0?"업주삭제완료":"업주삭제실패";
		String loc = result>0?"/master/ownerList":"/master/ownerList";
		
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
