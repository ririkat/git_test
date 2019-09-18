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
@WebServlet("/board/boardCommentInsert")//대댓글 구현
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
		
		int cmmNo=Integer.parseInt(request.getParameter("cmmNo"));
		String writer=request.getParameter("writer");
		int level=Integer.parseInt(request.getParameter("level"));
		String comment=request.getParameter("comment");
		int commentRef=Integer.parseInt(request.getParameter("commentRef"));
		
		
		BoardComment bc=new BoardComment(level, writer, comment, cmmNo, commentRef);
		int result=new BoardService().insertComment(bc);
		
		String msg="";
		String loc="/board/boardView?cmmNo="+cmmNo;
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
