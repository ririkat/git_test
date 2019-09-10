package com.jb.master.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.service.ClientService;
import com.jb.client.model.vo.Client;

/**
 * Servlet implementation class MasterClientSearchServlet
 */
@WebServlet("/master/clientSearch")
public class MasterClientSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterClientSearchServlet() {
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
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 10;

		int totalClient = 0;
		List<Client> clients = null;
		
		String type = request.getParameter("searchType");
		String keyword = request.getParameter("searchKeyword");

		//블랙리스트카운트로 검색시
		if(type.equals("c_blcount")) {
			totalClient = new ClientService().selectCountForBlack(type,keyword);
			clients = new ClientService().selectBlackList(type,keyword,cPage,numPerPage);
		}
		
		//그 외(아이디,이름,전화번호)로 검색시
		else {
			totalClient = new ClientService().selectCountClient(type,keyword);
			clients = new ClientService().selectClientList(type,keyword,cPage,numPerPage);
		}
		
		
		int totalPage = (int)Math.ceil((double)totalClient/numPerPage);
		String pageBar = "";
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		if(pageNo==1) {	//1일때는 이전이 없다
			pageBar += "<span>&laquo;</span>";
		}
		else {
			pageBar += "<a href="+request.getContextPath()
			+ "/master/clientSearch?cPage=" + (pageNo-1)
			+ "&searchType=" + type + "&searchKeyword=" + keyword
			+">&laquo;</a>";
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<span class='cPage'>"+pageNo+"</span>";
			}
			else {
				pageBar += "<a href="+request.getContextPath()
				+ "/master/clientSearch?cPage=" + pageNo
				+ "&searchType=" + type + "&searchKeyword=" + keyword
				+">" + pageNo + "</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<span>&raquo;</span>";
		}
		else {
			pageBar += "<a href="+request.getContextPath()
			+ "/master/clientSearch?cPage=" + pageNo
			+ "&searchType=" + type + "&searchKeyword=" + keyword
			+">&laquo;</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("clients", clients);
		request.setAttribute("searchType", type);
		request.setAttribute("searchKeyword", keyword);
		
		request.getRequestDispatcher("/views/master/clientList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
