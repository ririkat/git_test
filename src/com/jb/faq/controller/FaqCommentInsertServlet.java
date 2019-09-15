package com.jb.faq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.faq.model.service.FaqService;
import com.jb.faq.model.vo.FaqComment;

/**
 * Servlet implementation class FaqCommentInsertServlet
 */
@WebServlet("/faq/faqCommentInsert")
public class FaqCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int faqRef=Integer.parseInt(request.getParameter("faqRef"));
		String writer = request.getParameter("faqCommentWriter");
		int level=Integer.parseInt(request.getParameter("faqCommentLevel"));
		String content=request.getParameter("faqCommentContent");
		int commentRef=Integer.parseInt(request.getParameter("faqCommentRef"));
		
		FaqComment fc = new FaqComment(level,writer,content,faqRef,commentRef);
		int result=new FaqService().insertFaqComment(fc);
		
		String msg="";
		String loc="/faq/faqView?no="+faqRef;
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
