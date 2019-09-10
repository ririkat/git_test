package com.jb.notice.controller;

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
import com.jb.notice.model.service.NoticeService;
import com.jb.notice.model.vo.Notice;
import com.jb.notice.model.vo.NoticeComment;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/notice/noticeView")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//번호를 받아와서 해당 notice 객체 하나를 받아와야함
		Cookie[] cookies = request.getCookies();
		String noticeCookieVal="";
		boolean hasRead=false;//이 게시글을 읽었는지 확인
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		if(cookies!=null) {
			out:
				for(Cookie c : cookies) {
					String name=c.getName();
					String value=c.getValue();
					if("noticeCookie".equals(name)) {
						noticeCookieVal=value;
						if(value.contains("|"+no+"|")) {
							hasRead=true;
							break out;
						}
					}
				}
		}
		if(!hasRead) {
			Cookie noticeCookie=new Cookie("noticeCookie",noticeCookieVal+"|"+no+"|");
			noticeCookie.setMaxAge(-1);
			response.addCookie(noticeCookie);
		}
		Notice n=new NoticeService().selectNoticeOne(no,hasRead);
		List<NoticeComment> list = new NoticeService().selectNoticeComment(no);
		
		request.setAttribute("notice", n);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/notice/noticeView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
