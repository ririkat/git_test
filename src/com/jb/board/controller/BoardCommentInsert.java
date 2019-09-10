package com.jb.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.board.model.service.BoardService;
import com.jb.board.model.vo.BoardComment;

/**
 * Servlet implementation class BoardCommentInsert
 */
@WebServlet("/board/commentInsert")
public class BoardCommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo=Integer.parseInt(request.getParameter("bNo"));
		String writer=request.getParameter("writer");
		int level=Integer.parseInt(request.getParameter("level"));
		String comment=request.getParameter("comment");
		int coNo=Integer.parseInt(request.getParameter("coNo"));
		
		BoardComment bc=new BoardComment(level, writer, comment, bNo, coNo);
		int result=new BoardService().insertComment(bc);
		
		String msg="";
		String loc="/board/boardCiew?bNo="+bNo;
		String view="/views/common/msg.jsp";
		msg=result>0?"댓글등록 성공":"댓글등록 실패";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
