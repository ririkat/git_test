package com.jb.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.notice.model.service.NoticeService;
import com.jb.notice.model.vo.NoticeComment;

/**
 * Servlet implementation class NoticeCommentInsertServlet
 */
@WebServlet("/notice/noticeCommentInsert")
public class NoticeCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeRef=Integer.parseInt(request.getParameter("noticeRef"));
		String writer = request.getParameter("noticeCommentWriter");
		int level=Integer.parseInt(request.getParameter("noticeCommentLevel"));
		String content=request.getParameter("noticeCommentContent");
		int commentRef=Integer.parseInt(request.getParameter("noticeCommentRef"));
		
		NoticeComment nc = new NoticeComment(level,writer,content,noticeRef,commentRef);
		int result=new NoticeService().insertComment(nc);
		
		String msg="";
		String loc="/notice/noticeView?no="+noticeRef;
		String view="/views/common/msg.jsp";
		msg=result>0?"댓글등록 성공":"댓글등록 실패";
		request.setAttribute("msg",msg);
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
