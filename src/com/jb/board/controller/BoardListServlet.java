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

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;//
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=10;//
		
		int totalBoard=new BoardService().selectCountBoard();
		List<Board> list=new BoardService().selectBoard(cPage,numPerPage);
		
		int totalPage=(int)Math.ceil((double)totalBoard/numPerPage);
		
		String pageBar="";
		int pageSizeBar=5;
		int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
		int pageEnd=pageNo+pageSizeBar-1;
		
		if(pageNo==1) {
			pageBar+="<span> < </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/board/boardList?cPage="+(pageNo-1)+"'> > </a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/board/boardList?cPage="+pageNo+"'>"+pageNo+"</a>";
			}pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span> > </sapn>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/board/boardList?cPage="+(pageNo)+"'> > </a>";
		}
		System.out.println(pageBar);
		System.out.println(cPage);
		System.out.println(list);
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("cPage",cPage);
		request.setAttribute("list",list);
		
		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
