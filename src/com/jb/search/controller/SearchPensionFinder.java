package com.jb.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.vo.Pension;
import com.jb.search.model.service.SearchService;

/**
 * Servlet implementation class SearchPensionFinder
 */
@WebServlet("/search/pensionFinder")
public class SearchPensionFinder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPensionFinder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword=request.getParameter("keyword");
		String area=request.getParameter("area");
		String[] pFac=request.getParameterValues("pen_fac");
		String[] rFac=request.getParameterValues("room_fac");
		
		List<Pension> list=new SearchService().findPension(keyword,area,pFac,rFac);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/search/searchAll.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
