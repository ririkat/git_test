package com.jb.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.board.model.service.BoardService;
import com.jb.board.model.vo.Board;
import com.jb.board.model.vo.BoardComment;

/**
 * Servlet implementation class boardView
 */
@WebServlet("/board/boardView")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo=Integer.parseInt(request.getParameter("bNo"));
		Board b=new BoardService().selectBoardOne(bNo);
		
		request.setAttribute("board", b);
		request.getRequestDispatcher("/views/board/boardView.jsp").forward(request, response);
		
		
		List<BoardComment> list=new BoardService().selectBoardComment(bNo);
		request.setAttribute("list", list);
		
		
//		//새로고침을 통해 조회수가 올라가는 현상은
//		//쿠키를 통해서 제한
//		Cookie[] cookies=request.getCookies();
//		String boardCookieVal="";
//		boolean hasRead=false;//이 게시글을 읽었는지 확인
//		
//		if(cookies!=null) {
//			out:
//			for(Cookie c : cookies) {
//				String name=c.getName();
//				String value=c.getValue();
//						
//				if("boardCookie".equals(name)) {
//					boardCookieVal=value;
//					if(value.contains("|"+bNo+"|")) {
//						hasRead=true;
//						break;
//					}
//				}
//			}
//		}
//		if(!hasRead) {
//			Cookie boardCookie=new Cookie("boardCookie", boardCookieVal+"|"+bNo+"|");
//			boardCookie.setMaxAge(-1);
//			response.addCookie(boardCookie);
//		}
//		
//
//		
//		Board b=new BoardService().selectBoard(bNo, hasRead);
		
//		
//		request.setAttribute("board", b);
		
//		
//		request.getRequestDispatcher("/views/board/boardView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
