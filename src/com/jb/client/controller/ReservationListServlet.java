package com.jb.client.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.client.model.service.ReservationService;
import com.jb.client.model.vo.Reservation;
import com.jb.notice.model.service.NoticeService;
import com.jb.notice.model.vo.Notice;

/**
 * Servlet implementation class ReservationListServlet
 */
@WebServlet("/client/reservationList")
public class ReservationListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationListServlet() {
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
			cPage=1;
		}
		
		
		int numPerPage=10;
		
		
		ReservationService service = new ReservationService();
		int totalReservation = service.selectReservationCount();
		List<Reservation> list=service.selectReservationList(cPage,numPerPage);
		
		//4.pageBar구성
		int totalPage=(int)Math.ceil((double)totalReservation/numPerPage);
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span>&lt</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/client/mypageHome?cPage="+(pageNo-1)+"'>&lt</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/client/mypageHome?cPage="+(pageNo)+"'>"+(pageNo)+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>&gt</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/client/mypageHome?cPage="+(pageNo)+"'>&gt</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/client/mypageHome.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
