package com.jb.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.RoomService;

/**
 * Servlet implementation class OwnerOneRoomDeleteServlet
 */
@WebServlet("/owner/oneRoomDelete")
public class OwnerOneRoomDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerOneRoomDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//삭제할 객실번호 받아오기
		String rNo = request.getParameter("rNo");
		String pCode = request.getParameter("pCode");
		String imgSrc = request.getParameter("imgSrc");
		
		int result = new RoomService().deleteOneRoom(rNo);
		
		String msg = result > 0 ? "삭제 완료" : "삭제 실패";
		String loc = "/owner/pensionDetail?pensionCode="+pCode+"&imgSrc="+imgSrc;
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
