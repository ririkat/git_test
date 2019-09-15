package com.jb.faq.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.faq.model.service.FaqService;

/**
 * Servlet implementation class FaqDeleteServlet
 */
@WebServlet("/faq/faqDelete")
public class FaqDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = getServletContext().getRealPath("/");
		String saveDir = root+"/upload/faq/";
		//경로 한번에 설정하기
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		int no = Integer.parseInt(request.getParameter("faqNo"));
		System.out.println(no);
		
		int result = new FaqService().deleteFaqOne(no);
		
		String msg="";
		String loc="";
		
		if(result<=0) {
			msg="게시글 삭제에 실패했습니다.";
			loc="/faq/faqView?faqNo="+no;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			File remove=new File(saveDir+request.getParameter("oriren"));
			remove.delete();//파일삭제
			msg="게시글 삭제가 완료되었습니다.";
			loc="/faq/faqList";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
