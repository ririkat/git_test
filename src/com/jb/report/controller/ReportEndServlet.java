package com.jb.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.board.model.service.BoardService;
import com.jb.board.model.vo.Board;
import com.jb.client.model.service.ClientService;
import com.jb.client.model.vo.Client;

/**
 * Servlet implementation class ReportEndServlet
 */
@WebServlet("/report/reportEnd")
public class ReportEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cmmNo=Integer.parseInt(request.getParameter("cmmNo"));
		
		Board b=new BoardService().findBoardWriter(cmmNo);//게시글 번호로 해당 작성자를 찾아오기위해
		request.setAttribute("board", b);
		
		String cId=b.getcId();
		String title=b.getTitle();
		
		int cBLcount=0;
		String readstatus="n";
		Client c=new Client(cId,cBLcount,readstatus);
		ClientService service=new ClientService();
		int result=service.clientReport(c);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
