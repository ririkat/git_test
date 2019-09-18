package com.jb.master.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.vo.Client;
import com.jb.pension.model.service.PensionService;
import com.jb.pension.model.vo.Pension;

/**
 * Servlet implementation class MasterWaitSearchServlet
 */
@WebServlet("/master/waitSearch")
public class MasterWaitSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterWaitSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Client loginClient = (Client) request.getSession().getAttribute("loginClient");
		if (loginClient==null || loginClient.getAuthority()!=1) {
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String type = request.getParameter("searchType");
		String keyword = request.getParameter("searchKeyword");
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 10;
		int totalPension = new PensionService().selectCountPension2(type,keyword);
		List<Pension> pensions = new PensionService().selectPensionList2(type,keyword,cPage,numPerPage);
		int totalPage = (int)Math.ceil((double)totalPension/numPerPage);
		String pageBar = "";
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		if(pageNo==1) {	//1일때는 이전이 없다
			pageBar += "<span>&laquo;</span>";
		}
		else {
			pageBar += "<a href="+request.getContextPath()
					+ "/master/waitSearch?cPage=" + (pageNo-1)
					+ "&searchType=" + type + "&searchKeyword=" + keyword
					+">&laquo;</a>";
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<span class='cPage'>"+pageNo+"</span>";
			}
			else {
				pageBar += "<a href="+request.getContextPath()
						+ "/master/waitSearch?cPage=" + pageNo
						+ "&searchType=" + type + "&searchKeyword=" + keyword
						+">" + pageNo + "&laquo;</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<span>&raquo;</span>";
		}
		else {
			pageBar += "<a href="+request.getContextPath()
					+ "/master/waitSearch?cPage=" + pageNo
					+ "&searchType=" + type + "&searchKeyword=" + keyword
					+">&laquo;</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pensions", pensions);
		request.setAttribute("searchType", type);
		request.setAttribute("searchKeyword", keyword);
		request.getRequestDispatcher("/views/master/waitPensionList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
