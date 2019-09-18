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
 * Servlet implementation class BoardCommentWriteServlet
 */
@WebServlet("/boardcomment/commentInsert")
public class BoardCommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content=request.getParameter("boardCommentContent");
		int cmmNo=Integer.parseInt(request.getParameter("cmmNo"));
		String writer=request.getParameter("boardCommentWriter");
		int level=Integer.parseInt(request.getParameter("boardCommentLevel"));
		int commentRef=Integer.parseInt(request.getParameter("boardCommentRef"));
		
		BoardComment bc=new BoardComment(level,writer,content,cmmNo,commentRef);
		int result=new BoardService().insertComment(bc);
		
		String msg="";
		String loc="/board/boardView?cmmNo="+cmmNo;
		String view="/views/common/msg.jsp";
		msg=result>0?"댓글등록을 완료했습니다.":"댓글등록에 실패했습니다.";
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
