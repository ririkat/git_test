package com.jb.master.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.vo.Client;
import com.jb.owner.model.service.OwnerService;
import com.jb.owner.model.vo.Owner;
import com.jb.pension.model.service.PensionService;

/**
 * Servlet implementation class MasterWaitOwnerSearchServlet
 */
@WebServlet("/master/waitOwnerSearch")
public class MasterWaitOwnerSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterWaitOwnerSearchServlet() {
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
		int totalOwner = new OwnerService().selectCountOwner2(type,keyword);
		List<Owner> owners = new OwnerService().selectOwnerList2(type,keyword,cPage,numPerPage);
		int totalPage = (int)Math.ceil((double)totalOwner/numPerPage);
		String pageBar = "";
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		if(pageNo==1) {	//1일때는 이전이 없다
			pageBar += "<span>&laquo;</span>";
		}
		else {
			pageBar += "<a href="+request.getContextPath()
					+ "/master/waitOwnerSearch?cPage=" + (pageNo-1)
					+ "&searchType=" + type + "&searchKeyword=" + keyword
					+">&laquo;</a>";
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<span class='cPage'>"+pageNo+"</span>";
			}
			else {
				pageBar += "<a href="+request.getContextPath()
						+ "/master/waitOwnerSearch?cPage=" + pageNo
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
					+ "/master/waitOwnerSearch?cPage=" + pageNo
					+ "&searchType=" + type + "&searchKeyword=" + keyword
					+">&laquo;</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("owners", owners);
		request.setAttribute("searchType", type);
		request.setAttribute("searchKeyword", keyword);
		request.getRequestDispatcher("/views/master/waitOwnerList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
