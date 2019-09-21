package com.jb.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cookie[] cookies=request.getCookies();
		String boardCookieVal="";
		boolean hasRead=false;//이 게시글을 읽었는지 확인
		
		int cmmNo=Integer.parseInt(request.getParameter("cmmNo"));

		if(cookies!=null) {
			out:
				for(Cookie c : cookies) {
					String name=c.getName();
					String value=c.getValue();
							
					if("boardCookie".equals(name)) {
						boardCookieVal=value;
						if(value.contains("|"+cmmNo+"|")) {
							hasRead=true;
							break out;
						}
					}
				}
			}
		if(!hasRead) {
			Cookie boardCookie=new Cookie("boardCookie", boardCookieVal+"|"+cmmNo+"|");
			boardCookie.setMaxAge(-1);
			response.addCookie(boardCookie);
		}
		Board b=new BoardService().selectBoardOne(cmmNo, hasRead);
		List<BoardComment> list=new BoardService().selectBoardComment(cmmNo);
		
		request.setAttribute("list", list);
		request.setAttribute("board", b);
		System.out.println(list);
		System.out.println(b);
		request.getRequestDispatcher("/views/board/boardView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
