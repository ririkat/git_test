package com.jb.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.RoomFileService;
import com.jb.pension.model.service.RoomService;
import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.Room;
import com.jb.pension.model.vo.RoomFile;
import com.jb.search.model.service.SearchService;

/**
 * Servlet implementation class SearchDetailViewServlet
 */
@WebServlet("/search/detailView")
public class SearchDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pCode=request.getParameter("pCode");
		
		Pension p = new SearchService().selectDetail(pCode);
		
		request.setAttribute("pension", p);
		request.getRequestDispatcher("/views/reservation/roomView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
