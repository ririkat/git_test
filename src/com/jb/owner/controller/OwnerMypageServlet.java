package com.jb.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.owner.model.service.OwnerService;
import com.jb.owner.model.vo.Owner;

/**
 * Servlet implementation class OwnerMypageServlet
 */
@WebServlet("/owner/mypage")
public class OwnerMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//보류   선덕이와 header.jsp에서 마이페이지를 눌렀을때 어떤 서블릿으로 갈지
		
		//jsp에서 호출할때 쿼리스트링으로 세션의 id만 넘기고
		//전환 서블릿에서 id를 가지고 dao에 접근해 vo를 가져온뒤 setAttribute
		
		String id = request.getParameter("oId");
		System.out.println(id);
		OwnerService service = new OwnerService();
		Owner o = service.selectOwnerOne(id);
		request.setAttribute("owner", o);
		
		request.getRequestDispatcher("/views/owner/pensionListEnroll.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
