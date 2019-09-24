package com.jb.search.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.vo.Pension;
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
		String from=(request.getParameter("from"));
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date fromDate = new java.util.Date();
		try {
			fromDate = transFormat.parse(from);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date fromSqlDate = new java.sql.Date(fromDate.getTime());
		
		
		String to=(request.getParameter("to"));
		java.util.Date toDate = new java.util.Date();
		try {
			toDate = transFormat.parse(to);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date toSqlDate = new java.sql.Date(toDate.getTime());
		

		Pension p = new SearchService().selectDetail(pCode,fromSqlDate,toSqlDate);
		String view="";
		String msg="";
		String loc="";
		if(p==null || p.getRoomList()==null) {
			msg = "예약 가능한 방이 존재하지 않습니다. 검색 화면으로 이동합니다.";
			request.setAttribute("msg", msg);
			view = "/views/common/msg.jsp";
			loc = "/search/load";
			request.setAttribute("loc", loc);
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}else {
			request.setAttribute("pension", p);
			request.setAttribute("from", from);
			request.setAttribute("to", to);
			request.getRequestDispatcher("/views/reservation/roomView.jsp").forward(request, response);
		}
		
		
		
		System.out.println("서블릿에서 p" + p);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
