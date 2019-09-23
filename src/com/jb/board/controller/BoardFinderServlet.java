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
 * Servlet implementation class BoardFinderServlet
 */
@WebServlet("/board/boardFinder")
public class BoardFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;//처음 게시판에 호출되면 cPage가 설정되어 있지 않으므로 기본적으로 1로 호출되도록 예외처리 해줌.
		}

		//2.페이지당 몇개의 게시글을 출력할건지
		int numPerPage=10;

		//3.db에 접근해서 필요한 데이터만큼만 잘라서 가져오기(해당 페이지의 게시글만 가져옴)
		BoardService service = new BoardService();
		int totalBoard = service.selectCountBoard();

		String keyword = request.getParameter("keyword");
		List<Board> list = new BoardService().selectBoardFinder(cPage,numPerPage,keyword);

		//4.pageBar구성
		int totalPage=(int)Math.ceil((double)totalBoard/numPerPage);
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;//페이지바 시작 넘버
		int pageEnd=pageNo+pageBarSize-1;

		if(pageNo==1) {
			pageBar+="<span>&lt</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList?cPage="+(pageNo-1)+"'>&lt</a>";
		}

		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList?cPage="+(pageNo)+"'>"+(pageNo)+"</a>";
			}
			pageNo++;
		}

		if(pageNo>totalPage) {
			pageBar+="<span>&gt</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/notice/noticeList?cPage="+(pageNo)+"'>&gt</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list", list);
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
