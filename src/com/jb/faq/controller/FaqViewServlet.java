package com.jb.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.faq.model.service.FaqService;
import com.jb.faq.model.vo.Faq;
import com.jb.faq.model.vo.FaqComment;

/**
 * Servlet implementation class FaqViewServlet
 */
@WebServlet("/faq/faqView")
public class FaqViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		String faqCookieVal="";
		boolean hasRead=false;//이 게시글을 읽었는지 확인
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		if(cookies!=null) {
			out:
				for(Cookie c : cookies) {
					String name=c.getName();
					String value=c.getValue();
					if("faqCookieVal".equals(name)) {
						faqCookieVal=value;
						if(value.contains("|"+no+"|")) {
							hasRead=true;
							break out;
						}
					}
				}
		}
		if(!hasRead) {
			Cookie faqCookie=new Cookie("faqCookieVal",faqCookieVal+"|"+no+"|");
			faqCookie.setMaxAge(-1);
			response.addCookie(faqCookie);
		}
		Faq f=new FaqService().selectFaqOne(no,hasRead);
		List<FaqComment> list = new FaqService().selectFaqComment(no);
		
		request.setAttribute("faq", f);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/faq/faqView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
